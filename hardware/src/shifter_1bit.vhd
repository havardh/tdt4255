library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_1bit is
	generic (N: natural);
	port(
		X : in STD_LOGIC;
		X_SHIFT : in STD_LOGIC;
		SHAMT : in STD_LOGIC;
		R : out STD_LOGIC
		);
end shifter_1bit;

architecture Behavioral of shifter_1bit is

begin

	shift : process(SHAMT, X, X_SHIFT)
	begin
		if SHAMT = '1' then
			R <= X_SHIFT;
		else
			R <= X;
		end if;
	end process;
	
end Behavioral;
