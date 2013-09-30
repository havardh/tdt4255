----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:26:15 09/16/2013 
-- Design Name: 
-- Module Name:    shiftleft - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftleft is
	port (
		A : in std_logic_vector (31 downto 0);
		R : out std_logic_vector (31 downto 0)
	);
end shiftleft;

architecture Behavioral of shiftleft is

begin

	process(A)
	begin
	
		R(0) <= '0';
		R(1) <= '0';
		R(2) <= A(0);
		R(3) <= A(1);
		R(4) <= A(2);
		R(5) <= A(3);
		R(6) <= A(4);
		R(7) <= A(5);
		R(8) <= A(6);
		R(9) <= A(7);
		R(10) <= A(8);
		R(11) <= A(9);
		R(12) <= A(10);
		R(13) <= A(11);
		R(14) <= A(12);
		R(15) <= A(13);
		R(16) <= A(14);
		R(17) <= A(15);
		R(18) <= A(16);
		R(19) <= A(17);
		R(20) <= A(18);
		R(21) <= A(19);
		R(22) <= A(20);
		R(23) <= A(21);
		R(24) <= A(22);
		R(25) <= A(23);
		R(26) <= A(24);
		R(27) <= A(25);
		R(28) <= A(26);
		R(29) <= A(27);
		R(30) <= A(28);
		R(31) <= A(29);
		
	end process;

end Behavioral;