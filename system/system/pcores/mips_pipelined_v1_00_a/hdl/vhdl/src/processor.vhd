
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

use work.mips_constant_pkg.all;
use work.pipeline_types.all;

-- Processor interface, as defined by the provided toplevel implementation
entity processor is    
    generic  (
        MEM_ADDR_BUS    : integer    := 32;
        MEM_DATA_BUS    : integer    := 32 );
    port ( 
        clk               : in std_logic;
        reset             : in std_logic;
        processor_enable  : in std_logic;
        imem_address      : out std_logic_vector (MEM_ADDR_BUS-1 downto 0);
        imem_data_in      : in std_logic_vector (MEM_DATA_BUS-1 downto 0);
        dmem_data_in      : in std_logic_vector (MEM_DATA_BUS-1 downto 0);
        dmem_address      : out std_logic_vector (MEM_ADDR_BUS-1 downto 0);
        dmem_address_wr   : out std_logic_vector (MEM_ADDR_BUS-1 downto 0);
        dmem_data_out     : out std_logic_vector (MEM_DATA_BUS-1 downto 0);
        dmem_write_enable : out std_logic
    );
end processor;

architecture Behaviour of processor is

    -- Pipeline stages
    component stage_pc_next is
        port (
            clk            : in std_logic;
            reset          : in std_logic;
            pc_next        : in pc_next_t;
            enable         : in std_logic;

            pc_current     : out std_logic_vector(N-1 downto 0);
            pc_incremented : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
    component stage_ex is
        port (
            input : in idex_t;
            output: out exmem_t
        );
    end component;
    
    component stage_instruction_decode is
    port (
        clk   : in std_logic;
        reset : in std_logic;
        wb    : in wb_t;
        ifid  : in ifid_t;
        idex  : out idex_t
    );
    end component;
    
    -- Pipeline registers
    component register_ifid is
    port(
        input  : in ifid_t;
        clk    : in std_logic;
        reset  : in std_logic;
        output : out ifid_t        
    );
    end component;

    component register_idex is
    port(
        input: in idex_t;
        clk  : in std_logic;
        reset  : in std_logic;
        output: out idex_t        
    );
    end component;

    component register_exmem is
        port(
            input: in exmem_t;
            clk  : in std_logic;
            reset  : in std_logic;        
            output: out exmem_t        
        );
    end component;
    
    component register_memwb is
    port(
        input: in memwb_t;
        clk  : in std_logic;
        reset  : in std_logic;
        output: out memwb_t        
    );
    end component;
    
    -- Pipeline register signals
    signal ifid_in, ifid_out : ifid_t;
    signal idex_in, idex_out : idex_t;
    signal exmem_in, exmem_out : exmem_t;
    signal memwb_in, memwb_out : memwb_t;
    
    -- Out singals from wb stage to reg file
    signal wb_out : wb_t;
    
    -- Program counters
    signal pc_current, pc_incremented, pc_next : std_logic_vector(N-1 downto 0) := X"00000000";
    
    signal pc_next_in : pc_next_t;
begin
    ifid_reg : register_ifid port map(input => ifid_in, clk => clk, reset => '0', output => ifid_out);
    idex_reg : register_idex port map(input => idex_in, clk => clk, reset => '0', output => idex_out);
    exmem_reg : register_exmem port map(input => exmem_in, clk => clk, reset => '0', output => exmem_out);
    memwb_reg : register_memwb port map(input => memwb_in, clk => clk, reset => '0', output => memwb_out);
    
    pc_next_stage : stage_pc_next port map(
        clk => clk, 
        reset => reset, 
        pc_next => pc_next_in,
        enable => processor_enable,
        
        pc_current => pc_current,
        pc_incremented => pc_incremented
    );
    
    ex_stage : stage_ex port map(input => idex_out, output => exmem_in);
    
    id_stage : stage_instruction_decode port map(
        clk => clk,
        reset => reset,
        ifid => ifid_out,
        idex => idex_in,
        
        -- Write back signals from the write back stage
        wb => wb_out
    );
    
    -- IF Stage
    imem_address <= pc_current;
    ifid_in.instruction <= imem_data_in;    
    ifid_in.pc_incremented <= pc_incremented;
    
    -- MEM stage
    dmem_address <= exmem_out.alu_result;
    dmem_address_wr <= exmem_out.alu_result;
    dmem_data_out <= exmem_out.write_mem_data;
    dmem_write_enable <= exmem_out.ctrl_m.mem_write;
    memwb_in.mem_data <= dmem_data_in;
    memwb_in.alu_data <= exmem_out.alu_result;
    memwb_in.ctrl_wb <= exmem_out.ctrl_wb;
    memwb_in.write_reg_addr <= exmem_out.write_reg_addr;
    
    -- PC next mux, TODO extract out of processor(?)
    pc_next_in_mux : process(exmem_out)
    begin
        if exmem_out.ctrl_m.jump = '1' then
            pc_next_in.jump <= exmem_out.jump_target;
            pc_next_in.src <= '1';
        elsif exmem_out.ctrl_m.branch = '1' and exmem_out.flags.zero = '1' then
            pc_next_in.jump <= exmem_out.branch_target;
            pc_next_in.src <= '1';
        else
            pc_next_in.jump <= (others => '0');
            pc_next_in.src <= '0';
        end if;
    end process;
    
    -- WB stage
    wb_out.reg_write <= memwb_out.ctrl_wb.reg_write;
    wb_out.write_addr <= memwb_out.write_reg_addr;
    
    -- Register write data mux, TODO extract out of processor
    write_data_mux : process(memwb_out)
    begin
        if memwb_out.ctrl_wb.mem_to_reg = '1' then
            wb_out.write_data <= memwb_out.mem_data;
        else 
            wb_out.write_data <= memwb_out.alu_data;
        end if;
    end process;
        
    
end architecture;
