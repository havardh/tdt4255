
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mips_constant_pkg.all;

entity control_unit is
	port ( 
		 clk 			: in std_logic;
		 reset 		: in std_logic; 
		 opcode 		: in std_logic_vector (5 DOWNTO 0);
		 enable		: in std_logic;
		 reg_dst 	: out std_logic;
		 branch 		: out std_logic;
		 mem_read 	: out std_logic;
		 mem_to_reg : out std_logic;
		 alu_op 		: out ALU_OP;
		 mem_write 	: out std_logic;
		 alu_src 	: out std_logic;
		 reg_write 	: out std_logic;
		 jump 		: out std_logic;
		 pc_latch   : out std_logic := '0'
	 );
end control_unit;

architecture Behavioral of control_unit is

	-- Control unit states
	type const_state is (FETCH, EXECUTE, STALL);
	signal state : const_state := FETCH;
	signal next_state : const_state; 
	
	-- opcodes
	constant op_alu 		: std_logic_vector (5 downto 0) := "000000";
	constant op_lw 		: std_logic_vector (5 downto 0) := "100011";
	constant op_sw 		: std_logic_vector (5 downto 0) := "101011";
	constant op_lui 		: std_logic_vector (5 downto 0) := "001111";
	constant op_beq 		: STD_LOGIC_VECTOR (5 downto 0) := "000100";
	constant op_j 	      : STD_LOGIC_VECTOR (5 downto 0) := "000010";
begin

	-- State machine control process
	control_unit_state_machine_control: process(clk, enable, state, next_state, reset)
	begin
		if rising_edge(clk) and enable = '1' then
			if reset = '1' then
				state <= STALL;
			else 
				state <= next_state;
			end if;
		end if;
	end process;
	
	-- Actual state machine
	control_unit_state_machine: process(state)
	begin
		case state is
			when FETCH =>
				mem_write <= '0';
				reg_write <= '0';
				pc_latch <= '0';
				
				next_state <= EXECUTE;
				
			when EXECUTE =>
				case opcode is
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
						next_state <= FETCH;
					
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
						
						next_state <= STALL;
					
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
						
						next_state <= STALL;
						
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
						next_state <= FETCH;
						
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
						next_state <= FETCH;
						
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
						next_state <= FETCH;
					
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
						next_state <= FETCH;								
				end case;
				
			when STALL => 
				pc_latch <= '1';
				next_state <= FETCH;
				
			when others =>
				next_state <= FETCH;
		end case;
	end process;

end Behavioral;