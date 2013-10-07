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
            alu_op          : in ALU_OP;
            func            : in STD_LOGIC_VECTOR (5 downto 0);
            alu_input       : out ALU_INPUT;
            jump_alu_result : out std_logic
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
            N: natural := 32
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

    -- Control unit and alu control signals
    signal ctrl_mem_write        : std_logic := '0';
    signal ctrl_pc_latch         : std_logic := '0';
    signal ctrl_reg_dst          : std_logic := '0';
    signal ctrl_mem_to_reg       : std_logic := '0';
    signal ctrl_reg_write        : std_logic := '0';
    signal ctrl_alu_src          : std_logic := '0';
    signal ctrl_branch           : std_logic := '0';
    signal ctrl_mem_read         : std_logic := '0';
    signal ctrl_jump             : std_logic := '0';   
    signal ctrl_link             : std_logic := '0';
    signal ctrl_jump_alu_result  : std_logic := '0';
    signal ctrl_alu_op           : ALU_OP;
    signal ctrl_alu_input        : ALU_INPUT;
    
    -- Program counter registers
    signal PC        : std_logic_vector(31 downto 0) := (others => '0');
    signal PC_ADD    : std_logic_vector(31 downto 0) := (others => '0');
    signal PC_JUMP   : std_logic_vector(31 downto 0) := (others => '0');
    signal PC_BRANCH : std_logic_vector(31 downto 0) := (others => '0');    
    signal PC_NEXT   : std_logic_vector(31 downto 0) := (others => '0');    
    
    -- Sign extended low 16 bits of instruction
    signal sign_extended : std_logic_vector(31 downto 0);
    -- Input to register write
    signal reg_write_data : std_logic_vector(31 downto 0);     
    signal reg_write_addr : std_logic_vector(4 downto 0);
   
    -- Register file read outputs
    signal reg_rt : std_logic_vector(31 downto 0);
    signal reg_rs : std_logic_vector(31 downto 0);

    -- ALU output
    signal alu_out   : std_logic_vector(31 downto 0);
    -- ALU y input
    signal alu_in_y  : std_logic_vector(31 downto 0);
    -- ALU flags
    signal alu_flags : ALU_FLAGS;

    -- Number of the link register
    constant LINK_REG : std_logic_vector(4 downto 0) := "11111";

begin
    
    -- control unit
    ctrl_unit : control_unit
        port map (
            -- Inputs
            clk    => clk,
            reset  => reset,
            opcode => imem_data_in(31 downto 26),
            enable => processor_enable,
            
            -- Control outputs
            branch     => ctrl_branch,
            mem_read   => ctrl_mem_read,
            pc_latch   => ctrl_pc_latch,
            mem_write  => ctrl_mem_write,
            reg_dst    => ctrl_reg_dst,
            mem_to_reg => ctrl_mem_to_reg,
            reg_write  => ctrl_reg_write,
            alu_src    => ctrl_alu_src,
            jump       => ctrl_jump,
            link       => ctrl_link,
            alu_op     => ctrl_alu_op
        );
    
    -- Alu control unit
    alu_ctrl : alu_control
        port map (
            -- ALU OP from control unit, function from instruction
            alu_op          => ctrl_alu_op,
            func            => imem_data_in(5 downto 0),

            -- Control outputs
            alu_input       => ctrl_alu_input,
            jump_alu_result => ctrl_jump_alu_result
        );


    -- Sign extend the low 16 bits of the instruction
    signex: sign_extend port map(
        a => imem_data_in(15 downto 0),
        r => sign_extended
    );
    
    -- PC incrementer, used to calculate PC_ADD = PC+1
    pc_add_one: adder 
        port map (
            x   => PC,
            Y   => X"00000001",
            cin => '0',
            r   => PC_ADD
        );
        
    -- Create PC_JUMP by concatinating PC_ADD and 26 bits from the instruction
    PC_JUMP <= PC_ADD(31 downto 26) & imem_data_in(25 downto 0);
    
    -- Calculate PC_BRANCH by adding PC_ADD and the sign extended low 16 bits of instruction
    pc_add_branch: adder 
        port map (
            x   => PC_ADD,
            Y   => sign_extended,
            cin => '0',
            r   => PC_BRANCH
        );

    -- Registers            
    regfile: register_file 
        port map(
            clk        => clk,
            reset      => reset,

            -- Write back
            rw         => ctrl_reg_write,
            write_data => reg_write_data,
            rd_addr    => reg_write_addr,

            -- Read
            rs_addr    => imem_data_in(25 downto 21),
            rt_addr    => imem_data_in(20 downto 16),
            rs         => reg_rs,
            rt         => reg_rt
        );

    -- ALU
    alu1: alu port map(
        x      => reg_rs,
        y      => alu_in_y,
        alu_in => ctrl_alu_input,
        r      => alu_out,
        flags  => alu_flags
    );

    
    -- Latch the current value of PC_NEXT to PC as the control unit pulls pc_latch high
    next_pc_latch: process (PC_NEXT, ctrl_pc_latch) 
    begin
        if rising_edge(ctrl_pc_latch) then
            PC <= PC_NEXT;
        end if;
    end process;
    
    -- pc_mux combines the three muxes used to select next PC value into a single process
    pc_mux: process (clk, ctrl_jump, ctrl_jump_alu_result, ctrl_branch, alu_flags, PC_JUMP, PC_BRANCH, PC_ADD)
    begin
        if ctrl_jump_alu_result = '1' then
            PC_NEXT <= alu_out;
        elsif ctrl_jump = '1' then
            PC_NEXT <= PC_JUMP;
        else
            if ctrl_branch = '1' and alu_flags.Zero = '1' then
                PC_NEXT <= PC_BRANCH;
            else 
                PC_NEXT <= PC_ADD;
            end if;
        end if;
    end process;
    
    -- Drive processor outputs only when the processor itself is enabled.
    -- As the signals are muxed in toplevel this is strictly not needed by it 
    -- is done for good measure.
    drive_output_signals: process(processor_enable, PC, alu_out, reg_rt, ctrl_mem_write)
    begin
        if processor_enable = '1' then
            imem_address <= PC;
            dmem_address <= alu_out;
            dmem_address_wr <= alu_out;
            dmem_data_out <= reg_rt;
            dmem_write_enable <= ctrl_mem_write;
        end if;
    end process;

    
        
    -- Switch which register is set as the write register
    reg_write_mux: process(ctrl_reg_dst, imem_data_in, ctrl_link) 
    begin
        if ctrl_link = '1' then
            reg_write_addr <= LINK_REG;
        else 
            if ctrl_reg_dst = '1' then
                reg_write_addr <= imem_data_in(15 downto 11);
            else
                reg_write_addr <= imem_data_in(20 downto 16);
            end if;
        end if;
    end process;
        
    -- mem_to_reg mux, selects what data is sent to the write register
    data_write_mux: process(dmem_data_in, alu_out, ctrl_mem_to_reg, ctrl_link)
    begin
        if ctrl_link = '1' then
            reg_write_data <= PC_ADD;
        else 
            if ctrl_mem_to_reg = '1' then
                reg_write_data <= dmem_data_in;
            else
                reg_write_data <= alu_out;
            end if;
        end if;
    end process;
    
    
        
    -- Mux Y input of ALU
    alu_in_mux: process(reg_rt, sign_extended, ctrl_alu_src) 
    begin
        if ctrl_alu_src = '1' then
            alu_in_y <= sign_extended;
        else 
            alu_in_y <= reg_rt;
        end if;
    end process;
    
end Behavioral;

