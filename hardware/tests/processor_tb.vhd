library ieee;
use ieee.std_logic_1164.all;

library work;
use work.asserts.all;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;

entity processor_tb is
end processor_tb;
 
architecture behavior of processor_tb is 
 
    -- Component Declaration for the Unit Under Test (UUT)
    component processor
			generic  (
        MEM_ADDR_BUS    : integer    := 32;
        MEM_DATA_BUS    : integer    := 32 );
			port ( 
        clk               : in std_logic;
        reset             : in std_logic;
        processor_enable  : in std_logic;
        imem_address      : out std_logic_vector (MEM_ADDR_BUS-1 downto 0);
        imem_data_in      : in std_logic_vector (MEM_DATA_BUS-1 downto 0);
        dmem_data_in      : in std_logic_vector (MEM_DATA_BUS-1 downto 0);
        dmem_address      : out std_logic_vector (MEM_ADDR_BUS-1 downto 0);
        dmem_address_wr   : out std_logic_vector (MEM_ADDR_BUS-1 downto 0);
        dmem_data_out     : out std_logic_vector (MEM_DATA_BUS-1 downto 0);
        dmem_write_enable : out std_logic;
		  
		  imem_address_out  : in std_logic_vector (MEM_ADDR_BUS-1 downto 0)
			);
    end component;
    
    --inputs
    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
		signal processor_enable : std_logic := '0';
		signal imem_data_in : std_logic_vector (31 downto 0);
		signal dmem_data_in : std_logic_vector (31 downto 0);

		-- outputs
		signal imem_address : std_logic_vector (31 downto 0);
		signal dmem_address : std_logic_vector (31 downto 0);
		signal dmem_address_wr : std_logic_vector (31 downto 0);
		signal dmem_data_out : std_logic_vector (31 downto 0);
		signal dmem_write_enable : std_logic;
		signal imem_address_out : std_logic_vector (31 downto 0);

    -- Clock period definitions
    constant clk_period : time := 40 ns;

begin
 
    -- instantiate the Unit Under Test (UUT)
    uut: processor PORT MAP (
        clk => clk,
        reset => reset,
        processor_enable => processor_enable,
				imem_address => imem_address,
				imem_data_in => imem_data_in,
				dmem_data_in => dmem_data_in,
				dmem_address => dmem_address,
				dmem_address_wr => dmem_address_wr,
				dmem_data_out => dmem_data_out,
				dmem_write_enable => dmem_write_enable,
				imem_address_out  => imem_address_out
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

			wait for 100 ns;
			reset <= '0';
			processor_enable <= '1';
			
			-- Test load should produce stall
			imem_data_in <= X"8C010000"; -- lw $1, 0($0)
			wait for clk_period;
			assert( dmem_write_enable = '0' ) report "Load did non cause stall" severity warning;
			imem_data_in <= X"AC010001"; -- sw $1, 1($0)
			wait for clk_period;
			wait for clk_period;
			assert( dmem_write_enable = '0' ) report "Load did non cause stall" severity warning;
			imem_data_in <= X"00211020"; -- add $2, $1, $1
			wait for clk_period;
			imem_data_in <= X"00111020"; -- add $1, $1, $1
			wait for clk_period;
			assert( dmem_write_enable = '1' ) report "Load did non cause stall" severity warning;
			
			wait;
    end process;

end;
