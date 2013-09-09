library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

library WORK;
use WORK.ASSERTS.all;


entity shifter_tb is
end shifter_tb;


architecture Behavioral of shifter_tb is

	component shifter is
		generic ( N: natural := 32);
		port (
			X : in STD_LOGIC_VECTOR(N-1 downto 0);
			SHAMT : in STD_LOGIC_VECTOR(integer(log2(real(N)))-1 downto 0);
			R : out STD_LOGIC_VECTOR(N-1 downto 0)
		);
	end component;

	signal X : STD_LOGIC_VECTOR(31 downto 0);
	signal SHAMT : STD_LOGIC_VECTOR(4 downto 0);

	signal R : STD_LOGIC_VECTOR(31 downto 0);

begin
	
	uut: shifter
		generic map(N => 32)
	  port map (X => X, SHAMT => SHAMT, R => R);
	
	stim_proc : process
	begin
	
		X <= "00000000000000000000000000000001";
		SHAMT <= "00001";
		wait for 10 ns;
		assertEqual(R, "10000000000000000000000000000000", "10000000000000000000000000000000");

		wait;
		
	end process;
	
end Behavioral;
