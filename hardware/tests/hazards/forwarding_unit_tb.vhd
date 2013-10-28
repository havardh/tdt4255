library ieee;
use ieee.std_logic_1164.all;

use work.asserts.all;

entity forwarding_unit_tb is
end forwarding_unit_tb;

architecture Behavior of forwarding_unit_tb is
	
	-- Component Declaration for the Unit Under Test (UUT)
	component forwarding_unit is
		port (
			id_ex_register_rs	: in std_logic_vector (4 downto 0);
			id_ex_register_rt	: in std_logic_vector (4 downto 0);
			ex_mem_register_rd	: in std_logic_vector (4 downto 0);
			mem_wb_register_rd	: in std_logic_vector (4 downto 0);
			ex_mem_reg_write	: in std_logic;
			mem_wb_reg_write	: in std_logic;
			forwarding_A 		: out std_logic_vector (1 downto 0);
			forwarding_B 		: out std_logic_vector (1 downto 0)
		);
	end component;
	
	-- inputs
	signal id_ex_register_rs  : std_logic_vector (4 downto 0);
	signal id_ex_register_rt  : std_logic_vector (4 downto 0);
	signal ex_mem_register_rd : std_logic_vector (4 downto 0);
	signal mem_wb_register_rd : std_logic_vector (4 downto 0);
	signal ex_mem_reg_write   : std_logic;
	signal mem_wb_reg_write   : std_logic;
	--outputs
	signal forwarding_A 	  : std_logic_vector (1 downto 0);
	signal forwarding_B 	  : std_logic_vector (1 downto 0);
			
begin
	
	-- Instantiate the Unit Under Test (UUT)
	uut: forwarding_unit 
		port map (
			id_ex_register_rs 	=> id_ex_register_rs,
			id_ex_register_rt 	=> id_ex_register_rt,
			ex_mem_register_rd  => ex_mem_register_rd,
			mem_wb_register_rd	=> mem_wb_register_rd,
			ex_mem_reg_write	=> ex_mem_reg_write,
			mem_wb_reg_write	=> mem_wb_reg_write,
			forwarding_A 		=> forwarding_A,
			forwarding_B 		=> forwarding_B 
		);

	stim_proc: process
	begin        
		wait for 10 ns;	
		
		-- testing forwarding_A = "00"
		ex_mem_reg_write	<= '1';
		mem_wb_reg_write	<= '1';
		id_ex_register_rs 	<= "00100";
		id_ex_register_rt 	<= "00010";
		ex_mem_register_rd  <= "01000";
		mem_wb_register_rd	<= "10000";
		wait for 10 ns;
		assert(false) report "testing forwarding_A set to 00 " severity note;
		assertEqual(forwarding_A, "00");
		assert(false) report "testing forwarding_B set to 00 " severity note;
		assertEqual(forwarding_B, "00");
		
		--testing forwarding_A = "10"
		ex_mem_reg_write	<= '1';
		mem_wb_reg_write	<= '1';
		id_ex_register_rs 	<= "00100";
		id_ex_register_rt 	<= "00010";
		ex_mem_register_rd  <= "00100";
		mem_wb_register_rd	<= "00110";
		wait for 10 ns;	
		
		assert(false) report "testing forwarding_A set to 10 " severity note;
		assertEqual(forwarding_A, "10");
		
		-- Test forwarding_A = "10" if both stages write rd
		ex_mem_reg_write	<= '1';
		mem_wb_reg_write	<= '1';
		id_ex_register_rs 	<= "00100";
		id_ex_register_rt 	<= "00010";
		ex_mem_register_rd  <= "00100";
		mem_wb_register_rd	<= "00100";
		wait for 10 ns;	
		
		assert(false) report "testing forwarding_A set to 10 when both stages write " severity note;
		assertEqual(forwarding_A, "10");
		
		-- Test forwarding_B = "10" if both stages write rd
		ex_mem_reg_write	<= '1';
		mem_wb_reg_write	<= '1';
		id_ex_register_rs 	<= "00100";
		id_ex_register_rt 	<= "00010";
		ex_mem_register_rd  <= "00010";
		mem_wb_register_rd	<= "00010";
		wait for 10 ns;	
		
		assert(false) report "testing forwarding_B set to 10 when both stages write " severity note;
		assertEqual(forwarding_B, "10");
		
		-- testing forwarding_B = "10"
		ex_mem_reg_write	<= '1';
		mem_wb_reg_write	<= '1';
		id_ex_register_rs 	<= "00100";
		id_ex_register_rt 	<= "00010";
		ex_mem_register_rd  <= "00010";
		mem_wb_register_rd	<= "00011";
		wait for 10 ns;
		
		assert(false) report "testing forwarding_B set to 10 " severity note;
		assertEqual(forwarding_B, "10");
		
		-- testing forwarding_A = "01"
		ex_mem_reg_write	<= '1';
		mem_wb_reg_write	<= '1';
		id_ex_register_rs 	<= "00100";
		id_ex_register_rt 	<= "00010";
		ex_mem_register_rd  <= "00110";
		mem_wb_register_rd	<= "00100";
		wait for 10 ns;
		
		assert(false) report "testing forwarding_A set to 01 " severity note;
		assertEqual(forwarding_A, "01");
		
		-- testing forwarding_B = "01"
		ex_mem_reg_write	<= '1';
		mem_wb_reg_write	<= '1';
		id_ex_register_rs 	<= "00100";
		id_ex_register_rt 	<= "00010";
		ex_mem_register_rd  <= "00011";
		mem_wb_register_rd	<= "00010";
		wait for 10 ns;
		
		assert(false) report "testing forwarding_B set to 01 " severity note;
		assertEqual(forwarding_B, "01");
		
		wait;
	end process;

end;
