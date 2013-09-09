library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;

entity shifter is
	generic (N: natural);
	port(
		X : in STD_LOGIC_VECTOR(N-1 downto 0);
		SHAMT : in STD_LOGIC_VECTOR(integer(log2(real(N)))-1 downto 0);
		R : out STD_LOGIC_VECTOR(N-1 downto 0)
		);
end shifter;

architecture Behavioral of shifter is
	component shifter_1bit is
		port(
			X : in STD_LOGIC;
			X_SHIFT : in STD_LOGIC;
			SHAMT : in STD_LOGIC;
			R : out STD_LOGIC
		);
	end component;

	type X_AUX_T is array (integer(log2(real(N))) downto 0) of STD_LOGIC_VECTOR (N-1 downto 0);

	signal X_AUX : X_AUX_T;

begin

X_AUX(integer(log2(real(N)))) <= X;

gen_cols:
for j in 0 to integer(log2(real(N)))-1 generate
	gen_shift:
	for i in 0 to N-1 generate
	shift : shifter_1bit
		port map (
			X => X_AUX(j+1)(i),
			X_SHIFT => X( (i+(2**j) ) mod N ),
			SHAMT => SHAMT(j),
			R => X_AUX(j)(i)
		);
	end generate;
end generate;

R <= X_AUX(0);

end Behavioral;
