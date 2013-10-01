--------------------------------------------------------------------------------
-- Processor test bench
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
library work;
use work.asserts.all;
 
entity processor_tb is
end processor_tb;
 
architecture behavior of processor_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component processor port (
         clk               : in std_logic;
         reset             : in  std_logic;
         processor_enable  : in  std_logic;
         imem_address      : out  std_logic_vector(31 downto 0);
         imem_data_in      : in  std_logic_vector(31 downto 0);
         dmem_data_in      : in  std_logic_vector(31 downto 0);
         dmem_address      : out  std_logic_vector(31 downto 0);
         dmem_address_wr   : out  std_logic_vector(31 downto 0);
         dmem_data_out     : out  std_logic_vector(31 downto 0);
         dmem_write_enable : out  std_logic
        );
    end component;
    

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
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor port map (
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
		wait for clk_period*2;
		
		

		-- Test Load Store
		assert( false ) report "Test Load Store" severity note;
		imem_data_in <= X"3C060001"; -- lui $6, 1
		wait for clk_period*2;
		
		imem_data_in <= X"AD060000"; -- sw $6, 0($zero)
		wait for clk_period*1.5;
		assertEqual(dmem_data_out, X"00010000", X"00010000");
		wait for clk_period*1.5;
		
		-- Test Load Word
		assert( false ) report "Test Load Word" severity note;
		imem_data_in <= X"8C060001"; -- lw $6, 1($0)
		wait for clk_period*2;
		dmem_data_in <= X"00000001"; -- data word
		wait for clk_period*1;
		
		imem_data_in <= X"AD060000"; -- sw $6, 0($zero)
		wait for clk_period*2.5;
		-- Half way through execute
		assertEqual(dmem_data_out, X"00000001", X"00000001");
		wait for clk_period*0.5;
		
		
		-- Test Addition
		assert( false ) report "Test Addition" severity note;
		imem_data_in <= X"3C050001"; -- lui $5, 1
		wait for clk_period*2;
		
		imem_data_in <= X"3C060001"; -- lui $6, 1
		wait for clk_period*2;
		
		imem_data_in <= X"00A63020"; -- add $6, $6, $5
		wait for clk_period*2;
		
		imem_data_in <= X"AD060000"; -- sw $6, 0($zero)
		wait for clk_period*2.5;
		-- Half way through execute
		assertEqual(dmem_data_out, X"00020000", X"00020000");
		wait for clk_period*0.5;
		
		
		
		-- Test Subtraction
		assert( false ) report "Test Subtraction" severity note;
		imem_data_in <= X"3C050001"; -- lui $5, 1
		wait for clk_period*2;
		
		imem_data_in <= X"3C060002"; -- lui $6, 2
		wait for clk_period*2;
		
		imem_data_in <= X"00C51822"; -- sub $3, $6, $5
		wait for clk_period*2;
		
		imem_data_in <= X"AC030000"; -- sw $3, 0($zero)
		wait for clk_period*1.5;
		-- Half way through execute
		assertEqual(dmem_data_out, X"00010000", X"00010000");
		assertEqual(dmem_address_wr, X"00000000", X"00000000");
		wait for clk_period*1.5;
		
		
		
		-- Test AND OR	
		assert( false ) report "Test AND OR" severity note;
		imem_data_in <= X"3C05000A"; -- lui $5, 1010
		wait for clk_period*2;
		
		imem_data_in <= X"3C06000C"; -- lui $6, 1100
		wait for clk_period*2;
				
		imem_data_in <= X"00A61024"; -- and $2, $6, $5
		wait for clk_period*2;
		
		imem_data_in <= X"00A61825"; -- or $3, $6, $5
		wait for clk_period*2;
		
		imem_data_in <= X"AC020000"; -- sw $2, 0($zero)
		wait for clk_period*1.5;
		-- Half way through execute
		assertEqual(dmem_data_out, X"00080000", X"00080000");
		assertEqual(dmem_address_wr, X"00000000", X"00000000");
		wait for clk_period*1.5;
		
		imem_data_in <= X"AC030000"; -- sw $3, 0($zero)
		wait for clk_period*1.5;
		-- Half way through execute
		assertEqual(dmem_data_out, X"000E0000", X"000E0000");
		assertEqual(dmem_address_wr, X"00000000", X"00000000");
		wait for clk_period*1.5;
		
		
		
		-- Test JUMP
		assert( false ) report "Test JUMP" severity note;
		imem_data_in <= X"08000002"; -- j 1
		wait for clk_period*2.5;
		assertEqual(imem_address, X"00000002", X"00000002");
		wait for clk_period*1.5;
		
		-- Test Skip Branch
		assert( false ) report "Test Skip Branch" severity note;
		imem_data_in <= X"08000000"; -- j 0 set pc to 0
		wait for clk_period*2;

		imem_data_in <= X"3C050001"; -- lui $5, 1
		wait for clk_period*2;
		
		imem_data_in <= X"10A00002"; -- j 1
		wait for clk_period*2.5;
		assertEqual(imem_address, X"00000002", X"00000002");
		wait for clk_period*1.5;
		
		
		

		-- Test Branch
		assert( false ) report "Test Branch" severity note;
		imem_data_in <= X"08000000"; -- j 0 set pc to 0
		wait for clk_period*2;
		
		imem_data_in <= X"10000001"; -- beq $0, $0, 1
		wait for clk_period*2.5;
		assertEqual(imem_address, X"00000002", X"00000002");

		wait;

--		-- imem_data_in <= "00010000001000000000000000000001"; -- jump
--
--		-- Load data memory 0 (Set intruction, wait for execute, assert dbus address and then wait for fetch)
--		imem_data_in <= "10001100001000010000000000000010";
--		dmem_data_in <= "00000000000000000000000000000010";
--		wait for clk_period*3.5;
--		assertEqual(dmem_address, "00000000000000000000000000000010","00000000000000000000000000000010");
--		wait for clk_period*0.5;
--
--		-- Branch if r0 and r1 are equal (They should not be, so we expect program counter to be 8 in next fetch
--		imem_data_in <= "00010000001000000000000000000001";
--		wait for clk_period*2.5;
--		assertEqual(imem_address, "00000000000000000000000000000100","00000000000000000000000000000100");
--
--		-- Branch if r1 and r1 are equal (The are, so we expect program counter to be 16 during next fetch)
--		imem_data_in <= "00010000001000010000000000000001";
--		wait for clk_period*2;
--		assertEqual(imem_address, "00000000000000000000000000010000","00000000000000000000000000010000");
--
--		-- Load upper immediate (32 << 16)
--		imem_data_in <= "00111100000000100000000000100000";
--		wait for clk_period/2;
--		wait for clk_period;
--
--		-- Write r2 to memory to validate previous instruction
--		imem_data_in <= "10101100000000100000000000000000";
--		wait for clk_period*3;
--		assertEqual(dmem_data_out, "00000000001000000000000000000000", "00000000001000000000000000000000");
--
--		-- Attempt a JUMP
--		imem_data_in <= "00001011111111111111111111111111";
--		wait for clk_period*2;
--
--		wait for clk_period/2;
--		assertEqual(imem_address, "00001111111111111111111111111100", "00001111111111111111111111111100");
--
--		wait;
   end process;

end;
