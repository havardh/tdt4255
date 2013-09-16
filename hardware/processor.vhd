----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:25:34 09/16/2013 
-- Design Name: 
-- Module Name:    processor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work;
use work.mips_constant_pkg.all;

entity processor is
	
	generic  (
		MEM_ADDR_BUS	: integer	:= 32;
		MEM_DATA_BUS	: integer	:= 32 );

	port ( 
		clk               : in STD_LOGIC;
		reset					: in STD_LOGIC;
		processor_enable	: in  STD_LOGIC;
		imem_address 		: out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
		imem_data_in 		: in  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
		dmem_data_in 		: in  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
		dmem_address 		: out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
		dmem_address_wr	: out  STD_LOGIC_VECTOR (MEM_ADDR_BUS-1 downto 0);
		dmem_data_out		: out  STD_LOGIC_VECTOR (MEM_DATA_BUS-1 downto 0);
		dmem_write_enable	: out  STD_LOGIC
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
			reg_write  : out std_logic
		);
	end component;
	
	component alu_control is
		port (
			func: in std_logic_vector(5 downto 0);
			ALU_OP : in ALU_OP;
			ALU_INPUT : out ALU_INPUT
		);
	end component;

	component alu is
		generic (N : natural := 32);
		port (
			X			: in STD_LOGIC_VECTOR(N-1 downto 0);
			Y			: in STD_LOGIC_VECTOR(N-1 downto 0);
			ALU_IN	: in ALU_INPUT;
			R			: out STD_LOGIC_VECTOR(N-1 downto 0);
			FLAGS		: out ALU_FLAGS
		);
	end component;
		
	component register_file is
		port (
			CLK 			:	in	STD_LOGIC;				
			RESET			:	in	STD_LOGIC;				
			RW				:	in	STD_LOGIC;				
			RS_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RT_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0); 
			RD_ADDR 		:	in	STD_LOGIC_VECTOR (RADDR_BUS-1 downto 0);
			WRITE_DATA	:	in	STD_LOGIC_VECTOR (DDATA_BUS-1 downto 0); 
			RS				:	out STD_LOGIC_VECTOR (DDATA_BUS-1 downto 0);
			RT				:	out STD_LOGIC_VECTOR (DDATA_BUS-1 downto 0)
		);
	end component;
	
	component sign_extend is
		port (
			A : in std_logic_vector(15 downto 0);
			R : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component mux is
		generic ( N: natural := 32);
		port (
			S : in std_logic;
			A : in std_logic_vector(N-1 downto 0);
			B : in std_logic_vector(N-1 downto 0);
			R : out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	component adder is 
		generic (N: natural := 32);
		port (
			X	   : in	STD_LOGIC_VECTOR(N-1 downto 0);
			Y	   : in	STD_LOGIC_VECTOR(N-1 downto 0);
			CIN	: in	STD_LOGIC;
			COUT	: out	STD_LOGIC;
			R	   : out	STD_LOGIC_VECTOR(N-1 downto 0)
		);
	end component;
	
	component shiftleft is
		port(
			A : in std_logic_vector (31 downto 0);
			R : out std_logic_vector (31 downto 0)
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
	signal PC      : std_logic_vector (31 downto 0);
	signal PC_INC  : std_logic_vector (31 downto 0);
	signal PC_JUMP : std_logic_vector (31 downto 0);
	signal PC_NEXT : std_logic_vector (31 downto 0);
	signal PC_INC2 : std_logic_vector (31 downto 0);
	
	signal sign_extended : std_logic_vector (31 downto 0);
	signal shifted       : std_logic_vector (31 downto 0);
	signal jump          : std_logic;

begin

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
		reg_write  => reg_write
	);
	
	reg_file : register_file port map (
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
	
	alu1 : alu port map (
		X      => rs,
		Y      => alu_in_mux,
		ALU_IN => alu_input,
		R      => alu_out,
		FLAGS  => flags
	);
	
	alu_control1 : alu_control port map (
		func      => imem_data_in(5 downto 0),
		ALU_OP    => alu_op,
		ALU_INPUT => alu_input
	);
	
	sign_extend1 : sign_extend port map (
		A => imem_data_in(15 downto 0),
		R => sign_extended
	);
	
	add4 : adder 
		generic map(N => 32)
		port map (
		X   => PC,
		Y   => "00000000000000000000000000000100",
		CIN => '0',
		R   => PC_INC
	);
	
	add_jump : adder 
		generic map (N => 32)
		port map (
			X   => PC_INC2,
			Y   => shifted,
			CIN => '0',
			R   => PC_JUMP
	);
	
	shiftleft2 : shiftleft
		port map(
			A => sign_extended,
			R => shifted
	);
	
	write_reg_mux : mux 
		generic map(N => 5)
		port map (
			S => reg_dst,
			A => imem_data_in(20 downto 16),
			B => imem_data_in(15 downto 11),
			R => reg_write_mux_out
	);
		
	alu_in_mux1 : mux
		generic map(N => 32)
		port map (
			S => alu_src,
			A => rt,
			B => sign_extended,
			R => alu_in_mux
	);
		
	reg_write_in_mux : mux
		generic map(N => 32)
		port map (
			S => mem_read,
			A => alu_out,
			B => dmem_data_in,
			R => data_write_mux_out
	);
		
	pc_mux : mux 
		generic map (N => 32)
		port map (
			S => jump,
			A => PC_JUMP,
			B => PC_INC,
			R => PC_NEXT
	);
	
	
	dmem_write_enable <= mem_write;
	jump              <= flags.zero and branch;
	imem_address      <= PC;
	PC_INC2           <= PC_INC;
	dmem_address      <= alu_out; 
	dmem_data_out     <= rt;
		
	process(clk, internal_clk, PC_NEXT, processor_enable)
	begin
		
		if processor_enable = '1' then
			internal_clk <= clk;
		else 
			internal_clk <= '0';
		end if;
		
		if rising_edge(internal_clk) then
			PC <= PC_NEXT;
		end if;
	end process;

end Behavioral;

