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
		clk               : in std_logic;
		reset					: in std_logic;
		processor_enable	: in  std_logic;
		imem_address 		: out  std_logic_vector (MEM_ADDR_BUS-1 downto 0);
		imem_data_in 		: in  std_logic_vector (MEM_DATA_BUS-1 downto 0);
		dmem_data_in 		: in  std_logic_vector (MEM_DATA_BUS-1 downto 0);
		dmem_address 		: out  std_logic_vector (MEM_ADDR_BUS-1 downto 0);
		dmem_address_wr	: out  std_logic_vector (MEM_ADDR_BUS-1 downto 0);
		dmem_data_out		: out  std_logic_vector (MEM_DATA_BUS-1 downto 0);
		dmem_write_enable	: out  std_logic
	);
end processor;

architecture Behavioral of processor is
	component control_unit is
		port (
			clk        : in std_logic;
			reset      : in std_logic;
			inst       : in std_logic_vector (5 downto 0);
			reg_dst    : out std_logic;
			branch     : out std_logic;
			mem_read   : out std_logic;
			mem_to_reg : out std_logic;
			alu_op     : out ALU_OP;
			mem_write  : out std_logic;
			alu_src    : out std_logic;
			reg_write  : out std_logic;
			pc_latch   : out std_logic;
			jump       : out std_logic
		);
	end component;
	
	component alu_control is
		port (
			func      : in std_logic_vector(5 downto 0);
			alu_op    : in ALU_OP;
			alu_input : out ALU_INPUT
		);
	end component;

	component alu is
		generic (N : natural := 32);
		port (
			x       : in std_logic_vector(N-1 downto 0);
			y       : in std_logic_vector(N-1 downto 0);
			alu_in  : in ALU_INPUT;
			r       : out std_logic_vector(N-1 downto 0);
			flags   : out ALU_FLAGS
		);
	end component;
		
	component register_file is
		port (
			clk        : in std_logic;				
			reset      : in std_logic;				
			rw	       : in std_logic;				
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

	component adder is 
		generic (N: natural := 32);
		port (
			x    : in std_logic_vector(N-1 downto 0);
			y    : in std_logic_vector(N-1 downto 0);
			cin	 : in std_logic;
			cout : out std_logic;
			r    : out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	component shiftleft is
		port(
			a : in std_logic_vector (31 downto 0);
			r : out std_logic_vector (31 downto 0)
		);
	end component;
	
	signal internal_clk : std_logic;
	
	-- Signals from control unit
	signal reg_dst    : std_logic;
	signal branch     : std_logic;
	signal mem_read   : std_logic;
	signal mem_to_reg : std_logic;
	signal mem_write  : std_logic;
	signal alu_src    : std_logic;
	signal reg_write  : std_logic;
	signal pc_latch   : std_logic;
		
	-- Mux register input
	signal reg_write_mux_out  : std_logic_vector (4 downto 0);
	signal data_write_mux_out : std_logic_vector (31 downto 0);	
	signal alu_in_mux : std_logic_vector (31 downto 0);
	
	-- Register output
	signal rs : std_logic_vector (31 downto 0);
	signal rt : std_logic_vector (31 downto 0);
	
	-- ALU control
	signal alu_op    : ALU_OP;
	signal alu_input : ALU_INPUT;
	
	-- ALU output
	signal alu_out : std_logic_vector (31 downto 0);
	signal flags   : ALU_FLAGS;

	-- Program Counter signals
	signal PC        : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
	signal PC_INC    : std_logic_vector (31 downto 0); -- PC + 4
	signal PC_JUMP   : std_logic_vector (31 downto 0); -- Jump target
	signal PC_BRANCH : std_logic_vector (31 downto 0); -- Branch target
	signal PC_NEXT   : std_logic_vector (31 downto 0); -- Next PC value
	
	signal sign_extended : std_logic_vector (31 downto 0);
	signal shifted       : std_logic_vector (31 downto 0);
	signal shifted_instr : std_logic_vector (31 downto 0);
	signal jump          : std_logic;

begin
	-- Control unit
	control : control_unit port map(
		clk        => internal_clk,
		reset      => reset,
		inst       => imem_data_in(31 downto 26),
		reg_dst    => reg_dst,
		branch     => branch,
		mem_read   => mem_read,
		mem_to_reg => mem_to_reg,
		alu_op     => alu_op,
		mem_write  => mem_write,
		alu_src    => alu_src,
		reg_write  => reg_write,
		pc_latch   => pc_latch,
		jump       => jump
	);

	-- Clock enable, while processor_enable is 1 internal_clk mirrors clk
    -- When processor_enable is 0 internal_clk is 0 aswell
	clk_enable: process (clk, processor_enable)
	begin
		if processor_enable = '1' then
			internal_clk <= clk;
		else
			internal_clk <= '0';
		end if;
	end process;

	-- PC signal is always hooked to the instruction memory address
	imem_address <= PC;

	-- Constant added that takes PC as it's X input and the contant 4 as Y.
    -- Result is placed in PC_INC which is the next PC given no branch or jump
	add4: adder port map(
		x   => PC,
		y   => "00000000000000000000000000000100", -- 4
		cin => '0',
		r   => PC_INC
	);

	-- Branch adder. Adds the sign extended shifted low 16 bits of the instruction to PC_INC 
    -- in order to generate the potential branch target PC_BRANCH
	add_jump: adder port map(
		x   => PC_INC,
		y   => shifted,
		cin => '0',
		r   => PC_BRANCH
	);

	-- Create jump target
	create_pc_jump: process (shifted_instr, PC_INC)
	begin 
		-- Top 4 bits come from PC_INC
		PC_JUMP(31 downto 28) <= PC_INC(31 downto 28);
		-- Low bits are the shifted instruction
		PC_JUMP(27 downto 0) <= shifted_instr(27 downto 0);
	end process;
	
	-- PC next mux, combines the jump and branch mux	
	pc_mux: process (jump, branch, PC_JUMP, PC_BRANCH, PC_INC)
	begin
		if jump = '1' then
			PC_NEXT <= PC_JUMP;
		else
			if branch = '1' and flags.Zero = '1' then
				PC_NEXT <= PC_BRANCH;
			else 
				PC_NEXT <= PC_INC;
			end if;
		end if;
	end process;
		
    -- Program counter latch. Updates the PC register on rising internal clock.
    -- The next program counter value is located in PC_NEXT
	pc_latch1: process (pc_latch, PC_NEXT)
	begin
		if rising_edge(pc_latch) then
			PC <= PC_NEXT;
		end if;
	end process;
	
	-- Signextend the low 16 bits of the instruction
	signex: sign_extend port map(
		a => imem_data_in(15 downto 0),
		r => sign_extended
	);
	
	-- Shift the signextended low 16 bits of the instruction two bits to the left
	shift2_singex: shiftleft port map(
		a => sign_extended,
		r => shifted
	);

	-- Shift entire instruction two bits, used to calculate jump target
	shift2_instr: shiftleft port map(
		a => imem_data_in,
		r => shifted_instr
	);
	
	-- ALU Control unit
	aluctl: alu_control port map(
		func      => imem_data_in(5 downto 0),
		alu_op    => alu_op,
		alu_input => alu_input
	);

	-- ALU
	alu1: alu port map(
		x      => rs,
		y      => alu_in_mux,
		alu_in => alu_input,
		r      => alu_out,
		flags  => flags
	);
		
	-- Switch which register is set as the write register
	reg_write_mux: process(reg_dst, imem_data_in) 
	begin
		if reg_dst = '1' then
			reg_write_mux_out <= imem_data_in(15 downto 11);
		else
			reg_write_mux_out <= imem_data_in(20 downto 16);
		end if;
	end process;
	
	-- Map the register file
	regfile: register_file port map(
		clk        => internal_clk,
		reset      => reset,
		rw         => reg_write,
		rs_addr    => imem_data_in(25 downto 21),
		rt_addr    => imem_data_in(20 downto 16),
		rd_addr    => reg_write_mux_out,
		write_data => data_write_mux_out,
		rs         => rs,
		rt         => rt
	);
	
	-- Switch alu input, eiter rt or sign_extended based on alu_src
	alu_in_mux1: process(rt, sign_extended, alu_src) 
	begin
		if alu_src = '1' then
			alu_in_mux <= sign_extended;
		else 
			alu_in_mux <= rt;
		end if;
	end process;
		
	-- Link dmem inputs
	dmem_address      <= alu_out;
	dmem_address_wr   <= alu_out;
	dmem_data_out     <= rt;
	dmem_write_enable <= mem_write;
	
	-- mem_to_reg mux, selects what data is sent to the write register
	data_out_mux: process(dmem_data_in, alu_out, mem_to_reg)
	begin
		if mem_to_reg = '1' then
			data_write_mux_out <= dmem_data_in;
		else
			data_write_mux_out <= alu_out;
		end if;
	end process;

end Behavioral;

