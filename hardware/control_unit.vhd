----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:26 09/16/2013 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library WORK;
use WORK.MIPS_CONSTANT_PKG.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( 
		 clk 			: in STD_LOGIC;
		 reset 		: in STD_LOGIC; 
		 inst 		: in STD_LOGIC_VECTOR (5 DOWNTO 0);
		 reg_dst 	: out STD_LOGIC;
		 branch 		: out STD_LOGIC;
		 mem_read 	: out STD_LOGIC;
		 mem_to_reg : out STD_LOGIC;
		 alu_op 		: out ALU_OP;
		 mem_write 	: out STD_LOGIC;
		 alu_src 	: out STD_LOGIC;
		 reg_write 	: out STD_LOGIC;
		 jump 		: out STD_LOGIC;
		 pc_latch   : out STD_LOGIC := '0'
	 );
end control_unit;

architecture Behavioral of control_unit is
	 constant fetch 		: STD_LOGIC_VECTOR (1 downto 0) := "00";
	 constant execute 	: STD_LOGIC_VECTOR (1 downto 0) := "01";
	 constant stall 		: STD_LOGIC_VECTOR (1 downto 0) := "10";
	 constant stall1 		: STD_LOGIC_VECTOR (1 downto 0) := "11";
	 signal state 			: STD_LOGIC_VECTOR (1 downto 0);
	 signal next_state 	: STD_LOGIC_VECTOR (1 downto 0);
	 constant op_alu 		: STD_LOGIC_VECTOR (5 downto 0) := "000000";
	 constant op_lw 		: STD_LOGIC_VECTOR (5 downto 0) := "100011";
	 constant op_sw 		: STD_LOGIC_VECTOR (5 downto 0) := "101011";
	 constant op_lui 		: STD_LOGIC_VECTOR (5 downto 0) := "001111";
	 constant op_beq 		: STD_LOGIC_VECTOR (5 downto 0) := "000100";
	 constant op_j 		: STD_LOGIC_VECTOR (5 downto 0) := "000010";
	 
begin
	process (clk, reset)
	begin
		if (reset = '1') then
			state <= stall1;
			--pc_latch <= '0';
		elsif rising_edge(clk) then
			state <= next_state;
		end if;
	end process;
			

	process (state, inst)
	begin 
		case state is
			when fetch =>			
					mem_write <= '0';
					reg_write <= '0';
					pc_latch <= '0';
					next_state <= execute;
					
			when execute =>
				case inst is
					when op_alu =>
						reg_dst <= '1';
						branch <= '0';
						mem_read <= '0';
						mem_to_reg <= '0';
						alu_op <= ALUOP_FUNC;
						mem_write <= '0';
						alu_src <= '0';
						reg_write <= '1';
						jump <= '0';
						
						pc_latch <= '1';
						next_state <= fetch;
					
					when op_lw =>
						reg_dst <= '0';
						branch <= '0';
						mem_read <= '1';
						mem_to_reg <= '1';
						alu_op <= ALUOP_LOAD_STORE;
						mem_write <= '0';
						alu_src <= '1';
						reg_write <= '1';
						jump <= '0';
						
						next_state <= stall;
					
					when op_sw =>
						reg_dst <= '0';
						branch <= '0';
						mem_read <= '0';
						mem_to_reg <= '0';
						alu_op <= ALUOP_LOAD_STORE;
						mem_write <= '1';
						alu_src <= '1';
						reg_write <= '0';
						jump <= '0';
						
						next_state <= stall;
						
					when op_lui =>
						reg_dst <= '0';
						branch <= '0';
						mem_read <= '0';
						mem_to_reg <= '0';
						alu_op <= ALUOP_LDI;
						mem_write <= '0';
						alu_src <= '1';
						reg_write <= '1';
						jump <= '0';
						
						pc_latch <= '1';						
						next_state <= fetch;
						
					when op_beq =>
						reg_dst <= '1';
						branch <= '1';
						mem_read <= '0';
						mem_to_reg <= '0';
						alu_op <= ALUOP_BRANCH;
						mem_write <= '0';
						alu_src <= '0';
						reg_write <= '0';
						jump <= '0';
						
						pc_latch <= '1';
						next_state <= fetch;
						
					when op_j =>
						reg_dst <= '1';
						branch <= '0';
						mem_read <= '0';
						mem_to_reg <= '0';
						alu_op <= ALUOP_BRANCH;
						mem_write <= '0';
						alu_src <= '0';
						reg_write <= '0';
						jump <= '1';
						
						pc_latch <= '1';
						next_state <= fetch;
					
					when others =>
						reg_dst <= '0';
						branch <= '0';
						mem_read <= '0';
						mem_to_reg <= '0';
						alu_op <= ALUOP_BRANCH;
						mem_write <= '0';
						alu_src <= '0';
						reg_write <= '0';
						jump <= '0';
						
						pc_latch <= '1';
						next_state <= fetch;								
				end case;
				
			when stall =>
					pc_latch <= '1';
					next_state <= fetch;
				
			when others =>
				pc_latch <= '0';
				next_state <= fetch;						
		end case;
	end process;
end Behavioral;

