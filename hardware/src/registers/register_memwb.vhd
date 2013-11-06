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
	signal output_internal : memwb_t;
begin
	output_internal.mem_data <= input.mem_data;
	
	output <= output_internal;
	
	latch : process(input, reset, clk)
	begin
		if reset = '1' then
			output_internal.ctrl_wb <= (others => '0');
		elsif rising_edge(clk) then
			output_internal.ctrl_wb <= input.ctrl_wb; 
			output_internal.alu_data <= input.alu_data;
			output_internal.write_reg_addr <= input.write_reg_addr;
		end if;
	end process;
end architecture;
