library ieee;
use ieee.std_logic_1164.all;

use work.asserts.all;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;

entity for_tb is
end for_tb;
 
architecture behavior of for_tb is 
 
    -- Component Declaration for the Unit Under Test (UUT)
    component toplevel
        port (
            clk : in  std_logic;
            reset : in  std_logic;
            command : in  std_logic_vector(31 downto 0);
            bus_address_in : in  std_logic_vector(31 downto 0);
            bus_data_in : in  std_logic_vector(31 downto 0);
            status : out  std_logic_vector(31 downto 0);
            bus_data_out : out  std_logic_vector(31 downto 0)
        );
    end component;
    
    --inputs
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal command : std_logic_vector(31 downto 0) := (others => '0');
    signal bus_address_in : std_logic_vector(31 downto 0) := (others => '0');
    signal bus_data_in : std_logic_vector(31 downto 0) := (others => '0');

    --outputs
    signal status : std_logic_vector(31 downto 0);
    signal bus_data_out : std_logic_vector(31 downto 0);

    -- Clock period definitions
    constant clk_period : time := 40 ns;

    -- Zero constant
    constant zero : std_logic_vector(31 downto 0)  := X"00000000";
   
    -- used to control the COM-module
    constant CMD_NONE : std_logic_vector(31 downto 0) := X"00000000";
    constant CMD_WI   : std_logic_vector(31 downto 0) := X"00000001";
    constant CMD_RD   : std_logic_vector(31 downto 0) := X"00000002";
    constant CMD_WD   : std_logic_vector(31 downto 0) := X"00000003";
    constant CMD_RUN  : std_logic_vector(31 downto 0) := X"00000004";
	
	-- Shorthand for writing data and instructions
	procedure writeData(
	    signal bus_command : out std_logic_vector(31 downto 0); 
	    signal bus_address : out std_logic_vector(31 downto 0); 
	    signal bus_data : out std_logic_vector(31 downto 0);
	    command : std_logic_vector(31 downto 0);
	    address : std_logic_vector(31 downto 0); 
	    data : std_logic_vector(31 downto 0)) is    
	begin
	    bus_command <= command;					
        bus_address <= address;
        bus_data <= data;
        wait for clk_period*3;
          
        bus_command <= CMD_NONE;					
        bus_address <= zero;
        bus_data <= zero;
        wait for clk_period*3;
    end procedure;
    
    -- Shorthand for writing data and instructions
	procedure assertData(
	    signal bus_command : out std_logic_vector(31 downto 0); 
	    signal bus_address : out std_logic_vector(31 downto 0); 
	    signal bus_data : in std_logic_vector(31 downto 0);
	    address : std_logic_vector(31 downto 0); 
	    expected : std_logic_vector(31 downto 0)) is
	begin
	    bus_command <= CMD_RD;					
        bus_address <= address;
        wait for clk_period*3;        
          
        bus_command <= CMD_NONE;					
        bus_address <= zero;
        wait for clk_period*2;      
        -- TODO Error messages are broken somehow here, but asserting will correctly pass and fail
        assertEqual(bus_data, expected);
        wait for clk_period*1;
    end procedure;
    
begin
 
    -- instantiate the Unit Under Test (UUT)
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
                
		  -- write to mem
		  writeData(command, bus_address_in, bus_data_in, CMD_WD, X"00000000", X"00000000");
		  writeData(command, bus_address_in, bus_data_in, CMD_WD, X"00000001", X"00000001");
        writeData(command, bus_address_in, bus_data_in, CMD_WD, X"00000002", X"00000005");
		  
		  -- lw $1, 0($0)
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000000", X"8C010000"); -- i
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000001", X"8C020001"); -- ++
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000002", X"8C030002"); -- n
		  
        -- i++
		  --writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000003", X"00220820");
		  -- i < n
        --writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000004", X"1061FFFD");
		  
		  -- sw
        --writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000005", X"AC010002");
		  
		  command <= CMD_RUN;
        wait for clk_period*20;
        command <= CMD_NONE;
        wait for clk_period;

		  assert( false) report "Done TC #2" severity note;
        
		  
		  wait;
    end process;

end;
