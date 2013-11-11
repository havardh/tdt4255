
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;
use work.asserts.all;

entity stage_id_tb is
end stage_id_tb;

architecture Behavior of stage_id_tb is 

	component stage_id is
	port (
		clk : in std_logic;
		reset : in std_logic;
		
		stall : in std_logic;
		flush : in std_logic;
		
		predict_taken : in std_logic;
		
		wb : in wb_t;
		ifid : in ifid_t;
		idex : out idex_t;
		
		forwarding_C : in std_logic;
		forwarding_D : in std_logic
	);
	end component;

	-- Clock Constant
	constant clk_period : time := 10 ns;	

	-- Control Signals
	signal clk   : std_logic;
	signal reset : std_logic;

	-- Input
	signal stall          : std_logic; 
	signal flush          : std_logic;
	signal predict_taken  : std_logic;
	signal wb             : wb_t;
	signal ifid           : ifid_t;
	
	-- Forwarding
	signal forwarding_C, forwarding_D : std_logic;

	-- Output
	signal idex                  : idex_t;
	
	-- Control Unit output
	signal ctrl_output : std_logic_vector(6 downto 0);

begin
	
	uut: stage_id
	  port map (
			clk => clk,
			reset => reset,

			stall => stall,
			flush => flush,
			predict_taken => predict_taken,
			wb => wb,
			ifid => ifid,
			idex => idex,
			
			forwarding_C => forwarding_C,
			forwarding_D => forwarding_D
		);

	-- Map up control_unit output for easy assertions
	ctrl_output(6) <= idex.ctrl_ex.reg_dst;
	ctrl_output(5) <= idex.ctrl_ex.alu_src;
	ctrl_output(4) <= idex.ctrl_ex.jump;
	ctrl_output(3) <= idex.ctrl_ex.branch;
	ctrl_output(2) <= idex.ctrl_m.mem_write;
	ctrl_output(1) <= idex.ctrl_wb.mem_to_reg;
	ctrl_output(0) <= idex.ctrl_wb.reg_write;
	
	clk_process: process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;

	stim_proc: process
	begin

		-- Set all signals to 0
		wb.reg_write <= '0';
		wb.write_data <= (others => '0');
		wb.write_addr <= (others => '0');
		ifid.instruction <= (others => '0');
		ifid.pc_incremented <= (others => '0');
		stall <= '0';
		flush <= '0';
		predict_taken <= '0';
		forwarding_C <= '0';
		forwarding_D <= '0';

		-- Reset all
		reset <= '1';
		wait for clk_period*2;
		reset <= '0';


		-----------------------
		-----------------------
		-- Synchronous Tests --
		-----------------------
		-----------------------
		
		------------------------
		-- Test Register File --
		------------------------

		-- Write 1 to register 1
		wb.reg_write <= '1';
		wb.write_data <= X"00000001";
		wb.write_addr <= "00001";
		wait for clk_period;

		-- Write 5 to register 0
		wb.reg_write <= '1';
		wb.write_data <= X"00000005";
		wb.write_addr <= "00000";
		wait for clk_period;

		-- Read the values of $zero and $1 with: add $0 $1 $0 // $0 = $0 + $1
		wb.reg_write <= '0';
		ifid.instruction <= "00000000000000010000000000000000";
		wait for 1 ns;
		assert (false) report "Read the values of $zero and $1 with: add $0 $1 $0 // $0 = $0 + $1" severity note;
		assertEqual(ifid.instruction, "00000000000000010000000000000000");
		wait for clk_period;

		
		------------------------
		-- Test Branch Target --
		------------------------

		-- Branch target should be equal to pc_incremented if imm is zero
		ifid.instruction <= "00010000000000000000000000000000";
		ifid.pc_incremented <= X"00000ABC";
		wait for clk_period;
		assert (false) report "Branch target should be equal to pc_incremented if imm is zero" severity note;
		assertEqual(idex.branch_target, X"00000ABC");

		-- Branch target should be product of pc_incremented and imm
		ifid.instruction <= X"10000111";
		ifid.pc_incremented <= X"00000111";
		wait for clk_period;
		assert (false) report "Branch target should be product of pc_incremented and imm" severity note;
		assertEqual(idex.branch_target, X"00000222");
		
		------------------------
		------------------------
		-- Asynchronous Tests --
		------------------------
		------------------------
		
		----------------------
		-- Test Sign Extend --
		----------------------

		-- Test sign extend negative 
		ifid.instruction <= X"0000FFFF";
		wait for 1 ns;
		assert (false) report "Test sign extend negative" severity note;
		assertEqual(idex.sign_extended, X"FFFFFFFF");

		-- Test sign extend positive number
		ifid.instruction <= X"00007FFF";
		wait for 1 ns;
		assert (false) report "Test sign extend positive number" severity note;
		assertEqual(idex.sign_extended, X"00007FFF");

		
    ----------------------------------
		-- Test I and R type Write Addr --
		----------------------------------

		-- Test Load (I-type)
		ifid.instruction <= "10001100000010100000000000000000";
		wait for 1 ns;
		assert (false) report "Test Load (I-type)" severity note;
		assertEqual(idex.read_reg_rt_addr, "01010");

		-- Test Add (R-Type)
		ifid.instruction <= "00000000000000000011000000100000";
		wait for 1 ns;
		assert (false) report "Test Add (R-Type)" severity note;
		assertEqual(idex.write_reg_rd_addr, "00110");

		
    -----------------------
		-- Test Control Unit --
		-----------------------		
		-- ALU (add)
		ifid.instruction <= "00000000000000000000000000100000";
		wait for 5 ns;
		assertEqual(ctrl_output, "1000001");
		assert (false) report "ALU (add)" severity note;
		assert(idex.ctrl_ex.alu_op = ALUOP_FUNC)
			report "alu_up was not forwared correctly"
			severity warning;

		----------------
		-- Test Stall --
		----------------

		-- Should not write to reg when stall is asserted
		ifid.instruction <= "00000000001000010000100000000000";
		stall <= '1';
		wait for 1 ns;
		assert (false) report "Should not write to reg when stall is asserted" severity note;
		assert(idex.ctrl_wb.reg_write = '0')
			report "reg_write should be 0 for stall"
			severity warning;

		-- Should not write to reg when stall is asserted
		ifid.instruction <= X"AC010001";
		stall <= '1';
		wait for 1 ns;
		assert (false) report "Should not write to reg when stall is asserted" severity note;
		assert (idex.ctrl_m.mem_write = '0')
			report "mem_write should be 0 for stall"
			severity warning;

		-- Should write to reg when stall is not asserted
		ifid.instruction <= "00000000001000010000100000000000";
		stall <= '0';
		wait for 1 ns;
		assert (false) report "Should write to reg when stall is not asserted" severity note;
		assert(idex.ctrl_wb.reg_write = '1')
			report "reg_write should be 1 for non stall"
			severity warning;

		-- Should write to reg when stall is not asserted
		ifid.instruction <= X"AC010001";
		stall <= '0';
		wait for 1 ns;
		assert (false) report "Should write to reg when stall is not asserted" severity note;
		assert (idex.ctrl_m.mem_write = '1')
			report "mem_write should be 1 for non stall"
			severity warning;
			
		----------------
		-- Test Flush --
		----------------

		-- Should not write to reg when flush is asserted
		ifid.instruction <= "00000000001000010000100000000000";
		flush <= '1';
		wait for 1 ns;
		assert (false) report "Should not write to reg when flush is asserted" severity note;
		assert(idex.ctrl_wb.reg_write = '0')
			report "reg_write should be 0 for flush"
			severity warning;
						
		wait;
		
	end process;
		
end Behavior;
