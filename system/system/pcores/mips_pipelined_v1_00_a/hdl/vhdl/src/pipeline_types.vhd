
library ieee;
use ieee.std_logic_1164.all;

use work.mips_constant_pkg.all;

package pipeline_types is

	constant N : integer := 32;
	
	type ctrl_ex_t is
	record
		alu_src : std_logic;
		req_dst : std_logic;
		alu_op : ALU_OP;
	end record;
		
	type ctrl_m_t is
	record
		jump : std_logic;
		branch : std_logic;		
		mem_write : std_logic;
	end record;

	type ctrl_wb_t is
	record
		mem_to_reg : std_logic;
		reg_write : std_logic;
	end record;
	
	type pc_next_t is
	record
		jump : std_logic_vector(N-1 downto 0);
		src : std_logic;
	end record;
	
	type ifid_t is
	record
		instruction : std_logic_vector(N-1 downto 0);
		pc_incremented : std_logic_vector(N-1 downto 0);
	end record;

	type idex_t is
	record
		ctrl_wb : ctrl_wb_t;	
		ctrl_m : ctrl_m_t;
		ctrl_ex : ctrl_ex_t;
		
		branch_target : std_logic_vector(N-1 downto 0);
		jump_target : std_logic_vector(N-1 downto 0);
		
		reg1 : std_logic_vector(N-1 downto 0);
		reg2 : std_logic_vector(N-1 downto 0);
		
		sign_extended : std_logic_vector(N-1 downto 0);
		
		write_reg_addr_i_type : std_logic_vector(4 downto 0);
		write_reg_addr_r_type : std_logic_vector(4 downto 0);
	end record;
	
	type exmem_t is
	record
		ctrl_wb : ctrl_wb_t;
		ctrl_m : ctrl_m_t;

		branch_target : std_logic_vector(N-1 downto 0);
		jump_target : std_logic_vector(N-1 downto 0);

		flags : ALU_FLAGS;
		alu_result : std_logic_vector(N-1 downto 0);

		write_mem_data : std_logic_vector(N-1 downto 0);
		write_req_addr : std_logic_vector(4 downto 0);
		
	end record;

	type memwb_t is
	record
		ctrl_wb : ctrl_wb_t;

		mem_data : std_logic_vector(N-1 downto 0);
		alu_data : std_logic_vector(N-1 downto 0);
	end record;
	
end pipeline_types;
