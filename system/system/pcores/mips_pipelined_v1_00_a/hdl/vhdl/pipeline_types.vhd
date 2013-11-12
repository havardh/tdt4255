
library ieee;
use ieee.std_logic_1164.all;

use work.mips_constant_pkg.all;

package pipeline_types is

    constant N : integer := 32;
    
    type ctrl_ex_t is
    record
		  branch : std_logic;
		  jump : std_logic;
        alu_src : std_logic;
        reg_dst : std_logic;
        alu_op : ALU_OP;
    end record;
        
    type ctrl_m_t is
    record
        mem_write : std_logic;
        mem_read : std_logic;
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
        pc_current : std_logic_vector(N-1 downto 0);
        pc_incremented : std_logic_vector(N-1 downto 0);
    end record;

    type idex_t is
    record
	 
		pc_current : std_logic_vector(N-1 downto 0);
		pc_incremented : std_logic_vector(N-1 downto 0);
	 
        ctrl_wb : ctrl_wb_t;    
        ctrl_m : ctrl_m_t;
        ctrl_ex : ctrl_ex_t;
        
        branch_target : std_logic_vector(N-1 downto 0);
        
        reg1 : std_logic_vector(N-1 downto 0);
        reg2 : std_logic_vector(N-1 downto 0);
        
		predict_taken : std_logic;
        
        sign_extended : std_logic_vector(N-1 downto 0);
        
        read_reg_rs_addr  : std_logic_vector(4 downto 0);
        read_reg_rt_addr  : std_logic_vector(4 downto 0);
        write_reg_rd_addr : std_logic_vector(4 downto 0);
    end record;
    
    type exmem_t is
    record
		  
        ctrl_wb : ctrl_wb_t;
        ctrl_m : ctrl_m_t;

        flags : ALU_FLAGS;
        alu_result : std_logic_vector(N-1 downto 0);

        write_mem_data : std_logic_vector(N-1 downto 0);
        write_reg_addr : std_logic_vector(4 downto 0);
        
    end record;

    type memwb_t is
    record
		  
        ctrl_wb : ctrl_wb_t;

        mem_data       : std_logic_vector(N-1 downto 0);
        alu_data       : std_logic_vector(N-1 downto 0);
        write_reg_addr : std_logic_vector(4 downto 0);
    end record;

    type wb_t is
    record	 
        reg_write : std_logic;
        write_data : std_logic_vector(N-1 downto 0);
        write_addr : std_logic_vector(4 downto 0);
    end record;

end pipeline_types;
