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
	signal output_internal : exmem_t;
begin
	output <= output_internal;
	
	latch : process(input, reset, clk)
	begin
		if reset = '1' then
			output_internal.ctrl_m <= (others => '0');
			output_internal.ctrl_wb <= (others => '0');
		elsif rising_edge(clk) then
			output_internal <= input;
		end if;
	end process;
end architecture;
