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
begin

	-- Drive processor outputs only when the processor itself is enabled.
	-- As the signals are muxed in toplevel this is strictly not needed by it 
	-- is done for good measure.
	drive_output_signals: process(processor_enable)
	begin
		if processor_enable = '1' then
			imem_address    <= (others => '0');
			dmem_address    <= (others => '0');
			dmem_address_wr <= (others => '0');
			dmem_data_out   <= X"00001100";
			
		end if;
	end process;

end Behavioral;

