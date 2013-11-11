library ieee;
use ieee.std_logic_1164.ALL;

library work;
use work.mips_constant_pkg.all;

entity alu_control is
	port ( 
		alu_op          : in ALU_OP;
		func            : in STD_LOGIC_VECTOR (5 downto 0);
		alu_func        : out ALU_INPUT
	);
end alu_control;

architecture Behavioral of alu_control is

	constant ADD    : STD_LOGIC_VECTOR (5 downto 0) := "100000";
	constant SUB    : STD_LOGIC_VECTOR (5 downto 0) := "100010";
	constant BITAND : STD_LOGIC_VECTOR (5 downto 0) := "100100";
	constant BITOR  : STD_LOGIC_VECTOR (5 downto 0) := "100101";
	constant SLT    : STD_LOGIC_VECTOR (5 downto 0) := "101010";

begin

	process (alu_op, func)
	begin
		if (alu_op = ALUOP_FUNC) then
			if (func = ADD) then 
				alu_func <= (Op1 => '1', others => '0'); -- ADD
			elsif (func = SUB) then
				alu_func <= (Op1 => '1', Op2 => '1', others => '0'); -- SUB
			elsif (func = BITAND) then
				alu_func <= (others => '0'); -- AND
			elsif (func = BITOR) then
				alu_func <= (Op0 => '1', others => '0'); -- OR
			elsif (func = SLT) then
				alu_func <= (Op0 => '1', Op1 => '1', Op2 => '1', others => '0'); -- SLT		
	      else 
			   alu_func <= (others => '0');
			end if;
			
		elsif (alu_op = ALUOP_LOAD_STORE) then
		   alu_func <= (Op1 => '1', others => '0'); -- ADD
			
		elsif (alu_op = ALUOP_BRANCH) then
			alu_func <= (Op1 => '1', Op2 => '1', others => '0'); -- SUB
		
		elsif (alu_op = ALUOP_LDI) then
			alu_func <= (Op3 => '1', others => '0'); -- LDI			
	   else 
			alu_func <= (others => '0');
		end if;
	end process;

end Behavioral;