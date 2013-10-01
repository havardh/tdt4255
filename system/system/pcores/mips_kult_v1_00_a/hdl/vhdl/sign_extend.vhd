----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:51:20 09/16/2013 
-- Design Name: 
-- Module Name:    sign_extend - Behavioral 
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

entity sign_extend is
	port (
		A : in std_logic_vector(15 downto 0);
		R : out std_logic_vector(31 downto 0)
	);
end sign_extend;

architecture Behavioral of sign_extend is

begin

	R(15 downto 0) <= A;
	
	process (A)
	begin	
		if A(15) = '1' then 
			R(31 downto 16) <= "1111111111111111";
		else 
			R(31 downto 16) <= "0000000000000000";
		end if;
	end process;
	
end Behavioral;

