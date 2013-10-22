
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
		--forwarding_a : in std_logic_vector(1 downto 0);
		--forwarding_b : in std_logic_vector(1 downto 0);
		--ex_mem_rd    : in std_logic_vector(N-1 downto 0);
		--mem_wb_rd    : in std_logic_vector(N-1 downto 0);
		
		output: out exmem_t
	);
	end component;

	-- Input
	signal input : idex_t;

	-- Output
	signal output : exmem_t;
	
	-- Forwarding signals
	--signal forwarding_a, forwarding_b : std_logic_vector(1 downto 0);
	--signal ex_mem_rd, mem_wb_rd : std_logic_vector(N-1 downto 0);
 

begin
	
	uut: stage_ex
	  port map (
			input => input,
			output => output--,
			
			--forwarding_a => forwarding_a,
			--forwarding_b => forwarding_b,
			--ex_mem_rd => ex_mem_rd,
			--mem_wb_rd => mem_wb_rd
		);

	stim_proc: process
	begin

		-- Reset input signals
		input <= (
			ctrl_ex => (alu_op => ALUOP_FUNC, others => '0'),
			ctrl_m => (others => '0'),
			ctrl_wb => (others => '0'),
			others => (others => '0')
		);
		wait for 1 ns;
		
		-------------------------------------
		-- Test basic arithmic operations: --
		-------------------------------------
		
		-- Set register values for all following tests
		input.reg1 <= X"0000FF0F"; -- 65295
		input.reg2 <= X"00000FF0"; --  4080
		input.ctrl_ex.alu_op <= ALUOP_FUNC;
		
		-- Add
		assert (false) report "Testing ADD" severity note;
		input.sign_extended <= X"00000020";
		wait for 1 ns;
		assertEqual(output.alu_result, X"00010EFF");
		
		-- Sub
		assert (false) report "Testing SUB" severity note;
		input.sign_extended <= X"00000022";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000EF1F");
		
		-- And
		assert (false) report "Testing AND" severity note;
		input.sign_extended <= X"00000024";
		wait for 1 ns;
		assertEqual(output.alu_result, X"00000F00");
		
		-- Or
		assert (false) report "Testing OR" severity note;
		input.sign_extended <= X"00000025";
		wait for 1 ns;
		assertEqual(output.alu_result, X"0000FFFF");
		
		
		
		wait;
		
	end process;
		
end Behavior;
