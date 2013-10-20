library ieee;
use ieee.std_logic_1164.all;

use work.pipeline_types.all;

entity register_exmem is
	port(
		input: in exmem_t;
		clk  : in std_logic;
		reset  : in std_logic;
		
		output: out exmem_t		
	);
end entity;

architecture Behaviour of register_exmem is
begin
	latch : process(input, clk)
	begin
		if rising_edge(clk) then
			output <= input;
		end if;
	end process;
end architecture;
