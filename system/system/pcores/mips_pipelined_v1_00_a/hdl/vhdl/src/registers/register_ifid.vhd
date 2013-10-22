library ieee;
use ieee.std_logic_1164.all;

use work.pipeline_types.all;

entity register_ifid is
	port(
		input  : in ifid_t;
		clk    : in std_logic;
		reset  : in std_logic;
		enable : in std_logic;
		
		output : out ifid_t		
	);
end entity;

architecture Behaviour of register_ifid is
	signal output_internal : ifid_t := (others => (others => '0'));
begin
	output <= output_internal;

	latch : process(input, reset, clk)
	begin
		if reset = '1' then
			output_internal <= (others => (others => '0'));
		elsif rising_edge(clk) and enable = '1' then
			output_internal <= input;
		end if;
	end process;
end architecture;
