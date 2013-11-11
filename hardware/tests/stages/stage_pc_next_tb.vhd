
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
			reset          : in std_logic;
			pc_opt        : in pc_next_t;
			enable         : in std_logic;
			
			stall : in std_logic;

			pc     : in std_logic_vector(31 downto 0);
			pc_next	: out std_logic_vector(31 downto 0)
        );
    end component;

    --Inputs and outputs
	signal reset          : std_logic;
	signal enable         : std_logic;
	signal pc_opt	        : pc_next_t := (src => '0', jump => (others => '0'));
	signal pc     : std_logic_vector(31 downto 0);
	signal pc_next : std_logic_vector(31 downto 0);
   signal stall : std_logic := '0';
    -- Clock period definitions
    constant clk_period : time := 10 ns;
 
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: stage_pc_next PORT MAP (
		reset => reset,
		pc_opt => pc_opt,
		enable => enable,
		stall => stall,

		pc => pc,
		pc_next => pc_next
    );

    -- Stimulus process
    stim_proc: process
    begin
    	enable <= '1';


		pc <= X"00000000";
		pc_opt <= (src => '0', jump => (others => '0'));

		-- Hold reset state
		reset <= '1';
		wait for 1 ns;
		reset <= '0';
	
		-- Assert that PC adding works
		assert (false) report "Test initial value after reset" severity note;
		wait for 1 ns;
		assertEqual(pc_next, X"00000001");

		-- Assert that pc latches correctly when jump is false
		pc_opt <= (src => '0', jump => (others => '0'));
		pc <= pc_next;
		wait for 1 ns;
		assert (false) report "Test current latches next" severity note;
		assertEqual(pc_next, X"00000002");

		-- Assert that pc disregards jump address while source is still the incremented value
		pc_opt <= (src => '0', jump => X"F0000000");
		pc <= pc_next;
		wait for 1 ns;
		assert (false) report "Test jump is ignored if source is incrmented" severity note;
		assertEqual(pc_next, X"00000003");

		-- Assert the PC does jump if src is jump
		pc_opt <= (src => '1', jump => X"F0000000");
		wait for 1 ns;
		assert (false) report "Test jump is taken if source is jump" severity note;
		assertEqual(pc_next, X"F0000000");

		-- Test that the unit correctly resets when reset is toggled
		reset <= '1';
		wait for 1 ns; -- Let the signal 'propagate'
		reset <= '0';
		
		assert (false) report "Test reset" severity note;
		assertEqual(pc_next, X"00000000");
		wait for 1 ns;
		
		-- Test that when stall is pulled high the current pc is kept
		assert (false) report "Test that stall keeps the PC value from changing" severity note;
		pc <= X"00000000";
		pc_opt <= (src => '0', jump => X"00000000");
		stall <= '1';
		
		assert(false) report " -- Normal pc increment is disregarded" severity note;
		wait for 1 ns;
		assertEqual(pc_next, X"00000000");
		
		assert (false) report " -- Jumping is disregarded" severity note;
		pc_opt <= (src => '1', jump => X"F0000000");
		wait for 1 ns;
		assertEqual(pc_next, X"00000000");
		
		
        wait;
    end process;
end;
