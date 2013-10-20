
library ieee;
use ieee.std_logic_1164.all;

use work.pipeline_types.all;
use work.asserts.all;

entity stage_pc_next_tb is
end stage_pc_next_tb;
 
architecture behavior of stage_pc_next_tb is 
 
    -- Component Declaration for the Unit Under Test (UUT) 
    component stage_pc_next
        port (
			clk            : in std_logic;
			reset          : in std_logic;
			pc_next        : in pc_next_t;
			enable         : in std_logic;

			pc_current     : out std_logic_vector(31 downto 0);
			pc_incremented : out std_logic_vector(31 downto 0)
        );
    end component;

    --Inputs and outputs
    signal clk            : std_logic;
	signal reset          : std_logic;
	signal enable         : std_logic;
	signal pc_next        : pc_next_t := (src => '0', jump => (others => '0'));
	signal pc_current     : std_logic_vector(31 downto 0);
	signal pc_incremented : std_logic_vector(31 downto 0);
    
    -- Clock period definitions
    constant clk_period : time := 10 ns;
 
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: stage_pc_next PORT MAP (
		clk => clk,
		reset => reset,
		pc_next => pc_next,

		pc_current => pc_current,
		pc_incremented => pc_incremented
    );

	-- Clock process definitions
    clk_process: process
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

		pc_next <= (src => '0', jump => (others => '0'));

		-- Hold reset state
		reset <= '1';
		wait for clk_period*2;
		reset <= '0';

		-- Assert that PC adding works
		assert (false) report "Test initial value after reset" severity note;
		assertEqual(pc_current, X"00000000");
		assertEqual(pc_incremented, X"00000001");

		-- Assert that pc latches correctly when jump is false
		pc_next <= (src => '0', jump => (others => '0'));
		wait for clk_period;
		assert (false) report "Test current latches next" severity note;
		assertEqual(pc_current, X"00000001");
		assertEqual(pc_incremented, X"00000002");

		-- Assert that pc disregards jump address while source is still the incremented value
		pc_next <= (src => '0', jump => X"F0000000");
		wait for clk_period;
		assert (false) report "Test jump is ignored if source is incrmented" severity note;
		assertEqual(pc_current, X"00000002");
		assertEqual(pc_incremented, X"00000003");

		-- Assert the PC does jump if src is jump
		pc_next <= (src => '1', jump => X"F0000000");
		wait for clk_period;
		assert (false) report "Test jump is taken if source is jump" severity note;
		assertEqual(pc_current, X"F0000000");
		assertEqual(pc_incremented, X"F0000001");

		-- Test that the unit correctly resets when reset is toggled
		reset <= '1';
		wait for clk_period * 0.5; -- Let the signal 'propagate'
		reset <= '0';
		
		assert (false) report "Test reset" severity note;
		assertEqual(pc_current, X"00000000");
		assertEqual(pc_incremented, X"00000001");
		
        wait;
    end process;
end;
