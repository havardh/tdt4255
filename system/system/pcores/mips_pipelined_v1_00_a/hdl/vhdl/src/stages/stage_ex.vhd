library ieee;
use ieee.std_logic_1164.all;

use work.mips_constant_pkg.all;
use work.pipeline_types.all;

entity stage_ex is
	generic (
		N: natural := 32
	);
	port (
		input     : in idex_t;
		
		-- Forwarding control signals and data
		forwarding_a : in std_logic_vector(1 downto 0);
		forwarding_b : in std_logic_vector(1 downto 0);
		ex_mem_rd    : in std_logic_vector(N-1 downto 0);
		mem_wb_rd    : in std_logic_vector(N-1 downto 0);
		
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
	signal alu_forward_a_in : std_logic_vector (N-1 downto 0);
	signal alu_forward_b_in : std_logic_vector (N-1 downto 0);
	
	-- Final ALU B input after alusrc mux	
	signal alu_b_in         : std_logic_vector (N-1 downto 0);
	
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
			x 		=> alu_forward_a_in,
			y 		=> alu_b_in,
			alu_in 	=> alu_input,
			r 		=> output.alu_result,
			flags  	=> output.flags
		);
		
	-- Forwarding ALU A input mux
	alu_forward_a_in_mux : process(input.reg1, forwarding_a, ex_mem_rd, mem_wb_rd)
	begin
		case forwarding_a is
			when "10" =>
				alu_forward_a_in <= ex_mem_rd;
			when "01" =>
				alu_forward_a_in <= mem_wb_rd;
			when others =>
				alu_forward_a_in <= input.reg1;
		end case;
	end process;
		
	-- ALU B input mux
	alu_forward_b_in_mux : process(input.reg2, forwarding_b, ex_mem_rd, mem_wb_rd)
	begin
		case forwarding_b is 
			when "10" =>
				alu_forward_b_in <= ex_mem_rd;
			when "01" =>
				alu_forward_b_in <= mem_wb_rd;
			when others =>
				alu_forward_b_in <= input.reg2;
		end case;
	end process;			
		
	-- ALU src mux
	alu_input_mux: process(alu_forward_b_in, input.sign_extended, input.ctrl_ex.alu_src)
	begin
		if input.ctrl_ex.alu_src = '0' then
			alu_b_in <= alu_forward_b_in;
		else 
			alu_b_in <= input.sign_extended;
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
