library ieee;
use ieee.std_logic_1164.all;

use work.pipeline_types.all;

entity register_ifid is
	port(
		input  : in ifid_t;
		clk    : in std_logic;
		reset  : in std_logic;
		
		output : out ifid_t		
	);
end entity;

architecture Behaviour of register_ifid is
begin
	latch : process(input, clk)
	begin
		if rising_edge(clk) then
			output <= input;
		end if;
	end process;
end architecture;
