
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
		wb : in wb_t;
		ifid : in ifid_t;
		idex : out idex_t;
		
		forwarding_C : in std_logic;
		forwarding_D : in std_logic;
		wb_write_data : in std_logic_vector(31 downto 0)
	);
	end component;

	-- Clock Constant
	constant clk_period : time := 10 ns;	

	-- Control Signals
	signal clk   : std_logic;
	signal reset : std_logic;

	-- Input
	signal stall          : std_logic; 
	signal wb             : wb_t;
	signal ifid           : ifid_t;
	
	-- Forwarding
	signal forwarding_C, forwarding_D : std_logic;
	signal wb_write_data : std_logic_vector(31 downto 0);

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
			wb => wb,
			ifid => ifid,
			idex => idex,
			
			forwarding_C => forwarding_C,
			forwarding_D => forwarding_D,
			wb_write_data => wb_write_data
		);

	-- Map up control_unit output for easy assertions
	ctrl_output(6) <= idex.ctrl_ex.reg_dst;
	ctrl_output(5) <= idex.ctrl_ex.alu_src;
	ctrl_output(4) <= idex.ctrl_m.jump;
	ctrl_output(3) <= idex.ctrl_m.branch;
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
		forwarding_C <= '0';
		forwarding_D <= '0';
		wb_write_data <= (others => '0');

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
		assertEqual(ifid.instruction, "00000000000000010000000000000000");
		wait for clk_period;

    -- Verify that $1 is updated but $0 is not.
		assertEqual(idex.reg1, X"00000000");
		assertEqual(idex.reg2, X"00000001");
		
		-- Read the values with rt and rs forwarded
		wb.reg_write <= '0';
		forwarding_C <= '1';
		forwarding_D <= '1';
		wb_write_data <= X"00000100";
		ifid.instruction <= "00000000000000000000000000000000";
		wait for 1 ns;
		assertEqual(ifid.instruction, "00000000000000000000000000000000");
		wait for clk_period;

    	-- Verify that $1 is updated but $0 is not.
		assertEqual(idex.reg1, X"00000100");
		assertEqual(idex.reg2, X"00000100");
		
		------------------------
		-- Test Branch Target --
		------------------------

		-- Branch target should be equal to pc_incremented if imm is zero
		ifid.instruction <= "00010000000000000000000000000000";
		ifid.pc_incremented <= X"00000ABC";
		wait for clk_period;
		assertEqual(idex.branch_target, X"00000ABC");

		-- Branch target should be product of pc_incremented and imm
		ifid.instruction <= X"10000111";
		ifid.pc_incremented <= X"00000111";
		wait for clk_period;
		assertEqual(idex.branch_target, X"00000222");

		----------------------
		-- Test Jump Target --
		----------------------

		-- Jump target should be equal to address portion of instruction if pc is low
		ifid.pc_incremented <= X"00000000";
		ifid.instruction <= X"0800ABC0";
		wait for clk_period;
		assertEqual(idex.jump_target, X"0000ABC0");

		-- Jump target should include high order bits of PC
		ifid.pc_incremented <= X"AC000000";
		ifid.instruction <= X"0800ABC0";
		wait for clk_period;
		assertEqual(idex.jump_target, X"AC00ABC0");
		
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
		assertEqual(idex.sign_extended, X"FFFFFFFF");

		-- Test sign extend positive number
		ifid.instruction <= X"00007FFF";
		wait for 1 ns;
		assertEqual(idex.sign_extended, X"00007FFF");

		
    ----------------------------------
		-- Test I and R type Write Addr --
		----------------------------------

		-- Test Load (I-type)
		ifid.instruction <= "10001100000010100000000000000000";
		wait for 1 ns;
		assertEqual(idex.read_reg_rt_addr, "01010");

		-- Test Add (R-Type)
		ifid.instruction <= "00000000000000000011000000100000";
		wait for 1 ns;
		assertEqual(idex.write_reg_rd_addr, "00110");

		
    -----------------------
		-- Test Control Unit --
		-----------------------		

		-- ALU (add)
		ifid.instruction <= "00000000000000000000000000100000";
		wait for 1 ns;
		assertEqual(ctrl_output, "1000001");
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
		assert(idex.ctrl_wb.reg_write = '0')
			report "reg_write should be 0 for stall"
			severity warning;

		-- Should not write to reg when stall is asserted
		ifid.instruction <= X"AC010001";
		stall <= '1';
		wait for 1 ns;
		assert (idex.ctrl_m.mem_write = '0')
			report "mem_write should be 0 for stall"
			severity warning;

		-- Should write to reg when stall is not asserted
		ifid.instruction <= "00000000001000010000100000000000";
		stall <= '0';
		wait for 1 ns;
		assert(idex.ctrl_wb.reg_write = '1')
			report "reg_write should be 1 for non stall"
			severity warning;

		-- Should write to reg when stall is not asserted
		ifid.instruction <= X"AC010001";
		stall <= '0';
		wait for 1 ns;
		assert (idex.ctrl_m.mem_write = '1')
			report "mem_write should be 1 for non stall"
			severity warning;
				
		wait;
		
	end process;
		
end Behavior;
