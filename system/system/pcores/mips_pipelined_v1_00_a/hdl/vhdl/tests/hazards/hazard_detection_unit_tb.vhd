library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;
use work.asserts.all;

entity hazard_detection_unit_tb is
end hazard_detection_unit_tb;

architecture Behavioral of hazard_detection_unit_tb is

	component hazard_detection_unit is
		port (
			-- ID/EX stage inputs
			idex_rt : in std_logic_vector(4 downto 0);
			idex_mem_read : in std_logic;
		   idex_jump : in std_logic;

			idex_branch : in std_logic;
			idex_predict_taken : in std_logic;

			-- IF/ID stage input
			ifid_rt : in std_logic_vector(4 downto 0);
			ifid_rs : in std_logic_vector(4 downto 0);
			
			stall : out std_logic;
			flush : out std_logic
		);
		end component;

		signal idex_rt       : std_logic_vector(4 downto 0);
		signal idex_mem_read : std_logic;
		signal idex_jump     : std_logic;
		signal idex_branch   : std_logic;
		signal idex_predict_taken : std_logic;
		signal ifid_rt       : std_logic_vector(4 downto 0);
		signal ifid_rs       : std_logic_vector(4 downto 0);
		signal stall         : std_logic;
		signal flush         : std_logic;
		
begin

	uut: hazard_detection_unit
		port map (
			idex_rt => idex_rt,
			idex_mem_read => idex_mem_read,
			idex_jump => idex_jump,
			idex_branch => idex_branch,
			idex_predict_taken => idex_predict_taken,
			ifid_rt => ifid_rt,
			ifid_rs => ifid_rs,
			stall => stall,
			flush => flush
		);


	stim_proc: process
	begin

		-- Reset signals
		idex_rt <= (others => '0');
		idex_mem_read <= '0';
		idex_jump <= '0';
		idex_branch <= '0';
		idex_predict_taken <= '0';
		ifid_rt <= (others => '0');
		ifid_rs <= (others => '0');

		wait for 1 ns;

		-- Tests

		-- Stall when idex.rt == ifid.rs 
		idex_mem_read <= '1';
		idex_rt <= "00100";
		ifid_rs <= "00100";
		ifid_rt <= "00010";
		wait for 1 ns;
		assert (stall = '1')
			report "idex.rt == ifid.rs => ctrl_stall == 1"
			severity warning;

		-- Stall when idex.rt == ifid.rt
		idex_mem_read <= '1';
		idex_rt <= "00110";
		ifid_rs <= "01100";
		ifid_rt <= "00110";
		wait for 1 ns;
		assert (stall = '1')
			report "idex.rt == ifid.rt => ctrl_stall == 1"
			severity warning;

		-- No stall when mem_read is low
		idex_mem_read <= '0';
		idex_rt <= "00110";
		ifid_rs <= "01100";
		ifid_rt <= "00110";
		wait for 1 ns;
		assert (stall = '0')
			report "mem_read == 0 => ctrl_stall == 0"
			severity warning;

		-- No stall When idex.rt != ifid.rt and ifid.rs
		idex_mem_read <= '1';
		idex_rt <= "10110";
		ifid_rs <= "01100";
		ifid_rt <= "00110";
		wait for 1 ns;
		assert (stall = '0')
			report "idex.rt != ifid.rt and ifid.rs => ctrl_stall == 0"
			severity warning;
				
		-- Test should flush if jump instruction
		idex_jump <= '1';
		wait for 1 ns;
		assert (flush = '1')
			report "flush != 1 when idex_jump is high"
			severity warning;
			
		-- Test should flush if predict_taken and branch are high.
	   idex_jump <= '0';
		idex_predict_taken <= '1';
		idex_branch <= '1';
		wait for 1 ns;
		assert (flush = '1')
			report "flush != 1 when both predict_taken and branch are high"
			severity warning;
			
		-- Test should not flush if no inputs are high.
	   idex_jump <= '0';
		idex_predict_taken <= '0';
		idex_branch <= '0';
		wait for 1 ns;
		assert (flush = '0')
			report "flush != 0 when no signal are high"
			severity warning;

		wait;
		
	end process;
	
end Behavioral;
