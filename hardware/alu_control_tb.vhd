--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:29:22 09/16/2013
-- Design Name:   
-- Module Name:   C:/Users/bjorkto/Desktop/tdt4255/hardware/alu_control_tb.vhd
-- Project Name:  hardware
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu_control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

library WORK; 
use WORK.MIPS_CONSTANT_PKG.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alu_control_tb IS
END alu_control_tb;
 
ARCHITECTURE behavior OF alu_control_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_control
    PORT(
         ALU_OP : IN  ALU_OP;
         func : IN  std_logic_vector(5 downto 0);
         ALU_INPUT : OUT  ALU_INPUT
        );
    END COMPONENT;
    

   --Inputs
   signal ALU_OP : ALU_OP;
   signal func : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALU_INPUT : ALU_INPUT; 
	
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_control PORT MAP (
          ALU_OP => ALU_OP,
          func => func,
          ALU_INPUT => ALU_INPUT
        );
	

   -- Stimulus process
   stim_proc: process
   begin		
      -- stimulus	
		ALU_OP <=  ALUOP_FUNC;
		func <= "100000";
		-- testing add 
		wait for 1 ns;
		assert (ALU_INPUT.Op3 = '0') report "Op3 fail in and-test" severity note;
		assert (ALU_INPUT.Op2 = '0') report "Op2 fail in and-test" severity note;
		assert (ALU_INPUT.Op1 = '1') report "Op1 fail in and-test" severity note;
		assert (ALU_INPUT.Op0 = '0') report "Op0 fail in and-test" severity note;
		-- testing sub
		wait for 1 ns; 
		func <= "100010";
		wait for 1 ns;
      assert (ALU_INPUT.Op3 = '0') report "Op3 fail in sub-test" severity note;
		assert (ALU_INPUT.Op2 = '1') report "Op2 fail in sub-test" severity note;
		assert (ALU_INPUT.Op1 = '1') report "Op1 fail in sub-test" severity note;
		assert (ALU_INPUT.Op0 = '0') report "Op0 fail in sub-test" severity note;
		--testing and 
		wait for 1 ns; 
		func <= "100100";
		wait for 1 ns;
      assert (ALU_INPUT.Op3 = '0') report "Op3 fail in and-test" severity note;
		assert (ALU_INPUT.Op2 = '0') report "Op2 fail in and-test" severity note;
		assert (ALU_INPUT.Op1 = '0') report "Op1 fail in and-test" severity note;
		assert (ALU_INPUT.Op0 = '0') report "Op0 fail in and-test" severity note;
		-- testing or
		wait for 1 ns; 
		func <= "100101";
		wait for 1 ns;
      assert (ALU_INPUT.Op3 = '0') report "Op3 fail in or-test" severity note;
		assert (ALU_INPUT.Op2 = '0') report "Op2 fail in or-test" severity note;
		assert (ALU_INPUT.Op1 = '0') report "Op1 fail in or-test" severity note;
		assert (ALU_INPUT.Op0 = '1') report "Op0 fail in or-test" severity note;
		-- testing slt		
		wait for 1 ns; 
		func <= "101010";
		wait for 1 ns;
      assert (ALU_INPUT.Op3 = '0') report "Op3 fail in slt-test" severity note;
		assert (ALU_INPUT.Op2 = '0') report "Op2 fail in slt-test" severity note;
		assert (ALU_INPUT.Op1 = '1') report "Op1 fail in slt-test" severity note;
		assert (ALU_INPUT.Op0 = '1') report "Op0 fail in slt-test" severity note;
		-- testing load/store
		wait for 1 ns;
		ALU_OP <= ALUOP_LOAD_STORE;
		wait for 1 ns;
      assert (ALU_INPUT.Op3 = '0') report "Op3 fail in load/store-test" severity note;
		assert (ALU_INPUT.Op2 = '0') report "Op2 fail in load/store-test" severity note;
		assert (ALU_INPUT.Op1 = '1') report "Op1 fail in load/store-test" severity note;
		assert (ALU_INPUT.Op0 = '0') report "Op0 fail in load/store-test" severity note;
		-- testing branch
		wait for 1 ns; 
		ALU_OP <= ALUOP_BRANCH;
		wait for 1 ns;
      assert (ALU_INPUT.Op3 = '0') report "Op3 fail in branch-test" severity note;
		assert (ALU_INPUT.Op2 = '1') report "Op2 fail in branch-test" severity note;
		assert (ALU_INPUT.Op1 = '1') report "Op1 fail in branch-test" severity note;
		assert (ALU_INPUT.Op0 = '0') report "Op0 fail in branch-test" severity note;
		-- testing LDI
		wait for 1 ns; 
		ALU_OP <= ALUOP_LDI;
		wait for 1 ns;
      assert (ALU_INPUT.Op3 = '1') report "Op3 fail in ldi-test" severity note;
		assert (ALU_INPUT.Op2 = '0') report "Op2 fail in ldi-test" severity note;
		assert (ALU_INPUT.Op1 = '0') report "Op1 fail in ldi-test" severity note;
		assert (ALU_INPUT.Op0 = '0') report "Op0 fail in ldi-test" severity note;
      wait;
   end process;

END;
