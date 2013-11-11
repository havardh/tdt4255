
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;
use work.asserts.all;

entity stage_ex_tb is
end stage_ex_tb;

architecture Behavior of stage_ex_tb is 

	component stage_ex is
	port (
		input     : in idex_t;
		
		-- Forwarding control signals and data
		forwarding_a : in std_logic_vector(1 downto 0);
		forwarding_b : in std_logic_vector(1 downto 0);
		ex_mem_rd    : in std_logic_vector(N-1 downto 0);
		mem_wb_rd    : in std_logic_vector(N-1 downto 0);
		
		reg_values_equal : out std_logic;
		flush : out std_logic;
		pc_corrected : out std_logic_vector(N-1 downto 0);
		
		output: out exmem_t
	);
	end component;

	-- Input
	signal input : idex_t;

	-- Output
	signal output : exmem_t;
	signal reg_values_equal, flush : std_logic;
	signal pc_corrected : std_logic_vector(N-1 downto 0);
	
	-- Forwarding signals
	signal forwarding_a, forwarding_b : std_logic_vector(1 downto 0);
	signal ex_mem_rd, mem_wb_rd : std_logic_vector(N-1 downto 0);
 

begin
	
	uut: stage_ex
	  port map (
			input => input,
			output => output,
			
			forwarding_a => forwarding_a,
			forwarding_b => forwarding_b,
			ex_mem_rd => ex_mem_rd,
			mem_wb_rd => mem_wb_rd,
			
			reg_values_equal => reg_values_equal,
			pc_corrected => pc_corrected,
			flush => flush
		);

	stim_proc: process
	begin
		
		-------------------------------------
		-- Test basic arithmic operations: --
		-------------------------------------
		-- Reset input signals
		input <= (
			ctrl_ex => (alu_op => ALUOP_FUNC, others => '0'),
			ctrl_m  => (others => '0'),
			ctrl_wb => (others => '0'),
		    predict_taken => '0',
			read_reg_rs_addr => (others => '0'),
			read_reg_rt_addr => (others => '0'),
			write_reg_rd_addr => (others => '0'),
			others  => (others => '0')
		);
	    
	    forwarding_a <= "00";
		forwarding_b <= "00";
		wait for 1 ns;
		
		-- Set register values for all following tests
		input.reg1 <= X"0000FF0F"; -- 65295
		input.reg2 <= X"00000FF0"; --  4080
		ex_mem_rd  <= X"00000F0F"; --  3855
		mem_wb_rd  <= X"0000F00F"; -- 61455
		input.ctrl_ex.alu_op <= ALUOP_FUNC;
		input.write_reg_rd_addr <= "00110";
		input.ctrl_ex.reg_dst <= '1';
		
		-- Check that write register passed correctly to next stage
		assert (false) report "Asserting that write register passes to next stage" severity note;
		assertEqual(output.write_reg_addr, input.write_reg_rd_addr);
		
		-- Add
		assert (false) report "Testing ADD" severity note;
		input.sign_extended <= X"00000020";
		
		forwarding_a <= "00";
		forwarding_b <= "00";
		wait for 1 ns;
		assertEqual(output.alu_result, X"00010EFF"); -- reg1 + reg2
		
		assert (false) report " - forwarding_a = 10, forwarding_b = 01" severity note;
		forwarding_a <= "10";
		forwarding_b <= "01";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000FF1E"); -- ex_mem_rd + mem_wb_rd
				
		assert (false) report " - forwarding_a = 01, forwarding_b = 10" severity note;
		forwarding_a <= "01";
		forwarding_b <= "10";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000FF1E"); -- mem_wb_rd + ex_mem_rd
		
		
		-- Sub
		assert (false) report "Testing SUB" severity note;
		input.sign_extended <= X"00000022";
		
		forwarding_a <= "00";
		forwarding_b <= "00";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000EF1F"); -- reg1 - reg2
		assert output.flags.zero = '0' report "Flags.Zero not 0 after positive result";
		
		assert (false) report " - forwarding_a = 10, forwarding_b = 01" severity note;
		forwarding_a <= "10";
		forwarding_b <= "01";
		wait for 1 ns;
		assertEqual(output.alu_result, X"FFFF1F00"); -- ex_mem_rd - mem_wb_rd
				
		assert (false) report " - forwarding_a = 01, forwarding_b = 10" severity note;
		forwarding_a <= "01";
		forwarding_b <= "10";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000E100"); -- mem_wb_rd - ex_mem_rd
		
		assert (false) report " - forwarding_a = 10, forwarding_b = 10" severity note;
		forwarding_a <= "10";
		forwarding_b <= "10";
		wait for 1 ns;
		assertEqual(output.alu_result, X"00000000"); -- mem_wb_rd - ex_mem_rd
		assert output.flags.zero = '1' report "Flags.Zero not 0 after positive result";
		
		-- And
		assert (false) report "Testing AND" severity note;
		input.sign_extended <= X"00000024";
		
		forwarding_a <= "00";
		forwarding_b <= "00";
		wait for 1 ns;
		assertEqual(output.alu_result, X"00000F00"); -- reg1 and reg2
		
		
		assert (false) report " - forwarding_a = 10, forwarding_b = 01" severity note;
		forwarding_a <= "10";
		forwarding_b <= "01";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000000F"); -- ex_mem_rd and mem_wb_rd
				
		assert (false) report " - forwarding_a = 01, forwarding_b = 10" severity note;
		forwarding_a <= "01";
		forwarding_b <= "10";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000000F"); -- mem_wb_rd and ex_mem_rd
		
		-- Or
		assert (false) report "Testing OR" severity note;
		input.sign_extended <= X"00000025";
		
		forwarding_a <= "00";
		forwarding_b <= "00";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000FFFF");
		
		
		assert (false) report " - forwarding_a = 10, forwarding_b = 01" severity note;
		forwarding_a <= "10";
		forwarding_b <= "01";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000FF0F"); -- ex_mem_rd or mem_wb_rd
				
		assert (false) report " - forwarding_a = 01, forwarding_b = 10" severity note;
		forwarding_a <= "01";
		forwarding_b <= "10";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000FF0F"); -- mem_wb_rd or ex_mem_rd
		
		-------------------------------------
		-- Test load and stores:           --
		-------------------------------------
		-- Reset input signals
		input <= (
			ctrl_ex => (alu_op => ALUOP_FUNC, others => '0'),
			ctrl_m  => (others => '0'),
			ctrl_wb => (others => '0'),
         
		    predict_taken => '0',
			read_reg_rs_addr => (others => '0'),
			read_reg_rt_addr => (others => '0'),
			write_reg_rd_addr => (others => '0'),
			others  => (others => '0')
		);
		forwarding_a <= "00";
		forwarding_b <= "00";
		wait for 1 ns;
		
		-- Set up for a load/store instruction
		input.ctrl_ex.alu_op <= ALUOP_LOAD_STORE;
		input.ctrl_ex.alu_src <= '1';
		input.ctrl_ex.reg_dst <= '0';
		input.sign_extended <= X"0000F000";
		input.reg1 <= X"00F0000F";
		input.read_reg_rt_addr <= "11010";
		wait for 1 ns;
		
		assert (false) report "Testing LOAD/STORE instructions" severity note;
		assertEqual(output.alu_result, X"00F0F00F"); -- sign_extended + reg1
		assertEqual(output.write_reg_addr, "11010"); -- read rt passed to write rd
		
		
		wait;
		
	end process;
		
end Behavior;
