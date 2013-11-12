
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;

entity control_unit is
	port ( 
		opcode     : in std_logic_vector (5 DOWNTO 0);

		ctrl_ex    : out ctrl_ex_t;
		ctrl_m     : out ctrl_m_t;
		ctrl_wb    : out ctrl_wb_t
		
		);
end control_unit;

architecture Behavioral of control_unit is    
	-- opcodes
	constant OP_ALU : std_logic_vector (5 downto 0) := "000000";
	constant OP_LW  : std_logic_vector (5 downto 0) := "100011";
	constant OP_SW  : std_logic_vector (5 downto 0) := "101011";
	constant OP_LUI : std_logic_vector (5 downto 0) := "001111";
	constant OP_BEQ : std_logic_vector (5 downto 0) := "000100";
	constant OP_J   : std_logic_vector (5 downto 0) := "000010";
	constant OP_JAL : std_logic_vector (5 downto 0) := "000011";

begin    
	-- Actual state machine
	process(opcode)
	begin
		case opcode is
			when OP_ALU =>			 
				ctrl_ex <= (jump => '0', branch => '0', reg_dst => '1', alu_op => ALUOP_FUNC, alu_src => '0');
				ctrl_m  <= (mem_write => '0', mem_read => '0');
				ctrl_wb <= (mem_to_reg => '0', reg_write => '1');
				--link <= '0';
				
			when OP_LW =>
				ctrl_ex <= (jump => '0', branch => '0', reg_dst => '0', alu_op => ALUOP_LOAD_STORE, alu_src => '1');
				ctrl_m  <= (mem_write => '0', mem_read => '1');
				ctrl_wb <= (mem_to_reg => '1', reg_write => '1');
				--link <= '0';
				
				
			when OP_SW =>
				ctrl_ex <= (jump => '0', branch => '0', reg_dst => '0', alu_op => ALUOP_LOAD_STORE, alu_src => '1');
				ctrl_m  <= (mem_write => '1', mem_read => '0');
				ctrl_wb <= (mem_to_reg => '0', reg_write => '0');
				--link <= '0';
				
				
			when OP_LUI =>
				ctrl_ex <= (jump => '0', branch => '0', reg_dst => '0', alu_op => ALUOP_LDI, alu_src => '1');
				ctrl_m  <= (mem_write => '0', mem_read => '0');
				ctrl_wb <= (mem_to_reg => '0', reg_write => '1');
				--link <= '0';
				
				
			when OP_BEQ =>
				ctrl_ex <= (jump => '0', branch => '1', reg_dst => '0', alu_op => ALUOP_BRANCH, alu_src => '0');
				ctrl_m  <= (mem_write => '0', mem_read => '0');
				ctrl_wb <= (mem_to_reg => '0', reg_write => '0');
				--link <= '0';
				
				
			when OP_J =>
				ctrl_ex <= (jump => '1', branch => '0', reg_dst => '0', alu_op => ALUOP_FUNC, alu_src => '0');
				ctrl_m  <= (mem_write => '0', mem_read => '0');
				ctrl_wb <= (mem_to_reg => '0', reg_write => '0');
				--link <= '0';
				

			--when OP_JAL =>
			--	ctrl_ex <= (reg_dst => '1', alu_op => ALUOP_BRANCH, alu_src => '0');
			--	ctrl_m  <= (jump => '1', branch => '0', mem_write => '0');
			--	ctrl_wb <= (mem_to_reg => '0', reg_write => '1');
			--  link <= '1';

				
			when others =>
				ctrl_ex <= (alu_op => ALUOP_FUNC, reg_dst => '0', alu_src => '0', jump => '0', branch => '0');
				ctrl_m  <= (others => '0');
				ctrl_wb <= (others => '0');
				--link <= '0';
		end case;
	end process;

end Behavioral;
