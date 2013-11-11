
library ieee;
use ieee.std_logic_1164.all;

use work.mips_constant_pkg.all;
use work.pipeline_types.all;
use work.asserts.all;

entity pipeline_registers_tb is
end pipeline_registers_tb;
 
architecture behavior of pipeline_registers_tb is 
 
    -- Component Declaration for the Units Under Test (UsUT) 
    component register_ifid
        port(
            input: in ifid_t;
            clk  : in std_logic;
            reset  : in std_logic;
            enable : in std_logic;
        
            output: out ifid_t        
        );
    end component;
    component register_idex
        port(
            input: in idex_t;
            clk  : in std_logic;
            reset  : in std_logic;
        
            output: out idex_t        
        );
    end component;
    component register_exmem
        port(
            input: in exmem_t;
            clk  : in std_logic;
            reset  : in std_logic;
        
            output: out exmem_t        
        );
    end component;
    component register_memwb
        port(
            input: in memwb_t;
            clk  : in std_logic;
            reset  : in std_logic;
        
            output: out memwb_t        
        );
    end component;

    --Inputs and outputs
    signal ifid_input     : ifid_t;
    signal ifid_expected  : ifid_t;
    signal ifid_output    : ifid_t;
    signal idex_input     : idex_t;
    signal idex_expected  : idex_t;
    signal idex_output    : idex_t;
    signal exmem_input    : exmem_t;
    signal exmem_expected : exmem_t;
    signal exmem_output   : exmem_t;
    signal memwb_input    : memwb_t;
    signal memwb_expected : memwb_t;
    signal memwb_output   : memwb_t;
    
    signal clk : std_logic;
    signal reset : std_logic;
    signal enable : std_logic;
     
    constant clk_period : time := 10 ns;
    
    -- Damaging control signal in the idex stage
    signal idex_ctrl_signals : std_logic_vector(4 downto 0);
begin
    -- Instantiate the Units Under Test (UsUT)
    uut1: register_ifid port map (
        input => ifid_input,
        clk => clk,
        reset => reset,
        enable => enable,
        output => ifid_output
    );
    
    uut2: register_idex port map (
        input => idex_input,
        clk => clk,
        reset => reset,
        output => idex_output
    );
    
    uut3: register_exmem port map (
        input => exmem_input,
        clk => clk,
        reset => reset,
        output => exmem_output
    );
    
    uut4: register_memwb port map (
        input => memwb_input,
        clk => clk,
        reset => reset,
        output => memwb_output
    );

    -- Clock process definitions
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    -- Stimulus process
    stim_proc: process
    begin
		enable <= '1';
		
        -- Hold reset
        reset <= '1';
        wait for clk_period*2;
        reset <= '0';

        -- Test IFID
        assert (false) report "Testing IFID register" severity note;
        ifid_input <= (others => (others => '0'));
        ifid_expected <= (others => (others => '0'));
        wait for clk_period;        
        assertEqual(ifid_output, ifid_expected);
        
        assert (false) report "Testing that changes do not propagate right away" severity note;
        ifid_input <= (others => (others => '1'));
        wait for clk_period*0.5;
        assertEqual(ifid_output, ifid_expected);
        
        
        assert (false) report "Testing that changes propagate on rising edge" severity note;
        ifid_expected <= (others => (others => '1'));
        wait for clk_period*0.5;
        assertEqual(ifid_output, ifid_expected);
        
        assert (false) report "Testing that reset correctly clears register" severity note;
        ifid_expected <= (others => (others => '0'));
        reset <= '1';
        wait for clk_period*0.5;
        reset <= '0';
        assertEqual(ifid_output, ifid_expected);
        wait for clk_period*0.5;
        
        -- Test IDEX        
        assert (false) report "Testing IDEX register" severity note;
        idex_input <= (
            ctrl_wb => (others => '1'), 
            ctrl_ex => (alu_op => (ALUOP_FUNC), others => '0'), 
            ctrl_m => (others => '1'), 
           	predict_taken => '0',
            others => (others => '0')
        );
        idex_expected <= (
            ctrl_wb => (others => '1'), 
            ctrl_ex => (alu_op => (ALUOP_FUNC), others => '0'), 
            ctrl_m => (others => '1'), 
            predict_taken => '0',
            others => (others => '0')
        );
        wait for clk_period;
        assertEqual(idex_output, idex_expected);
        
        assert (false) report "Testing that changes do not propagate right away" severity note;
        idex_input <= (
            ctrl_m => (others => '1'),
            ctrl_wb => (others => '1'),
            reg1 => X"10101010", 
            
            predict_taken => '1',
            ctrl_ex => (alu_op => (ALUOP_FUNC), others => '0'), 
            others => (others => '0')
        );
        
        wait for clk_period*0.5;
        assertEqual(idex_output, idex_expected);
        idex_expected <= idex_input;
            
        assert (false) report "Testing that changed propagate on rising edge" severity note;
        wait for clk_period*0.5;
        assertEqual(idex_output, idex_expected);
            
        assert (false) report "Testing that reset clears ctrl_m and ctrl_wb signals" severity note;
        reset <= '1';
        idex_expected.ctrl_m <= (others => '0');
        idex_expected.ctrl_wb <= (others => '0');
        wait for clk_period*0.5;
        reset <= '0';
        assertEqual(idex_output, idex_expected);
        wait for clk_period*0.5;
        
        -- Test EXMEM
        assert (false) report "Testing EXMEM register" severity note;
        exmem_input <= (
            ctrl_wb => (others => '1'), 
            ctrl_m => (others => '1'), 
            flags => (others => '1'),
            others => (others => '0')
        );
        exmem_expected <= (
            ctrl_wb => (others => '1'), 
            ctrl_m => (others => '1'), 
            flags => (others => '1'),
            others => (others => '0')
        );
        wait for clk_period;        
        assertEqual(exmem_output, exmem_expected);
        
        assert (false) report "Testing that changes do not propagate right away" severity note;
        exmem_input.flags <= (others => '1');
        wait for clk_period*0.5;
        assertEqual(exmem_output, exmem_expected);
        
        
        assert (false) report "Testing that changes propagate on rising edge" severity note;
        exmem_expected.flags <= (others => '1');
        wait for clk_period*0.5;
        assertEqual(exmem_output, exmem_expected);
        
        assert (false) report "Testing that reset clears ctrl_m and ctrl_wb signals" severity note;
        reset <= '1';
        exmem_expected.ctrl_m <= (others => '0');
        exmem_expected.ctrl_wb <= (others => '0');
        wait for clk_period*0.5;
        reset <= '0';
        assertEqual(exmem_output, exmem_expected);        
        wait for clk_period*0.5;
        
        -- Test MEMWB
        assert (false) report "Testing MEMWB register" severity note;
        memwb_input <= (
            ctrl_wb => (others => '1'), 
            others => (others => '0')
        );
        memwb_expected <= (
            ctrl_wb => (others => '1'), 
            others => (others => '0')
        );
        wait for clk_period;        
        assertEqual(memwb_output, memwb_expected);
        
        assert (false) report "Testing that changes do not propagate right away" severity note;
        memwb_input.mem_data <= (others => '1');
        wait for clk_period*0.5;
        assertEqual(memwb_output, memwb_expected);
        
        
        assert (false) report "Testing that changes propagate on rising edge" severity note;
        memwb_expected.mem_data <= (others => '1');
        wait for clk_period*0.5;
        assertEqual(memwb_output, memwb_expected);
        
        assert (false) report "Testing that reset clears ctrl_wb signals" severity note;
        memwb_expected.ctrl_wb <= (others => '0');
        reset <= '1';
        wait for clk_period*0.5;
        reset <= '0';
        assertEqual(memwb_output, memwb_expected);        
        wait for clk_period*0.5;
        
        wait;
    end process;
end;
