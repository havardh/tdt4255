library ieee;
use ieee.std_logic_1164.all;

entity shifter_1bit_tb is
end shifter_1bit_tb;

architecture Behavioral of shifter_1bit_tb is

	component shifter_1bit is
		port (
			X : in STD_LOGIC;	
			X_SHIFT : in STD_LOGIC;
			SHAMT : in STD_LOGIC;
			R : out STD_LOGIC
		);
	end component;

	signal X : STD_LOGIC;
	signal X_SHIFT : STD_LOGIC;
	signal SHAMT : STD_LOGIC;

	signal R : STD_LOGIC;

begin
	
	uut: shifter_1bit
	  port map (X => X, X_SHIFT => X_SHIFT, SHAMT => SHAMT, R => R);
	
	stim_proc : process
	begin

		X <= '0';
		X_SHIFT <= '1';
		SHAMT <= '0';
		wait for 10 ns;
		assert (R = '0') report "Should not shift if shamt is 0" severity error;

		X <= '0';
		X_SHIFT <= '1';
		SHAMT <= '1';
		wait for 10 ns;
		assert (R = '1') report "Should shift if shamt is 1" severity error;

		wait;
		
	end process;
	
end Behavioral;
