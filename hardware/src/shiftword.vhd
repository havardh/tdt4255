library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;

entity shiftword is
	generic (N: natural; D: natural);
	port(
		X : in STD_LOGIC_VECTOR(N-1 downto 0);
		SHAMT : in STD_LOGIC;
		R : out STD_LOGIC_VECTOR(N-1 downto 0)
		);
end shiftword;

architecture Behavioral of shiftword is
	component shifter_1bit is
		port(
			X : in STD_LOGIC;
			X_SHIFT : in STD_LOGIC;
			SHAMT : in STD_LOGIC;
			R : out STD_LOGIC
		);
	end component;

begin
	
	gen_shift:
	for i in 0 to N-1 generate
	shift : shifter_1bit
		port map (
			X => X(i),
			X_SHIFT => X( (i+(2 ** D) ) mod N ),
			SHAMT => SHAMT,
			R => R(i)
		);
	end generate;
	
end Behavioral;
