library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter is
	generic (N: natural);
	port(
		X : in STD_LOGIC_VECTOR(N-1 downto 0);
		SHAMT : in STD_LOGIC;
		R : out STD_LOGIC_VECTOR(N-1 downto 0)
		);
end shifter;

architecture Behavioral of shifter is

begin

	shift : process(SHAMT, X)
	begin
		if SHAMT = '1' then
			R(0) <= X(1);
			R(1) <= X(0);
		else
			R <= X;
		end if;
	end process;
	
end Behavioral;
