library ieee;
use ieee.std_logic_1164.all;

use work.asserts.all;

entity branch_prediction_unit_tb is
end entity;

architecture b of branch_prediction_unit_tb is
	component branch_prediction_unit is
		generic (WIDTH : integer := 3);
		port (
			-- Prediction input and outputs
			predict_addr : in std_logic_vector(WIDTH-1 downto 0);
			prediction   : out std_logic;
		
			-- Correction inputs
			correct_addr   : in std_logic_vector(WIDTH-1 downto 0);
			correct_action : in std_logic;
			correct_enable : in std_logic;
			clk            : in std_logic
		);
	end component;
	
	signal predict_addr, correct_addr : std_logic_vector(2 downto 0) := "000";
	signal prediction, correct_action, correct_enable, clk : std_logic;
	
	
    -- Clock period definitions
    constant clk_period : time := 50 ns;
begin
	
	uut: branch_prediction_unit 
		port map (
			predict_addr => predict_addr,
			prediction => prediction,
			
			correct_addr => correct_addr,
			correct_action => correct_action,
			correct_enable => correct_enable,
			clk => clk
		);
		
	-- Clock process definitions
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
	
	stim_proc: process
	begin        
		
		assert (false) report "Test that default prediction is taken" severity note;
		predict_addr <= "101";
		wait for 1 ns;
		assertEqual(prediction, '1', "Prediction is not 1");
		
		assert (false) report "Test that default prediction is changed after not taken branch" severity note;
		correct_addr <= "101";
		correct_action <= '0';
		correct_enable <= '1';
		predict_addr <= "101";
		wait for clk_period;		
		assertEqual(prediction, '0', "Prediction is not 0");
		
		assert (false) report "Test that the state does not change if enable is low" severity note;
		correct_addr <= "101";
		correct_action <= '1';
		correct_enable <= '0';
		predict_addr <= "101";
		wait for clk_period;		
		assertEqual(prediction, '0', "Prediction is not 0");
		
		
		assert (false) report "Test that the state does change if enable is high" severity note;
		correct_addr <= "101";
		correct_action <= '1';
		correct_enable <= '1';
		predict_addr <= "101";
		wait for clk_period;		
		assertEqual(prediction, '1', "Prediction is not 1");
		
		assert (false) report "Test that one taken and one not taken results in taken predict" severity note;		
		correct_addr <= "101";
		correct_action <= '1';
		correct_enable <= '1';
		predict_addr <= "101";
		wait for clk_period;
		correct_action <= '0';
		wait for clk_period;
		assertEqual(prediction, '1', "Prediction is not 1");
		
		assert (false) report "Test that one taken and two not taken results in not taken predict" severity note;		
		correct_addr <= "101";
		correct_action <= '1';
		correct_enable <= '1';
		predict_addr <= "101";
		wait for clk_period;
		correct_action <= '0';
		wait for clk_period*2;
		assertEqual(prediction, '0', "Prediction is not 1");
		
		assert (false) report "Test that we need two not taken to get a negative predict after several positives" severity note;		
		correct_addr <= "101";
		correct_action <= '1';
		correct_enable <= '1';
		predict_addr <= "101";
		wait for clk_period*5;
		correct_action <= '0';
		-- We expect positive after 5 positives
		assertEqual(prediction, '1', "Prediction is not 1");
		wait for clk_period;
		-- We expect positive after only one negative
		assertEqual(prediction, '1', "Prediction is not 1");
		wait for clk_period;
		-- After two negatives we expect not taken prediction
		assertEqual(prediction, '0', "Prediction is not 0");
		
		assert (false) report "Test that we need two taken to get a positive predict after several negatives" severity note;		
		correct_addr <= "101";
		correct_action <= '0';
		correct_enable <= '1';
		predict_addr <= "101";
		wait for clk_period*5;
		correct_action <= '1';
		-- We expect positive after 5 positives
		assertEqual(prediction, '0', "Prediction is not 0");
		wait for clk_period;
		-- We expect positive after only one negative
		assertEqual(prediction, '0', "Prediction is not 0");
		wait for clk_period;
		-- After two negatives we expect not taken prediction
		assertEqual(prediction, '1', "Prediction is not 1");
		
		
		wait;		
	end process;
		
end architecture;
