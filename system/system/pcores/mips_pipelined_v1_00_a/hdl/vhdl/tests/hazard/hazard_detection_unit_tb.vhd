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

			-- IF/ID stage input
			ifid_rt : in std_logic_vector(4 downto 0);
			ifid_rs : in std_logic_vector(4 downto 0);

			pc_write : out std_logic;
			ifid_write : out std_logic;
			ctrl_stall : out std_logic
		);
		end component;

		signal idex_rt       : std_logic_vector(4 downto 0);
		signal idex_mem_read : std_logic;
		signal ifid_rt       : std_logic_vector(4 downto 0);
		signal ifid_rs       : std_logic_vector(4 downto 0);
		signal pc_write      : std_logic;
		signal ifid_write    : std_logic;
		signal ctrl_stall    : std_logic;
		
begin

	uut: hazard_detection_unit
		port map (
			idex_rt => idex_rt,
			idex_mem_read => idex_mem_read,
			ifid_rt => ifid_rt,
			ifid_rs => ifid_rs,
			pc_write => pc_write,
			ifid_write => ifid_write,
			ctrl_stall => ctrl_stall
		);


	stim_proc: process
	begin

		-- Reset signals
		idex_rt <= (others => '0');
		idex_mem_read <= '0';
		ifid_rt <= (others => '0');
		ifid_rs <= (others => '0');

		wait for 1 ns;

		-- Tests

		-- When idex.rt == ifid.rs a stall should happen
		idex_mem_read <= '1';
		idex_rt <= "00100";
		ifid_rs <= "00100";
		ifid_rt <= "00010";
		wait for 1 ns;
		assert (ctrl_stall = '1')
			report "idex.rt == ifid.rs => ctrl_stall == 1"
			severity warning;

		-- When idex.rt == ifid.rt a stall should happen
		idex_mem_read <= '1';
		idex_rt <= "00110";
		ifid_rs <= "01100";
		ifid_rt <= "00110";
		wait for 1 ns;
		assert (ctrl_stall = '1')
			report "idex.rt == ifid.rt => ctrl_stall == 1"
			severity warning;

		-- When mem_read is low a stall should not happen
		idex_mem_read <= '0';
		idex_rt <= "00110";
		ifid_rs <= "01100";
		ifid_rt <= "00110";
		wait for 1 ns;
		assert (ctrl_stall = '0')
			report "mem_read == 0 => ctrl_stall == 0"
			severity warning;

		-- When idex.rt != ifid.rt and ifid.rs no stall should happen
		idex_mem_read <= '1';
		idex_rt <= "10110";
		ifid_rs <= "01100";
		ifid_rt <= "00110";
		wait for 1 ns;
		assert (ctrl_stall = '0')
			report "idex.rt != ifid.rt and ifid.rs => ctrl_stall == 0"
			severity warning;

		wait;
		
	end process;
	
end Behavioral;
