----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:19:37 09/16/2013 
-- Design Name: 
-- Module Name:    alu_control - Behavioral 
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

entity alu_control is
    Port ( 
	 ALU_OP 		: in ALU_OP;
	 func 		: in STD_LOGIC_VECTOR (5 downto 0);
	 ALU_INPUT 	: out ALU_INPUT
	 );
end alu_control;

architecture Behavioral of alu_control is

	constant add 		: STD_LOGIC_VECTOR (5 downto 0) := "100000";
	constant sub 		: STD_LOGIC_VECTOR (5 downto 0) := "100010";
	constant bitand 	: STD_LOGIC_VECTOR (5 downto 0) := "100100";
	constant bitor		: STD_LOGIC_VECTOR (5 downto 0) := "100101";
	constant slt 		: STD_LOGIC_VECTOR (5 downto 0) := "101010";

begin 	
	
	process (ALU_OP, func)
	begin
		if (ALU_OP = ALUOP_FUNC) then
			if (func = add) then 
				ALU_INPUT <= (Op1 => '1', others => '0');
			elsif (func = sub) then
				ALU_INPUT <= (Op1 => '1', Op2 => '1', others => '0');
			elsif (func = bitand) then
				ALU_INPUT <= (others => '0');
			elsif (func = bitor) then
				ALU_INPUT <= (Op0 => '1', others => '0');
			elsif (func = slt) then
				ALU_INPUT <= (op0 => '1', Op1 => '1', others => '0');
			end if;
			
		elsif (ALU_OP = ALUOP_LOAD_STORE) then
			ALU_INPUT <= (Op1 => '1', others => '0');
			
		elsif (ALU_OP = ALUOP_BRANCH) then
			ALU_INPUT <= (Op1 => '1', Op2 => '1', others => '0');
		
		elsif (ALU_OP = ALUOP_LDI) then
			ALU_INPUT <= (Op3 => '1', others => '0');
			
		end if;
	end process;


end Behavioral;

