--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:44:04 09/16/2013
-- Design Name:   
-- Module Name:   C:/Users/bjorkto/Desktop/tdt4255/hardware/control_unit_tb.vhd
-- Project Name:  hardware
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control_unit
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

library work;
use work.MIPS_CONSTANT_PKG.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY control_unit_tb IS
END control_unit_tb;
 
ARCHITECTURE behavior OF control_unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         inst : IN  std_logic_vector(5 downto 0);
         reg_dst : OUT  std_logic;
         branch : OUT  std_logic;
         mem_read : OUT  std_logic;
         mem_to_reg : OUT  std_logic;
         alu_op : OUT  ALU_OP;
         mem_write : OUT  std_logic;
         alu_src : OUT  std_logic;
         reg_write : OUT  std_logic;
         jump : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal inst : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal reg_dst : std_logic;
   signal branch : std_logic;
   signal mem_read : std_logic;
   signal mem_to_reg : std_logic;
   signal alu_op : ALU_OP;
   signal mem_write : std_logic;
   signal alu_src : std_logic;
   signal reg_write : std_logic;
   signal jump : std_logic;
   signal output : std_logic_vector (7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

    function signalToString (v : std_logic_vector ) return string is

		variable s : string ( 3 downto 1 );
		variable r : string ( (v'left+1) downto (v'right+1) );
		begin
			for i in v'left downto v'right loop
				s := std_logic'image(v(i));
				r(i+1) := s(2);
			end loop;

			return r;

	end signalToString;

	procedure assertEqual (
		actual : std_logic_vector;
		expected : std_logic_vector;
		msg : string) is


		begin
			assert ( actual =  expected )
				report "expected "
				  & signalToString( actual )
				  & " to be equal to "
			    & msg
				severity failure;
	end assertEqual;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_unit PORT MAP (
          clk => clk,
          reset => reset,
          inst => inst,
          reg_dst => reg_dst,
          branch => branch,
          mem_read => mem_read,
          mem_to_reg => mem_to_reg,
          alu_op => alu_op,
          mem_write => mem_write,
          alu_src => alu_src,
          reg_write => reg_write,
          jump => jump
        );
		  
	-- mapping output vector
	output(7) <= reg_dst;
	output(6) <= branch;
	output(5) <= mem_read;
	output(4) <= mem_to_reg;
	output(3) <= mem_write;
	output(2) <= alu_src;
	output(1) <= reg_write;
	output(0) <= jump;
	
	
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
        -- R-Type instructions
            -- Reset unit
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
            -- Set instruction and wait for fetch->execute_1 transistion
        inst <= "000000";
        wait for clk_period*1;
            -- Assert values and reset instruction to undefined
        assertEqual(output, "10000010", "10000010");
        inst <= "111111";
            -- Make sure values are held in execute_1->fetch transition
        wait for clk_period*1;
        assertEqual(output, "10000010", "10000010");
            -- Make sure undefined is loaded in fetch->execute
        wait for clk_period*1;
        assertEqual(output, "00000000", "00000000");


        -- Load word
            -- reset unit
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
            -- Set intruction and wait for fetch->execute_2
        inst <= "100011";
        wait for clk_period*1;
            -- Assert values and reset instruction
        assertEqual(output, "00110110", "00110110");
        inst <= "111111";
            -- Make sure we hold value for two and not one cycle
        wait for clk_period*1;
        assertEqual(output, "00110110", "00110110");
        wait for clk_period*1;
        assertEqual(output, "00110110", "00110110");
            -- Assert that we're back to fetch->execute
        wait for clk_period*1;
        assertEqual(output, "00000000", "00000000");
        
        -- Store word
            -- reset unit
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
            -- Set intruction and wait for fetch->execute_2
        inst <= "101011";
        wait for clk_period*1;
            -- Assert values and reset instruction
        assertEqual(output, "00001100", "00001100");
        inst <= "111111";
            -- Make sure we hold value for two and not one cycle
        wait for clk_period*1;
        assertEqual(output, "00001100", "00001100");
        wait for clk_period*1;
        assertEqual(output, "00001100", "00001100");
            -- Assert that we're back to fetch->execute
        wait for clk_period*1;
        assertEqual(output, "00000000", "00000000");

        -- Load upper immideate
            -- Reset unit
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
            -- Set instruction and wait for fetch->execute_1 transistion
        inst <= "001111";
        wait for clk_period*1;
            -- Assert values and reset instruction to undefined
        assertEqual(output, "00000110", "00000110");
        inst <= "111111";
            -- Make sure values are held in execute_1->fetch transition
        wait for clk_period*1;
        assertEqual(output, "00000110", "00000110");
            -- Make sure undefined is loaded in fetch->execute
        wait for clk_period*1;
        assertEqual(output, "00000000", "00000000");

        -- Branch if equal
            -- Reset unit
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
            -- Set instruction and wait for fetch->execute_1 transistion
        inst <= "000100";
        wait for clk_period*1;
            -- Assert values and reset instruction to undefined
        assertEqual(output, "11000000", "11000000");
        inst <= "111111";
            -- Make sure values are held in execute_1->fetch transition
        wait for clk_period*1;
        assertEqual(output, "11000000", "11000000");
            -- Make sure undefined is loaded in fetch->execute
        wait for clk_period*1;
        assertEqual(output, "00000000", "00000000");

        -- Jump
            -- Reset unit
        reset <= '1';
        wait for clk_period*1;
        reset <= '0';
            -- Set instruction and wait for fetch->execute_1 transistion
        inst <= "000010";
        wait for clk_period*1;
            -- Assert values and reset instruction to undefined
        assertEqual(output, "10000001", "10000001");
        inst <= "111111";
            -- Make sure values are held in execute_1->fetch transition
        wait for clk_period*1;
        assertEqual(output, "10000001", "10000001");
            -- Make sure undefined is loaded in fetch->execute
        wait for clk_period*1;
        assertEqual(output, "00000000", "00000000");

        wait;
   end process;

END;
