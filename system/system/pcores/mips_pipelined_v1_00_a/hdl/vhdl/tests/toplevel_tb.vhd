--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:54:20 05/03/2012
-- Design Name:   
-- Module Name:   E:/My-documents/Dropbox/tdt4255_final/single_cycle/tb_toplevel.vhd
-- Project Name:  single_cycle
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: toplevel
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

use work.asserts.all;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;

ENTITY toplevel_tb IS
END toplevel_tb;
 
ARCHITECTURE behavior OF toplevel_tb IS 
 
  -- Component Declaration for the Unit Under Test (UUT)
  COMPONENT toplevel
    PORT(
      clk : IN  std_logic;
      reset : IN  std_logic;
      command : IN  std_logic_vector(0 to 31);
      bus_address_in : IN  std_logic_vector(0 to 31);
      bus_data_in : IN  std_logic_vector(0 to 31);
      status : OUT  std_logic_vector(0 to 31);
      bus_data_out : OUT  std_logic_vector(0 to 31)
     );
   END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal command : std_logic_vector(0 to 31) := (others => '0');
   signal bus_address_in : std_logic_vector(0 to 31) := (others => '0');
   signal bus_data_in : std_logic_vector(0 to 31) := (others => '0');

 	--Outputs
   signal status : std_logic_vector(0 to 31);
   signal bus_data_out : std_logic_vector(0 to 31);

   -- Clock period definitions
   constant clk_period : time := 40 ns;

	constant zero : std_logic_vector(0 to 31)  := "00000000000000000000000000000000";
	constant addr1 : std_logic_vector(0 to 31) := "00000000000000000000000000000001";
	constant addr2 : std_logic_vector(0 to 31) := "00000000000000000000000000000010";
	constant addr3 : std_logic_vector(0 to 31) := "00000000000000000000000000000011";
	constant addr4 : std_logic_vector(0 to 31) := "00000000000000000000000000000100";
	constant addr5 : std_logic_vector(0 to 31) := "00000000000000000000000000000101";
	constant addr6 : std_logic_vector(0 to 31) := "00000000000000000000000000000110";
	constant addr7 : std_logic_vector(0 to 31) := "00000000000000000000000000000111";
	constant addr8 : std_logic_vector(0 to 31) := "00000000000000000000000000001000";
	constant addr9 : std_logic_vector(0 to 31) := "00000000000000000000000000001001";
	constant addr10: std_logic_vector(0 to 31) := "00000000000000000000000000001010";
  constant addr11: std_logic_vector(0 to 31) := "00000000000000000000000000001011";
  constant addr12: std_logic_vector(0 to 31) := "00000000000000000000000000001100";
  constant addr13: std_logic_vector(0 to 31) := "00000000000000000000000000001101";
  constant addr14: std_logic_vector(0 to 31) := "00000000000000000000000000001110";
  constant addr15: std_logic_vector(0 to 31) := "00000000000000000000000000001111";
  constant addr16: std_logic_vector(0 to 31) := "00000000000000000000000000010000";
  constant addr17: std_logic_vector(0 to 31) := "00000000000000000000000000010001";
  
  -- This is written to memory initially
  constant data1 : std_logic_vector(0 to 31):= "00000000000000000000000000000010";
	constant data2 : std_logic_vector(0 to 31):= "00000000000000000000000000001010";
  
  -- These are the instructions executed by the CPU (loaded to instruction-memory)
  -- See ins.txt for what they actually mean (that is a file used when loading them to the FPGA)
  constant ins0  : std_logic_vector(0 to 31) := X"8C010001";
  constant ins1  : std_logic_vector(0 to 31) := X"8C020002";
  constant ins2  : std_logic_vector(0 to 31) := X"8C020002";
  constant ins3  : std_logic_vector(0 to 31) := X"00221820";
  constant ins4  : std_logic_vector(0 to 31) := X"AC030005";
  constant ins5  : std_logic_vector(0 to 31) := X"10000002";
  constant ins6  : std_logic_vector(0 to 31) := X"AC030003";
  constant ins7  : std_logic_vector(0 to 31) := X"AC030004";
  constant ins8  : std_logic_vector(0 to 31) := X"AC030006";
  constant ins9  : std_logic_vector(0 to 31) := X"AC030007";
  constant ins10 : std_logic_vector(0 to 31) := X"3C030006";
  constant ins11 : std_logic_vector(0 to 31) := X"AC030008";
  constant ins12 : std_logic_vector(0 to 31) := X"00231820";
  constant ins13 : std_logic_vector(0 to 31) := X"AC030009";
  constant ins14 : std_logic_vector(0 to 31) := X"1000FFFD";
  constant ins15 : std_logic_vector(0 to 31) := X"AC03000A";
   
  -- Used to control the COM-module
  constant CMD_IDLE	: std_logic_vector(0 to 31) := "00000000000000000000000000000000";
	constant CMD_WI	  : std_logic_vector(0 to 31) := "00000000000000000000000000000001";
	constant CMD_RD	  : std_logic_vector(0 to 31) := "00000000000000000000000000000010";
	constant CMD_WD	  : std_logic_vector(0 to 31) := "00000000000000000000000000000011";
	constant CMD_RUN	: std_logic_vector(0 to 31) := "00000000000000000000000000000100";
	
	-- Shorthand for writing data and instructions
	procedure writeData(
	    signal bus_command : out std_logic_vector(31 downto 0); 
	    signal bus_address : out std_logic_vector(31 downto 0); 
	    signal bus_data : out std_logic_vector(31 downto 0);
	    command : std_logic_vector(31 downto 0);
	    address : std_logic_vector(31 downto 0); 
	    data : std_logic_vector(31 downto 0))
    is
    
	begin
	    bus_command <= command;					
        bus_address <= address;
        bus_data <= data;
        wait for clk_period*3;
          
        bus_command <= command;					
        bus_address <= zero;
        bus_data <= zero;
        wait for clk_period*3;
    end procedure;
    
    -- Shorthand for writing data and instructions
	procedure assertDataMemory(
	    signal bus_command : out std_logic_vector(31 downto 0); 
	    signal bus_address : out std_logic_vector(31 downto 0); 
	    signal bus_data : in std_logic_vector(31 downto 0);
	    address : in std_logic_vector(31 downto 0); 
	    expected : in std_logic_vector(31 downto 0))
    is
        variable actual : std_logic_vector(31 downto 0);
	begin
	    bus_command <= CMD_RD;					
        bus_address <= address;
        wait for clk_period*3;
        actual := bus_data;
          
        bus_command <= command;					
        bus_address <= zero;
        wait for clk_period*3;
        
        --assertEqual(actual, expected);
    end procedure;

BEGIN
 
  -- Instantiate the Unit Under Test (UUT)
  uut: toplevel PORT MAP (
    clk => clk,
    reset => reset,
    command => command,
    bus_address_in => bus_address_in,
    bus_data_in => bus_data_in,
    status => status,
    bus_data_out => bus_data_out
  );

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

    -- hold reset state for 20 ns.
    wait for 20 ns;	

    command <= CMD_WD;
    bus_address_in <= X"00000001";
    bus_data_in <= X"01010101";

    --writeData(command, bus_address_in, bus_data_in, CMD_WD, X"00000001", X"11001101");

    --assertDataMemory(command, bus_address_in, bus_data_out, X"00000001", X"11001100");
    
    wait ;
 end process;

END;
