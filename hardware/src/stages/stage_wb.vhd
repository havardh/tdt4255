library ieee;
use ieee.std_logic_1164.all;

use work.mips_constant_pkg.all;
use work.pipeline_types.all;

entity stage_wb is
	generic (
		N: natural := 32
		);
	port (
		input: in memwb_t;
		output: out wb_t
	);
end stage_wb;

architecture behavioral of stage_wb is

begin
    output.reg_write <= input.ctrl_wb.reg_write;
    output.write_addr <= input.write_reg_addr;
    
    write_data_mux : process(input)
    begin
        if input.ctrl_wb.mem_to_reg = '1' then
            output.write_data <= input.mem_data;
        else 
            output.write_data <= input.alu_data;
        end if;
    end process;
		
end architecture;
