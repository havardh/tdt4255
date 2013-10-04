library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mips_constant_pkg.all;
use work.asserts.all;
 
entity control_unit_tb is
end control_unit_tb;
 
architecture Behavior of control_unit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    component control_unit
        port (
            clk : in  std_logic;
            reset : in  std_logic;
            opcode : in  std_logic_vector(5 downto 0);
            enable : in std_logic;
            reg_dst : OUT  std_logic;
            branch : OUT  std_logic;
            mem_read : OUT  std_logic;
            mem_to_reg : OUT  std_logic;
            alu_op : OUT  ALU_OP;
            mem_write : OUT  std_logic;
            alu_src : OUT  std_logic;
            reg_write : OUT  std_logic;
            jump : OUT  std_logic;
            pc_latch : OUT std_logic
        );
    end component;
    

    --Inputs
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '0';
    signal opcode : std_logic_vector(5 downto 0) := (others => '0');
    signal enable : std_logic := '0';

     --Outputs
    signal reg_dst    : std_logic;
    signal branch     : std_logic;
    signal mem_read   : std_logic;
    signal mem_to_reg : std_logic;
    signal mem_write  : std_logic;
    signal alu_src    : std_logic;
    signal reg_write  : std_logic;
    signal jump       : std_logic;
    signal pc_latch   : std_logic;
    signal alu_op     : ALU_OP;

    -- In order to ease debugging we map the 8 control signals (excluding alu_op) to this
    -- single vector, hence we can do a single assert per test case insted of 7
    -- The mapping is shown at the start of the test bench below
    signal output : std_logic_vector (8 downto 0);

    -- Clock period definitions
    constant clk_period : time := 10 ns;

begin
 
    -- Instantiate the Unit Under Test (UUT)
    uut: control_unit 
        port map (
            clk => clk,
            reset => reset,
            opcode => opcode,
            enable => enable,
            reg_dst => reg_dst,
            branch => branch,
            mem_read => mem_read,
            mem_to_reg => mem_to_reg,
            alu_op => alu_op,
            mem_write => mem_write,
            alu_src => alu_src,
            reg_write => reg_write,
            jump => jump,
            pc_latch => pc_latch
        );

    -- mapping output vector
    output(8) <= pc_latch;
    output(7) <= reg_dst;
    output(6) <= branch;
    output(5) <= mem_read;
    output(4) <= mem_to_reg;
    output(3) <= mem_write;
    output(2) <= alu_src;
    output(1) <= reg_write;
    output(0) <= jump;


    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
 

    -- Stimulus process
    stim_proc: process
    begin        
        enable <= '1';

        -- R-Type instructions
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;

        -- Set instruction and wait for FETCH->EXECUTE transistion
        opcode <= "000000";
        wait for clk_period*1;
        -- Assert values and reset instruction to undefined
        assertEqual(output, "110000010");
        opcode <= "111111";
        -- Make sure all write enable and latch singals are disabled in EXECUTE->FETCH transition
        wait for clk_period*1;
        assertEqual(output, "010000000");
        wait for clk_period*1;
        assertEqual(output, "100000000");

        -- Load word
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;

        -- Set intruction and wait for FETCH->EXECUTE
        opcode <= "100011";
        wait for clk_period*1;
        -- Assert values
        assertEqual(output, "000110110");
        -- Make sure values are held into the STALL state
        wait for clk_period*1;
        assertEqual(output, "100110110");
        opcode <= "111111";
        wait for clk_period*1;
        assertEqual(output, "000110100");
        wait for clk_period*1;
        assertEqual(output, "100000000");
        

        -- Store word
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;

        -- Set intruction and wait for FETCH->EXECUTE
        opcode <= "101011";
        wait for clk_period*1;
        -- Assert values and reset instruction
        assertEqual(output, "000001100");
        -- Make sure values are held into STALL state
        wait for clk_period*1;
        assertEqual(output, "100001100");
        opcode <= "111111";
        wait for clk_period*1;
        assertEqual(output, "000000100");
        wait for clk_period*1;
        assertEqual(output, "100000000");


        -- Load upper immideate
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;

        -- Set instruction and wait for FETCH->EXECUTE
        opcode <= "001111";
        wait for clk_period*1;
        -- Assert values and reset instruction to undefined
        assertEqual(output, "100000110");
        opcode <= "111111";
        wait for clk_period*1;
        assertEqual(output, "000000100");
        wait for clk_period*1;
        assertEqual(output, "100000000");


        -- Branch if equal
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;

        -- Set instruction and wait for FETCH->EXECUTE
        opcode <= "000100";
        wait for clk_period*1;
        -- Assert values and reset instruction to undefined
        assertEqual(output, "111000000");
        opcode <= "111111";
        wait for clk_period*1;
        assertEqual(output, "011000000");
        wait for clk_period*1;
        assertEqual(output, "100000000");

        -- Jump
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;

        -- Set instruction and wait for FETCH->EXECUTE
        opcode <= "000010";
        wait for clk_period*1;
        -- Assert values and reset instruction to undefined
        assertEqual(output, "110000001");
        opcode <= "111111";
        wait for clk_period*1;
        assertEqual(output, "010000001");
        wait for clk_period*1;
        assertEqual(output, "100000000");

        wait;

    end process;

end;
