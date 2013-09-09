library ieee;
use ieee.std_logic_1164.all;

entity shifter_tb is
end shifter_tb;

architecture Behavioral of shifter_tb is

	component shifter is
		generic ( N: natural :=2);
		port (
			X : in STD_LOGIC_VECTOR(N-1 downto 0);
			SHAMT : in STD_LOGIC;
			R : out STD_LOGIC_VECTOR(N-1 downto 0)
		);
	end component;

	signal X : STD_LOGIC_VECTOR(1 downto 0);
	signal SHAMT : STD_LOGIC;

	signal R : STD_LOGIC_VECTOR(1 downto 0);

begin
	
	uut: shifter
		generic map(N => 2)
	  port map (X => X, SHAMT => SHAMT, R => R);
	
	stim_proc : process
	begin

		X <= "01";
		SHAMT <= '0';
		wait for 10 ns;
		assert (R = "01") report "Should not shift if shamt is 0" severity error;

		X <= "01";
		SHAMT <= '1';
		wait for 10 ns;
		assert (R = "10") report "Should shift if shamt is 1" severity error;

		wait;
		
	end process;
	
end Behavioral;
