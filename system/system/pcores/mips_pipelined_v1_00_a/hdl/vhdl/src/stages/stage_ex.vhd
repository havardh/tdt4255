library ieee;
use ieee.std_logic_1164.all;

use work.mips_constant_pkg.all;
use work.pipeline_types.all;

entity stage_ex is
	generic (
		N: natural := 32
		);
	port (
		input : in idex_t;
		output: out exmem_t
	);
end stage_ex; 

architecture behavorial of stage_ex is

	-- instantiating components
	 component alu is
        generic (N : natural := 32);
        port (
            x : in std_logic_vector(N-1 downto 0);
            y : in std_logic_vector(N-1 downto 0);
            alu_in : in ALU_INPUT;
            r : out std_logic_vector(N-1 downto 0);
            flags : out ALU_FLAGS
        );
    end component;

	component alu_control is
        port (
            alu_op : in ALU_OP;
            func : in STD_LOGIC_VECTOR (5 downto 0);
            alu_func : out ALU_INPUT;
            jump_result : out std_logic
        );
    end component;

	-- ALU control signals
	signal alu_input 			: ALU_INPUT;
	signal alu_ctrl_jump_result : std_logic := '0';
	
	-- ALU signals
	signal alu_in_y : std_logic_vector (N-1 downto 0);	
	
	begin
	-- signal relaying
	output.ctrl_wb 		  <= input.ctrl_wb;
	output.branch_target  <= input.branch_target;
	output.jump_target 	  <= input.jump_target;
	output.ctrl_m 		  <= input.ctrl_m;
	output.write_mem_data <= input.reg2;
	
	-- ALU control unit
	alu_ctrl: alu_control
		port map (
			-- ALU_OP comes from control unit, function from instruction
			alu_op 		=> input.ctrl_ex.alu_op,
			func		=> input.sign_extended (5 downto 0),
			
			-- control outputs
			alu_func 	=> alu_input,
			jump_result => alu_ctrl_jump_result
		);
		
	-- ALU
	alu1: alu
		port map (
			x 		=> input.reg1,
			y 		=> alu_in_y,
			alu_in 	=> alu_input,
			r 		=> output.alu_result,
			flags  	=> output.flags
		);
	alu_input_mux: process(input.reg2, input.sign_extended, input.ctrl_ex.alu_src)
	begin
		if input.ctrl_ex.alu_src = '0' then
			alu_in_y <= input.reg2;
		else 
			alu_in_y <= input.sign_extended;
		end if;
	end process;
	
	reg_write_mux: process(input.read_reg_rs_addr, input.write_reg_rd_addr, input.ctrl_ex.reg_dst)
	begin
		if input.ctrl_ex.reg_dst = '0' then
			output.write_reg_addr <= input.read_reg_rs_addr;
		else 
			output.write_reg_addr <= input.write_reg_rd_addr;
		end if;
	end process;
end architecture;
