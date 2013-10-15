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
            reg_dst : out  std_logic;
            branch : out  std_logic;
            mem_read : out  std_logic;
            mem_to_reg : out  std_logic;
            alu_op : out  ALU_OP;
            mem_write : out  std_logic;
            alu_src : out  std_logic;
            reg_write : out  std_logic;
            jump : out  std_logic;
            pc_latch : out std_logic;
            link : out std_logic
        );
    end component;
    

    --Inputs
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '0';
    signal opcode : std_logic_vector(5 downto 0) := (others => '0');
    signal enable : std_logic := '0';

     --outputs
    signal reg_dst    : std_logic;
    signal branch     : std_logic;
    signal mem_read   : std_logic;
    signal mem_to_reg : std_logic;
    signal mem_write  : std_logic;
    signal alu_src    : std_logic;
    signal reg_write  : std_logic;
    signal jump       : std_logic;
    signal pc_latch   : std_logic;
    signal link       : std_logic;
    signal alu_op     : ALU_OP;

    -- In order to ease debugging we map the 9 control signals (excluding alu_op) to this
    -- single vector, hence we can do a single assert per test case insted of 9
    -- The mapping is shown at the start of the test bench below
    signal output : std_logic_vector (9 downto 0);

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
            pc_latch => pc_latch,
            link => link
        );

    -- mapping output vector
    output(9) <= link;
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

        -- Control unit tests:
        -- 
        -- The tests below all follow the same format:
        --  - First the unit it reset, by setting reset high waiting a cyle, pulling it low and
        --    waiting an other cycle. After this we know that the unit is in the FETCH state
        --  - Then we set the opcode to test and wait for an other cycle
        --  - We are now in EXECUTE and we assert that all the signals are correct.
        --  - For normal instructions we now expect to be in FETCH and we assert that destructive 
        --    signals are pulled low. And we set a undefined opcode.
        --  - In the next cycle we assume all singals except pc_latch is low, as this indicates that
        --    we're back in EXECUTE

        -- R-Type instructions
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;
        assert (false) report "Testing R-Type instructions" severity note;

        -- Set instruction and wait for FETCH->EXECUTE transistion
        opcode <= "000000";
        wait for clk_period;
        -- Assert values and reset instruction to undefined
        assertEqual(output, "0010000010");
        -- Make sure all write enable and latch singals are disabled in EXECUTE->FETCH transition
        wait for clk_period;
        opcode <= "111111";
        assertEqual(output, "0110000000");
        wait for clk_period;
        assertEqual(output, "0000000000");

        -- Load word
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;
        assert (false) report "Testing load word" severity note;

        -- Set intruction and wait for FETCH->EXECUTE
        opcode <= "100011";
        wait for clk_period;
        -- Assert values
        assertEqual(output, "0000110110");
        -- Make sure values are held into the STALL state
        wait for clk_period*1;
        assertEqual(output, "0000110110");
        wait for clk_period*1;
        opcode <= "111111";
        assertEqual(output, "0100110100");
        wait for clk_period*1;
        assertEqual(output, "0000000000");
        

        -- Store word
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;
        assert (false) report "Testing store word" severity note;

        -- Set intruction and wait for FETCH->EXECUTE
        opcode <= "101011";
        wait for clk_period*1;
        -- Assert values and reset instruction
        assertEqual(output, "0000001100");
        -- Make sure values are held into STALL state
        wait for clk_period*1;
        assertEqual(output, "0000001100");
        wait for clk_period*1;
        opcode <= "111111";
        assertEqual(output, "0100000100");
        wait for clk_period*1;
        assertEqual(output, "0000000000");


        -- Load upper immideate
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;
        assert (false) report "Testing load upper immideate" severity note;

        -- Set instruction and wait for FETCH->EXECUTE
        opcode <= "001111";
        wait for clk_period*1;
        -- Assert values and reset instruction to undefined
        assertEqual(output, "0000000110");
        wait for clk_period*1;
        opcode <= "111111";
        assertEqual(output, "0100000100");
        wait for clk_period*1;
        assertEqual(output, "0000000000");


        -- Branch if equal
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;
        assert (false) report "Testing branch if equal" severity note;

        -- Set instruction and wait for FETCH->EXECUTE
        opcode <= "000100";
        wait for clk_period*1;
        -- Assert values and reset instruction to undefined
        assertEqual(output, "0011000000");
        wait for clk_period*1;
        opcode <= "111111";
        assertEqual(output, "0111000000");
        wait for clk_period*1;
        assertEqual(output, "0000000000");

        -- Jump
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;
        assert (false) report "Testing jump" severity note;

        -- Set instruction and wait for FETCH->EXECUTE
        opcode <= "000010";
        wait for clk_period*1;
        -- Assert values and reset instruction to undefined
        assertEqual(output, "0010000001");
        wait for clk_period*1;
        opcode <= "111111";
        assertEqual(output, "0110000001");
        wait for clk_period*1;
        assertEqual(output, "0000000000");

        -- Jump and link
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
        wait for clk_period*1;
        assert (false) report "Testing jump and link" severity note;

        -- Set instruction and wait for FETCH->EXECUTE
        opcode <= "000011";
        wait for clk_period;
        -- Assert values and reset instruction to undefined
        assertEqual(output, "1010000011");
        wait for clk_period;
        opcode <= "111111";
        assertEqual(output, "1110000001");
        wait for clk_period*1;
        assertEqual(output, "0000000000");

        wait;

    end process;

end;
