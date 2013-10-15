library ieee;
use ieee.std_logic_1164.all;

use work.pipeline_types.all;

-- PC Next stage
entity stage_pc_next is
	generic ( N: natural := 32 );
	port (
		clk            : in std_logic;
		reset          : in std_logic;
		pc_next        : in pc_next_t;

		pc_current     : out std_logic_vector(N-1 downto 0);
		pc_incremented : out std_logic_vector(N-1 downto 0)
	);
end stage_pc_next;

architecture Behaviour of stage_pc_next is
	-- Added needed for pc incrementation
	component adder is
		generic (
			N: natural := N
		);
		port (
			x    : in std_logic_vector(N-1 downto 0);
			y    : in std_logic_vector(N-1 downto 0);
			cin  : in std_logic;

			cout : out std_logic;
			r    : out std_logic_vector(N-1 downto 0)
		);
	end component;

	-- PC next src mux constants
	constant SRC_INCREMENTED : std_logic := '0';
	constant SRC_JUMP        : std_logic := '1';

	-- Current PC register
	signal pc : std_logic_vector(N-1 downto 0);

	-- Incremented PC value from internal adder
	signal pc_inc : std_logic_vector(N-1 downto 0);
begin

	-- Map output ports
	pc_current <= pc;
	pc_incremented <= pc_inc;

	-- Generate pc_inc by adding one to the current pc
	pc_adder : adder
		port map (
			x   => pc,
			y   => X"00000001",
			cin => '0',			
			r => pc_inc
		);

	-- Latch next PC value on rising clock edge, value depending on input signal.
	pc_latcher : process(clk, pc_inc, pc_next)
	begin
		if reset = '1' then
			pc <= X"00000000";
		elsif rising_edge(clk) then
			if pc_next.src = SRC_JUMP then
				pc <= pc_next.jump;
			else
				pc <= pc_inc;
			end if;
		end if;
	end process;
end Behaviour;
