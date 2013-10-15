library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.mips_constant_pkg.all;
use work.pipeline_types.all;

entity stage_instruction_decode is
	generic (
		N : integer := 32);
	port (
		-- Component Control
		clk : in std_logic;
		reset : in std_logic;
		processor_enable : in std_logic;
		-- Write Back
		wb : in wb_t;
		-- Stage Input
		ifid : in ifid_t;
		-- Stage Output
		idex : out idex_t
		);
end stage_instruction_decode;

architecture Behavioral of stage_instruction_decode is

	component control_unit is
		port (
        clk        : in std_logic;
        reset      : in std_logic;
        opcode     : in std_logic_vector (5 DOWNTO 0);
        enable     : in std_logic;

				ctrl_ex    : out ctrl_ex_t;
				ctrl_m     : out ctrl_m_t;
				ctrl_wb    : out ctrl_wb_t;
		);
	end component;

	component register_file is
		clk        : in std_logic;
		reset      : in std_logic;
		rw         : in std_logic;
		rs_addr    : in std_logic_vector (RADDR_BUS-1 downto 0);
		rt_addr    : in std_logic_vector (RADDR_BUS-1 downto 0);
		rd_addr    : in std_logic_vector (RADDR_BUS-1 downto 0);
		write_data : in std_logic_vector (DDATA_BUS-1 downto 0);
		rs         : out std_logic_vector (DDATA_BUS-1 downto 0);
		rt         : out std_logic_vector (DDATA_BUS-1 downto 0)
	);
	end component;

	component sign_extend is
		port (
			a : in std_logic_vector(15 downto 0);
			r : out std_logic_vector(31 downto 0)
		);
	end component;

begin

	cu: control_unit
		port map (
			-- Component Control
			clk        => clk,
			reset      => reset,
			opcode     => ifid.instruction(31 downto 26),
			enable     => processor_enable,

			-- Control signals
			ctrl_ex    => idex.ctrl_ex,
			ctrl_m     => idex.ctrl_m,
			ctrl_wb    => idex.ctrl_wb
		);

	rf : register_file
		port map (
			-- Component Control
			clk        => clk,
			reset      => reset,

			-- Write back
			rw         => wb.reg_write,
			write_data => wb.write_data,
			rd_addr    => wb.write_addr,

			-- Read register
			rs_addr    => ifid.instruction(25 downto 21),
			rt_addr    => ifid.instruction(20 downto 16),
			rs         => idex.reg1,
			rt         => idex.reg2
		);

	se : sign_extend
		port map(
			a => ifid.instruction(15 downto 0),
			r => idex.sign_extended
		);

	-- I-Type instructions writes to register in rt (20-16) part of instruction
	idex.write_reg_addr_i_type => ifid.instruction(20 downto 16);
	-- R-Type instructions writes to register in rd (15-11) part of instruction
	idex.write_reg_addr_r_type => ifid.instruction(15 downto 11);

end Behavioral;
