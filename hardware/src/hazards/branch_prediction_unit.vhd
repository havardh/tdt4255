library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity branch_prediction_unit is
	generic (
		WIDTH : integer := 3
	);
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
end entity;

architecture b of branch_prediction_unit is
	type PREDICTION_STATE is (TAKEN_STRONG, TAKEN, NOT_TAKEN, NOT_TAKEN_STRONG);
	
	constant MEM_SIZE : integer := 2 ** WIDTH;
	type MEM_T is array (MEM_SIZE-1 downto 0) of PREDICTION_STATE;
	
	signal mem : MEM_T := (others => TAKEN);
	
	signal pred_state : PREDICTION_STATE;
	signal corr_state : PREDICTION_STATE;
begin
	pred_state <= mem(to_integer(unsigned(predict_addr(WIDTH-1 downto 0))));
	corr_state <= mem(to_integer(unsigned(correct_addr(WIDTH-1 downto 0))));

	-- Predict branch action based on prediction table
	predictor : process(pred_state)
	begin
		if pred_state = TAKEN or pred_state = TAKEN_STRONG then
			prediction <= '1';
		else
			prediction <= '0';
		end if;
	end process;
	
	-- Correct prediciton table based on actual action taken
	corrector : process(clk, correct_enable, correct_addr, correct_action) 
	begin
		if rising_edge(clk) and correct_enable = '1' then
			if correct_action = '1' then
				if corr_state = NOT_TAKEN_STRONG then
					mem(to_integer(unsigned(correct_addr(WIDTH-1 downto 0)))) <= NOT_TAKEN;
				elsif corr_state = NOT_TAKEN then
					mem(to_integer(unsigned(correct_addr(WIDTH-1 downto 0)))) <= TAKEN;
				else
					mem(to_integer(unsigned(correct_addr(WIDTH-1 downto 0)))) <= TAKEN_STRONG;
				end if;
			else 
				if corr_state = TAKEN_STRONG then
					mem(to_integer(unsigned(correct_addr(WIDTH-1 downto 0)))) <= TAKEN;
				elsif corr_state = TAKEN then
					mem(to_integer(unsigned(correct_addr(WIDTH-1 downto 0)))) <= NOT_TAKEN;
				else
					mem(to_integer(unsigned(correct_addr(WIDTH-1 downto 0)))) <= NOT_TAKEN_STRONG;
				end if;
			end if;
		end if;
	end process;
		
end architecture;
