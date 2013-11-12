library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mips_constant_pkg.all;
use work.asserts.all;
use work.pipeline_types.all;


entity control_unit_tb is
end control_unit_tb;

architecture Behavior of control_unit_tb is
	
	-- Component Declaration for the Unit Under Test (UUT)
	component control_unit
		port (
			opcode : in  std_logic_vector(5 downto 0);
			ctrl_ex    : out ctrl_ex_t;
			ctrl_m     : out ctrl_m_t;
			ctrl_wb    : out ctrl_wb_t
			);
	end component;
	

	--Inputs
	signal opcode : std_logic_vector(5 downto 0) := (others => '0');

	-- Outputs
	signal ctrl_ex : ctrl_ex_t;
	signal ctrl_m  : ctrl_m_t;
	signal ctrl_wb : ctrl_wb_t;

	constant ALU : std_logic_vector (5 downto 0) := "000000"; -- X"0";
	constant LW  : std_logic_vector (5 downto 0) := "100011"; -- X"23";
	constant SW  : std_logic_vector (5 downto 0) := "101011"; -- X"2b";
	constant LUI : std_logic_vector (5 downto 0) := "001111"; -- X"F";
	constant BEQ : std_logic_vector (5 downto 0) := "000100"; -- X"4";
	constant J   : std_logic_vector (5 downto 0) := "000010"; -- X"2";
	--constant JAL : std_logic_vector (5 downto 0) := X"000011";

	signal output : std_logic_vector(7 downto 0);

	
begin
	
	-- Instantiate the Unit Under Test (UUT)
	uut: control_unit 
		port map (
			opcode => opcode,

			ctrl_ex => ctrl_ex,
			ctrl_m => ctrl_m,
			ctrl_wb => ctrl_wb
		);

	output(7) <= ctrl_ex.reg_dst;
	output(6) <= ctrl_ex.alu_src;
	output(5) <= ctrl_ex.jump;
	output(4) <= ctrl_ex.branch;
	output(3) <= ctrl_m.mem_write;
	output(2) <= ctrl_m.mem_read;
	output(1) <= ctrl_wb.mem_to_reg;
	output(0) <= ctrl_wb.reg_write;
	
	--output(1) => ctrl_ex.alu_op;
	
	-- Stimulus process
	stim_proc: process
	begin        
		wait for 10 ns;
		
		-- Alu
		opcode <= ALU;
		wait for 1 ns;
		assertEqual(output, "10000001");
		assert(ctrl_ex.alu_op = ALUOP_FUNC)
			report "alu_op should be ALUOP_FUNC"
			severity warning;
		
		-- Load word
		opcode <= LW;
		wait for 1 ns;
		assertEqual(output, "01000111");
		assert(ctrl_ex.alu_op = ALUOP_LOAD_STORE)
			report "alu_op should be ALUOP_LOAD_STORE"
			severity warning;
		
		-- Store word
		opcode <= SW;
		wait for 1 ns;
		assertEqual(output, "01001000");
		assert(ctrl_ex.alu_op = ALUOP_LOAD_STORE)
			report "alu_op should be ALUOP_LOAD_STORE"
			severity warning;

		-- Load upper immideate
		opcode <= LUI;
		wait for 1 ns;
		assertEqual(output, "01000001");
		assert(ctrl_ex.alu_op = ALUOP_LDI)
			report "alu_op should be ALUOP_LDI"
			severity warning;
		
		-- Branch if equal
		opcode <= BEQ;
		wait for 1 ns;
		assertEqual(output, "00010000");
		assert(ctrl_ex.alu_op = ALUOP_BRANCH)
			report "alu_op should be ALUOP_BRANCH"
			severity warning;
		
		-- Jump
		opcode <= J;
		wait for 1 ns;
		assertEqual(output, "00100000");
		assert(ctrl_ex.alu_op = ALUOP_FUNC)
			report "alu_op should be ALUOP_FUNC"
			severity warning;
		
		-- Jump and link
		
		wait;

	end process;

end;
