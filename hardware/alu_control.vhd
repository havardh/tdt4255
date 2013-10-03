library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library WORK; 
use WORK.MIPS_CONSTANT_PKG.ALL;

entity alu_control is
    Port ( 
	 ALU_OP 	: in ALU_OP;
	 func 		: in STD_LOGIC_VECTOR (5 downto 0);
	 ALU_INPUT 	: out ALU_INPUT
	 );
end alu_control;

architecture Behavioral of alu_control is
	
	-- making constants
	constant add 	: STD_LOGIC_VECTOR (5 downto 0) := "100000";
	constant sub 	: STD_LOGIC_VECTOR (5 downto 0) := "100010";
	constant bitand : STD_LOGIC_VECTOR (5 downto 0) := "100100";
	constant bitor	: STD_LOGIC_VECTOR (5 downto 0) := "100101";
	constant slt 	: STD_LOGIC_VECTOR (5 downto 0) := "101010";

begin 	
	
	process (ALU_OP, func)
	begin
		-- setting the ALU_INPUT vector (op0,op1,op2, op3)
		if (ALU_OP = ALUOP_FUNC) then
			if (func = add) then 
				ALU_INPUT <= (Op1 => '1', others => '0'); -- 0100
			elsif (func = sub) then
				ALU_INPUT <= (Op1 => '1', Op2 => '1', others => '0'); - 0110
			elsif (func = bitand) then
				ALU_INPUT <= (others => '0'); - 0000
			elsif (func = bitor) then
				ALU_INPUT <= (Op0 => '1', others => '0'); - 1000
			elsif (func = slt) then
				ALU_INPUT <= (op0 => '1', Op1 => '1', others => '0'); - 1100
			end if;
			
		elsif (ALU_OP = ALUOP_LOAD_STORE) then
			ALU_INPUT <= (Op1 => '1', others => '0'); - 0100
			
		elsif (ALU_OP = ALUOP_BRANCH) then
			ALU_INPUT <= (Op1 => '1', Op2 => '1', others => '0'); - 0110
		
		elsif (ALU_OP = ALUOP_LDI) then
			ALU_INPUT <= (Op3 => '1', others => '0'); - 0001
			
		end if;
	end process;


end Behavioral;

