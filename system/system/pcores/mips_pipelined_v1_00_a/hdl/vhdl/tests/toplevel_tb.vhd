library ieee;
use ieee.std_logic_1164.all;

use work.asserts.all;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;

entity toplevel_tb is
end toplevel_tb;
 
architecture behavior of toplevel_tb is 
 
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
        -- Write 5 to data memory location 0
        writeData(command, bus_address_in, bus_data_in, CMD_WD, X"00000000", X"00000005");
        
        -- 0x00 lw $1, 0($0)
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000000", X"8C010000");

        -- 0x02 sw $1, 1($0)
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000002", X"AC010001");

        -- 0x03 add $2, $1, $0
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000003", X"00201020");
        -- 0x04 add $1, $2, $1
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000004", X"00410820");
        -- 0x05-06 add $1, $1, $1
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000005", X"00210820");
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000006", X"00210820");

        -- 0x07 sw $1, 2($0)
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000007", X"AC010002");
        -- 0x08 sw $2, 3($0)
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000008", X"AC020003");
        
        -- 0x09 lui $10, 0x0F0F
        -- 0011 11-- ---t tttt iiii iiii iiii iiii
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000009", X"3C0A0F0F");
        -- 0x0A lui $11, 0xF0FF
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"0000000A", X"3C0BF0FF");
        
        -- 0x0B sw $10, 4($0)
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"0000000B", X"AC0A0004");
        -- 0x0C sw $11, 5($0)
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"0000000C", X"AC0B0005");
        
        -- 0x0D and $12, $10, $11
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"0000000D", X"014B6024");
                
        -- 0x0E sw $12, 6($0)
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"0000000F", X"AC0C0006");
        
        -- 0x0D or $13, $10, $11
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000010", X"014B6825");
        
        -- 0x0E sw $13, 7($0)
        writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000011", X"AC0D0007");
        
        -- 0x9 or $3, $2, $1 0x28 or 0x5 = 0x2D
        --writeData(command, bus_address_in, bus_data_in, CMD_WI, X"00000009", X"00411825");
        --writeData(command, bus_address_in, bus_data_in, CMD_WI, X"0000000A", X"AC030004"); -- $1 and $2 as expected, but result is wrong. We need a stage_ex testbench
        
        -- Let the processor do it's thing, adjust the wait period to fit the program loaded
        command <= CMD_RUN;	
        wait for clk_period*50;	
        command <= CMD_NONE;
        wait for clk_period;

        -- Assert that the data memory contains what we expect
        assertData(command, bus_address_in, bus_data_out, X"00000000", X"00000005");
        assertData(command, bus_address_in, bus_data_out, X"00000001", X"00000005");
        assertData(command, bus_address_in, bus_data_out, X"00000002", X"00000028"); -- (5+5)+(5+5)
        assertData(command, bus_address_in, bus_data_out, X"00000003", X"00000005");
        assertData(command, bus_address_in, bus_data_out, X"00000004", X"0F0F0000");
        assertData(command, bus_address_in, bus_data_out, X"00000005", X"F0FF0000");
        assertData(command, bus_address_in, bus_data_out, X"00000006", X"000F0000");
        assertData(command, bus_address_in, bus_data_out, X"00000007", X"FFFF0000");


        wait;
    end process;

end;
