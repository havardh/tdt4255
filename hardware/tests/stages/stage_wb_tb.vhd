
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;
use work.asserts.all;

entity stage_wb_tb is
end stage_wb_tb;

architecture Behavior of stage_wb_tb is 

	component stage_wb is
	port (
		input: in memwb_t;
		output: out wb_t
	);
	end component;

	-- Input
	signal input : memwb_t;

	-- Output
	signal output : wb_t;
 

begin
	
	uut: stage_wb
	  port map (
			input => input,
			output => output
		);

	stim_proc: process
	begin

		-- Reset input signals
		input.ctrl_wb.mem_to_reg <= '0';
		input.ctrl_wb.reg_write <= '0';
		input.mem_data <= (others => '0');
		input.alu_data <= (others => '0');
		input.write_reg_addr <= (others => '0');

		-- Chooses mem_data when mem_to_reg is '1'
		input.mem_data <= X"0000ABC0";
		input.alu_data <= X"0ABC0000";
		input.ctrl_wb.mem_to_reg <= '1';
		wait for 1 ns;
		assertEqual(output.write_data, X"0000ABC0");

		-- Chooses mem_data when mem_to_reg is '0'
		input.mem_data <= X"0000ABC0";
		input.alu_data <= X"0ABC0000";
		input.ctrl_wb.mem_to_reg <= '0';
		wait for 1 ns;
		assertEqual(output.write_data, X"0ABC0000");

		-- Should forward control signals
		input.ctrl_wb.reg_write <= '0';
		wait for 1 ns;
		assert(output.reg_write = '0')
			report "RegWrite was not forwarded"
			severity warning;
		input.ctrl_wb.reg_write <= '1';
		wait for 1 ns;
		assert(output.reg_write = '1')
			report "RegWrite was not forwarded"
			severity warning;
		
		
		input.write_reg_addr <= (others => '0');
		wait for 1 ns;
		assertEqual(output.write_addr, "00000");
		
		input.write_reg_addr <= "11010";
		wait for 1 ns;
		assertEqual(output.write_addr, "11010");
		
		wait;
		
	end process;
		
end Behavior;
