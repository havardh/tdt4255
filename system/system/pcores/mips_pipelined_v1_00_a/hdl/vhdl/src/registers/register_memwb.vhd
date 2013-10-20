library ieee;
use ieee.std_logic_1164.all;

use work.pipeline_types.all;

entity register_memwb is
	port(
		input: in memwb_t;
		clk  : in std_logic;
		reset  : in std_logic;
		
		output: out memwb_t		
	);
end entity;

architecture Behaviour of register_memwb is
begin
	latch : process(input, clk)
	begin
		if rising_edge(clk) then
			output <= input;
		end if;
	end process;
end architecture;
