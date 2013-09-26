--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:59:29 09/23/2013
-- Design Name:   
-- Module Name:   M:/tdt4255/processor2_tb.vhd
-- Project Name:  tdt4255
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: processor2
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY processor2_tb IS
END processor2_tb;
 
ARCHITECTURE behavior OF processor2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processor2
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         processor_enable : IN  std_logic;
         imem_address : OUT  std_logic_vector(31 downto 0);
         imem_data_in : IN  std_logic_vector(31 downto 0);
         dmem_data_in : IN  std_logic_vector(31 downto 0);
         dmem_address : OUT  std_logic_vector(31 downto 0);
         dmem_address_wr : OUT  std_logic_vector(31 downto 0);
         dmem_data_out : OUT  std_logic_vector(31 downto 0);
         dmem_write_enable : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal processor_enable : std_logic := '0';
   signal imem_data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal dmem_data_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal imem_address : std_logic_vector(31 downto 0);
   signal dmem_address : std_logic_vector(31 downto 0);
   signal dmem_address_wr : std_logic_vector(31 downto 0);
   signal dmem_data_out : std_logic_vector(31 downto 0);
   signal dmem_write_enable : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor2 PORT MAP (
          clk => clk,
          reset => reset,
          processor_enable => processor_enable,
          imem_address => imem_address,
          imem_data_in => imem_data_in,
          dmem_data_in => dmem_data_in,
          dmem_address => dmem_address,
          dmem_address_wr => dmem_address_wr,
          dmem_data_out => dmem_data_out,
          dmem_write_enable => dmem_write_enable
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '0';
		processor_enable <= '1';
		
		-- imem_data_in <= "00010000001000000000000000000001"; -- jump
		
		-- Load data memory 0
		imem_data_in <= "10001100001000010000000000000010";
		dmem_data_in <= "00000000000000000000000000000010";
		--assert dmem_address = "00000000000000000000000000000010" report "" severity failure;

		wait for clk_period*3;
		
		-- Jump if r0 and r1 are equal
		imem_data_in <= "00010000001000000000000000000001";

      wait for clk_period*2;
				
		-- Jump if r1 and r0 are equal
		imem_data_in <= "00010000001000010000000000000001";
				
      wait for clk_period*2;

      -- insert stimulus here 

      wait;
   end process;

END;
