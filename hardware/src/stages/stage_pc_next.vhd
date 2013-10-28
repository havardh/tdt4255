library ieee;
use ieee.std_logic_1164.all;

use work.pipeline_types.all;

-- PC Next stage
entity stage_pc_next is
	generic ( N: natural := 32 );
	port (
		clk            : in std_logic;
		reset          : in std_logic;
		enable         : in std_logic;
		pc_opt        : in pc_next_t;
		
		stall : in std_logic;
		
		--jump : in std_logic_vector(N-1 downto 0);
		--src  : in std_logic;
		
		pc             : in std_logic_vector(N-1 downto 0);
	
		pc_next        : out std_logic_vector(N-1 downto 0)
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

	signal pc_inc : std_logic_vector(N-1 downto 0);
begin


	-- Generate pc_inc by adding one to the current pc
	pc_adder : adder
		port map (
			x   => pc,
			y   => X"00000001",
			cin => '0',
			r => pc_inc
		);

	-- Latch next PC value on rising clock edge, value depending on input signal.
	pc_latcher : process(enable, clk, reset, pc_inc, pc_opt, stall)
	begin
		if reset = '1' then
			pc_next <= X"00000000";
	   else
			if enable = '1' then
				if stall = '1' then
					pc_next <= pc;
				elsif pc_opt.src = SRC_JUMP then
					pc_next <= pc_opt.jump;
				else
					pc_next <= pc_inc;
				end if;
			else
				pc_next <= X"00000000";
			end if;
		end if;
	end process;
end Behaviour;
