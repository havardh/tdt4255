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
	
	component shiftword is
		generic ( N: natural := 32; D: natural := 1);
		port(
			X : in STD_LOGIC_VECTOR(N-1 downto 0);
			SHAMT : in STD_LOGIC;
			R : out STD_LOGIC_VECTOR(N-1 downto 0)
		);
	end component;

	type X_AUX_T is array (integer(log2(real(N)))-2 downto 0) of STD_LOGIC_VECTOR (N-1 downto 0);

	signal X_AUX : X_AUX_T;

begin

			last_shifter : shiftword
				generic map(N => N, D => 0)
				port map (
					X => X_AUX(0),
					SHAMT => SHAMT(0),
					R => R
				);

	
gen_cols:
for i in 1 to integer(log2(real(N)))-2 generate
			next_shifter : shiftword
				generic map(N => N, D => i)
				port map(
					X => X_AUX(i),
					SHAMT => SHAMT(i),
					R => X_AUX(i-1)
				);
		end generate;

			first_shifter : shiftword
				generic map(N => N, D => integer(log2(real(N)))-1)
				port map (
					X => X,
					SHAMT => SHAMT( integer(log2(real(N))) -1),
					R => X_AUX(integer(log2(real(N))) -2)
				);

end Behavioral;
