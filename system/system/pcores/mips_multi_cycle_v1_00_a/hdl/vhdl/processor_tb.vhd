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
        
        -- Test Load Store
        assert( false ) report "Test Load Store" severity note;
        wait for clk_period;
        imem_data_in <= X"3C060001"; -- lui $6, 1
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"AD060000"; -- sw $6, 0($zero)
        wait for clk_period;
        assertEqual(dmem_data_out, X"00010000");
        wait for clk_period;
        
        -- Test Load Word
        assert( false ) report "Test Load Word" severity note;
        wait for clk_period;
        imem_data_in <= X"8C060001"; -- lw $6, 1($0)
        wait for clk_period;
        dmem_data_in <= X"00000001"; -- data word
        wait for clk_period;
                
        wait for clk_period;
        imem_data_in <= X"AD060000"; -- sw $6, 0($zero)
        wait for clk_period;
        -- Half way through execute
        assertEqual(dmem_data_out, X"00000001");
        wait for clk_period;        
        
        -- Test Addition
        assert( false ) report "Test Addition" severity note;
        wait for clk_period;
        imem_data_in <= X"3C050001"; -- lui $5, 1
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"3C060001"; -- lui $6, 1
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"00A63020"; -- add $6, $6, $5
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"AD060000"; -- sw $6, 0($zero)
        wait for clk_period;
        assertEqual(dmem_data_out, X"00020000");
        wait for clk_period;
        
        -- Test Subtraction
        assert( false ) report "Test Subtraction" severity note;
        wait for clk_period;
        imem_data_in <= X"3C050001"; -- lui $5, 1
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"3C060002"; -- lui $6, 2
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"00C51822"; -- sub $3, $6, $5
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"AC030000"; -- sw $3, 0($zero)
        wait for clk_period;
        assertEqual(dmem_data_out, X"00010000");
        assertEqual(dmem_address_wr, X"00000000");
        wait for clk_period;
        
        
        -- Test AND OR    
        assert( false ) report "Test AND OR" severity note;
        wait for clk_period;
        imem_data_in <= X"3C05000A"; -- lui $5, 1010
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"3C06000C"; -- lui $6, 1100
        wait for clk_period;
                
        wait for clk_period;
        imem_data_in <= X"00A61024"; -- and $2, $6, $5
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"00A61825"; -- or $3, $6, $5
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"AC020000"; -- sw $2, 0($zero)
        wait for clk_period;
        assertEqual(dmem_data_out, X"00080000");
        assertEqual(dmem_address_wr, X"00000000");
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"AC030000"; -- sw $3, 0($zero)
        wait for clk_period;
        assertEqual(dmem_data_out, X"000E0000");
        assertEqual(dmem_address_wr, X"00000000");
        wait for clk_period;
        
        
        
        -- Test JUMP
        assert( false ) report "Test JUMP" severity note;
        wait for clk_period;
        imem_data_in <= X"08000002"; -- j 2
        wait for clk_period*1.5;
        assertEqual(imem_address, X"00000002");

        
        -- Test Skip Branch
        assert( false ) report "Test Skip Branch" severity note;
        wait for clk_period*0.5; -- Ref previous test
        imem_data_in <= X"08000000"; -- j 0 set pc to 0
        wait for clk_period;

        wait for clk_period;
        imem_data_in <= X"3C050001"; -- lui $5, 1
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"10A00002"; -- j 1
        wait for clk_period*1.5;
        assertEqual(imem_address, X"00000002");
        
        -- Test Branch forward
        assert( false ) report "Test Forward Branch" severity note;
        wait for clk_period*0.5; -- Ref previous test
        imem_data_in <= X"08000000"; -- j 0 set pc to 0
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"10000002"; -- beq $0, $0, 1
        wait for clk_period*1.5;
        assertEqual(imem_address, X"00000003");
        
        -- Test backwards branch
        assert( false ) report "Test Backward Branch" severity note;
        wait for clk_period*0.5; -- Ref previous test
        imem_data_in <= X"08000001"; -- j 0 set pc to 1
        wait for clk_period;
        
        wait for clk_period;
        imem_data_in <= X"1000FFFF"; -- beq $0, $0, -1 (jump to self)
        wait for clk_period*1.5;
        assertEqual(imem_address, X"00000001");

        -- Test set less than - False
        assert( false ) report "Test Set Less Than False" severity note;
        wait for clk_period*0.5; -- Ref prev test    
        imem_data_in <= X"3C050001"; -- lui $5, 1
        wait for clk_period;

        wait for clk_period;
        imem_data_in <= X"00A0202A"; -- slt $4, $5, $0
        wait for clk_period;

        wait for clk_period;
        imem_data_in <= X"AC040000"; -- sw $4, 0($zero)
        wait for clk_period;
        assertEqual(dmem_data_out, X"00000000");
        wait for clk_period;

        -- Test set less than - True
        assert( false ) report "Test Set Less Than True" severity note;
        wait for clk_period;        
        imem_data_in <= X"3C050001"; -- lui $5, 1
        wait for clk_period;

        wait for clk_period;
        imem_data_in <= X"0005202A"; -- slt $4, $0, $5
        wait for clk_period;

        wait for clk_period;
        imem_data_in <= X"AC040000"; -- sw $4, 0($zero)
        wait for clk_period;
        assertEqual(dmem_data_out, X"00000001");
        wait for clk_period;


        wait;

   end process;

end;
