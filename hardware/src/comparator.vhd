library ieee;
use ieee.std_logic_1164.all;

use work.mips_constant_pkg.all;
use work.pipeline_types.all;

entity comparator is
	generic (
		N: natural := 32
		);
	port (
		input_1 : in std_logic_vector(N-1 downto 0);
		input_2 : in std_logic_vector(N-1 downto 0);
		
		equal : out std_logic;
	);
end comparator;

architecture behavioral of comparator is

begin
    equal <= '1' when (input_1 xor input_2) = X"00000000" else '0';		
end architecture;
