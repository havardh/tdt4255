----------------------------------------------------------------------------------
-- Processor implementation
-- 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.mips_constant_pkg.all;

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

architecture Behavioral of processor is    

    component control_unit is
        port ( 
            clk        : in std_logic;
            reset      : in std_logic; 
            opcode     : in std_logic_vector (5 DOWNTO 0);
            enable     : in std_logic;
            reg_dst    : out std_logic;
            branch     : out std_logic;
            mem_read   : out std_logic;
            mem_to_reg : out std_logic;
            alu_op     : out ALU_OP;
            mem_write  : out std_logic;
            alu_src    : out std_logic;
            reg_write  : out std_logic;
            jump       : out std_logic;
            pc_latch   : out std_logic := '0';
            link       : out std_logic
         );
    end component;
    
    component alu_control is
        port ( 
            alu_op    : in ALU_OP;
            func      : in STD_LOGIC_VECTOR (5 downto 0);
            alu_input : out ALU_INPUT
        );
    end component;
    
    component register_file is
        port (
            clk        : in std_logic;                
            reset      : in std_logic;                
            rw         : in std_logic;                
            rs_addr    : in std_logic_vector (RADDR_BUS-1 downto 0); 
            rt_addr    : in std_logic_vector (RADDR_BUS-1 downto 0); 
            rd_addr    : in std_logic_vector (RADDR_BUS-1 downto 0);
            write_data : in std_logic_vector (DDATA_BUS-1 downto 0); 
            rs         : out std_logic_vector (DDATA_BUS-1 downto 0);
            rt         : out std_logic_vector (DDATA_BUS-1 downto 0)
        );
    end component;

    component adder is         
        generic (
            N: natural
        );
        port(
            x    : in std_logic_vector (31 downto 0);
            y    : in std_logic_vector (31 downto 0);
            cin  : in std_logic;
            cout : out std_logic;
            r    : out std_logic_vector (31 downto 0)
        );
    end component;
    
    component sign_extend is
        port (
            a : in std_logic_vector(15 downto 0);
            r : out std_logic_vector(31 downto 0)
        );
    end component;
    
    component alu is
        generic (N : natural := 32);
        port (
            x       : in std_logic_vector(N-1 downto 0);
            y       : in std_logic_vector(N-1 downto 0);
            alu_in  : in ALU_INPUT;
            r       : out std_logic_vector(N-1 downto 0);
            flags   : out ALU_FLAGS
        );
    end component;

    -- Control unit signals
    signal mem_write_enable : std_logic := '0';
    signal pc_latch         : std_logic := '0';
    signal data_write       : std_logic := '0';
    signal reg_dst          : std_logic := '0';
    signal mem_to_reg       : std_logic := '0';
    signal reg_write        : std_logic := '0';
    signal alu_src          : std_logic := '0';
    signal alu_op           : ALU_OP;
    signal branch           : std_logic := '0';
    signal mem_read         : std_logic := '0';
    signal jump             : std_logic := '0';   
    signal link             : std_logic := '0';
    signal reg_write_data   : std_logic_vector(31 downto 0); 
    
    -- Program counter registers
    signal PC        : std_logic_vector(31 downto 0) := (others => '0');
    signal PC_ADD    : std_logic_vector(31 downto 0) := (others => '0');
    signal PC_JUMP   : std_logic_vector(31 downto 0) := (others => '0');
    signal PC_BRANCH : std_logic_vector(31 downto 0) := (others => '0');    
    signal PC_NEXT   : std_logic_vector(31 downto 0) := (others => '0');    
    
    signal sign_extended : std_logic_vector(31 downto 0);
    signal shifted       : std_logic_vector(31 downto 0);
    signal instr_shifted : std_logic_vector(31 downto 0);
    
    signal rd_addr : std_logic_vector(4 downto 0);
    
    -- ALU
    signal alu_out : std_logic_vector(31 downto 0);
    signal rt : std_logic_vector(31 downto 0);
    signal rs : std_logic_vector(31 downto 0);
    signal alu_in_y : std_logic_vector(31 downto 0);
    signal alu_input : ALU_INPUT;
    signal flags : ALU_FLAGS;

    constant LINK_REG : std_logic_vector(4 downto 0) := "11111";

begin
    
    -- control unit
    ctrl_unit : control_unit
        port map (
            clk => clk,
            reset => reset,
            opcode => imem_data_in(31 downto 26),
            enable => processor_enable,
            branch => branch,
            mem_read => mem_read,
            pc_latch => pc_latch,
            mem_write => mem_write_enable,
            reg_dst => reg_dst,
            mem_to_reg => mem_to_reg,
            reg_write => reg_write,
            alu_src => alu_src,
            alu_op => alu_op,
            jump => jump,
            link => link
        );
    
    -- Alu control unit
    alu_ctrl : alu_control
        port map (
            alu_op    => alu_op,
            func      => imem_data_in(5 downto 0),
            alu_input => alu_input
        );
    
    -- PC incrementer
    pc_add_one: adder 
        generic map (
            N => 32
        )
        port map (
            x   => PC,
            Y   => X"00000001",
            cin => '0',
            r   => PC_ADD
        );
        
    -- Jump address concatinate
    PC_JUMP <= PC_ADD(31 downto 26) & imem_data_in(25 downto 0);
    
    -- Brach adder
    pc_add_branch: adder 
        generic map (
            N => 32
        )
        port map (
            x   => PC_ADD,
            Y   => sign_extended,
            cin => '0',
            r   => PC_BRANCH
        );
    
    -- Latch the value of the correct PC_* register to PC on rising edge clk if the pc_latch signal is high
    next_pc_latch: process (PC_NEXT, pc_latch) 
    begin
        if rising_edge(pc_latch) then
            PC <= PC_NEXT;
        end if;
    end process;
    
    -- PC_NEXT muxes combined into one process
    pc_mux: process (clk, jump, branch, flags, PC_JUMP, PC_BRANCH, PC_ADD)
    begin
        if jump = '1' then
            PC_NEXT <= PC_JUMP;
        else
            if branch = '1' and flags.Zero = '1' then
                PC_NEXT <= PC_BRANCH;
            else 
                PC_NEXT <= PC_ADD;
            end if;
        end if;
    end process;
    
    -- Drive processor outputs only when the processor itself is enabled.
    -- As the signals are muxed in toplevel this is strictly not needed by it 
    -- is done for good measure.
    drive_output_signals: process(processor_enable, PC, alu_out, rt, mem_write_enable)
    begin
        if processor_enable = '1' then
            imem_address <= PC;
            dmem_address <= alu_out;
            dmem_address_wr <= alu_out;
            dmem_data_out <= rt;
            dmem_write_enable <= mem_write_enable;
        end if;
    end process;

    -- Registers            
    regfile: register_file 
        port map(
            clk        => clk,
            reset      => reset,
            rw         => reg_write,
            rs_addr    => imem_data_in(25 downto 21),
            rt_addr    => imem_data_in(20 downto 16),
            rd_addr    => rd_addr,
            write_data => reg_write_data,
            rs         => rs,
            rt         => rt
        );
        
    -- Switch which register is set as the write register
    reg_write_mux: process(reg_dst, imem_data_in, link) 
    begin
        if link = '1' then
            rd_addr <= LINK_REG;
        else 
            if reg_dst = '1' then
                rd_addr <= imem_data_in(15 downto 11);
            else
                rd_addr <= imem_data_in(20 downto 16);
            end if;
        end if;
    end process;
        
    -- mem_to_reg mux, selects what data is sent to the write register
    data_write_mux: process(dmem_data_in, alu_out, mem_to_reg, link)
    begin
        if link = '1' then
            reg_write_data <= PC_ADD;
        else 
            if mem_to_reg = '1' then
                reg_write_data <= dmem_data_in;
            else
                reg_write_data <= alu_out;
            end if;
        end if;
    end process;
    
    -- Signextend the low 16 bits of the instruction
    signex: sign_extend port map(
        a => imem_data_in(15 downto 0),
        r => sign_extended
    );

    -- ALU
    alu1: alu port map(
        x      => rs,
        y      => alu_in_y,
        alu_in => alu_input,
        r      => alu_out,
        flags  => flags
    );
        
    -- Mux Y input of ALU
    alu_in_mux: process(rt, sign_extended, alu_src) 
    begin
        if alu_src = '1' then
            alu_in_y <= sign_extended;
        else 
            alu_in_y <= rt;
        end if;
    end process;
    
end Behavioral;

