----------------------------------------------------------------------------------
-- Processor implementation
-- 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.mips_constant_pkg.all;

-- Processor interface, as defined by the provided toplevel implementation
entity processor is	
	generic  (
		MEM_ADDR_BUS	: integer	:= 32;
		MEM_DATA_BUS	: integer	:= 32 );
	port ( 
		clk                 : in std_logic;
		reset				: in std_logic;
		processor_enable	: in  std_logic;
		imem_address 		: out  std_logic_vector (MEM_ADDR_BUS-1 downto 0);
		imem_data_in 		: in  std_logic_vector (MEM_DATA_BUS-1 downto 0);
		dmem_data_in 		: in  std_logic_vector (MEM_DATA_BUS-1 downto 0);
		dmem_address 		: out  std_logic_vector (MEM_ADDR_BUS-1 downto 0);
		dmem_address_wr	    : out  std_logic_vector (MEM_ADDR_BUS-1 downto 0);
		dmem_data_out		: out  std_logic_vector (MEM_DATA_BUS-1 downto 0);
		dmem_write_enable	: out  std_logic
	);
end processor;

architecture Behavioral of processor is	

	component adder is 		
		generic (N: natural);   
		port(
			x    : in STD_LOGIC_VECTOR(31 downto 0);
			Y    : in STD_LOGIC_VECTOR(31 downto 0);
		   CIN  : in STD_LOGIC;
		   COUT : out STD_LOGIC;
		   R    : out STD_LOGIC_VECTOR(31 downto 0)
	);
	end component;

	type const_state      is (FETCH, EXECUTE, STALL);
	
	-- Constrol unit signals
	signal mem_write_enable : STD_LOGIC := '0';
	signal pc_latch : STD_LOGIC := '0';
	
	-- Program counter registers
	signal PC : std_logic_vector(31 downto 0)     := (others => '0');
	signal PC_ADD : std_logic_vector(31 downto 0);
	
	signal state : const_state := FETCH;
	signal next_state : const_state; 

begin

	-- State machine control process
	control_unit_state_machine_control: process(clk, processor_enable, state, next_state, reset)
	begin
		if rising_edge(clk) and processor_enable = '1' then
			if reset = '1' then
				state <= STALL;
			else 
				state <= next_state;
			end if;
		end if;
	end process;
	
	-- Actual state machine
	control_unit_state_machine: process(state)
	begin
		case state is
			when FETCH =>
				mem_write_enable <= '0';
				pc_latch <= '0';
				next_state <= EXECUTE;
				
			when EXECUTE =>
				mem_write_enable <= '1';
				next_state <= STALL;
				
			when STALL => 
				next_state <= FETCH;
				pc_latch <= '1';
				
			when others =>
				next_state <= FETCH;
		end case;
	end process;
	
	-- PC incrementer
	pc_add_four: adder 
		generic map (
			N => 32
		)
		port map (
			x   => PC,
			Y   => X"00000004",
			cin => '0',
			r   => PC_ADD
		);
	
	-- Latch the value of the correct PC_* register to PC on rising edge of the pc_latch
	-- signal
	next_pc_latch : process (PC_ADD, pc_latch) 
	begin
		if rising_edge(pc_latch) then
			PC <= PC_ADD;
		end if;
	end process;

	-- Drive processor outputs only when the processor itself is enabled.
	-- As the signals are muxed in toplevel this is strictly not needed by it 
	-- is done for good measure.
	drive_output_signals: process(processor_enable)
	begin
		if processor_enable = '1' then
			imem_address <= (others => '0');
			dmem_address <= (others => '0');
			dmem_address_wr <= (others => '0');
			dmem_data_out <= PC;
			dmem_write_enable <= mem_write_enable;
		end if;
	end process;

end Behavioral;

