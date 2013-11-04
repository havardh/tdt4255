
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;

use work.mips_constant_pkg.all;
use work.pipeline_types.all;

-- Processor interface, as defined by the provided toplevel implementation
entity processor is    
    generic  (
        MEM_ADDR_BUS    : integer    := 32;
        MEM_DATA_BUS    : integer    := 32 );
    port ( 
        clk               : in std_logic;
        reset             : in std_logic;
        processor_enable  : in std_logic;
        imem_address      : out std_logic_vector (MEM_ADDR_BUS-1 downto 0);
        imem_data_in      : in std_logic_vector (MEM_DATA_BUS-1 downto 0);
        dmem_data_in      : in std_logic_vector (MEM_DATA_BUS-1 downto 0);
        dmem_address      : out std_logic_vector (MEM_ADDR_BUS-1 downto 0);
        dmem_address_wr   : out std_logic_vector (MEM_ADDR_BUS-1 downto 0);
        dmem_data_out     : out std_logic_vector (MEM_DATA_BUS-1 downto 0);
        dmem_write_enable : out std_logic;
		  
		  imem_address_out  : in std_logic_vector (MEM_ADDR_BUS-1 downto 0)
    );
end processor;

architecture Behaviour of processor is

	-- Forwarding unit
	component forwarding_unit is
		port (
			id_ex_register_rs  : in std_logic_vector (4 downto 0);
			id_ex_register_rt  : in std_logic_vector (4 downto 0);
			ex_mem_register_rd : in std_logic_vector (4 downto 0);
			mem_wb_register_rd : in std_logic_vector (4 downto 0);
			ex_mem_reg_write   : in std_logic;
			mem_wb_reg_write   : in std_logic;
			forwarding_a       : out std_logic_vector (1 downto 0);
			forwarding_b       : out std_logic_vector (1 downto 0);
			
			wb_register_rd     : in std_logic_vector(4 downto 0);
			if_id_register_rs  : in std_logic_vector(4 downto 0);
			if_id_register_rt  : in std_logic_vector(4 downto 0);  
			forwarding_C       : out std_logic;
			forwarding_D       : out std_logic
		);
	end component;

    -- Pipeline stages
    component stage_pc_next is
        port (
            clk            : in std_logic;
            reset          : in std_logic;
            pc_opt         : in pc_next_t;
            enable         : in std_logic;

            stall          : in std_logic;
				pc             : in std_logic_vector(N-1 downto 0);
				pc_next        : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
    component stage_ex is
        port (
            input        : in idex_t;
		
			forwarding_a : in std_logic_vector(1 downto 0);
			forwarding_b : in std_logic_vector(1 downto 0);
			ex_mem_rd    : in std_logic_vector(N-1 downto 0);
			mem_wb_rd    : in std_logic_vector(N-1 downto 0);
		
		   flush : out std_logic;
		   pc_corrected : out std_logic_vector(N-1 downto 0);
		
            output       : out exmem_t
        );
    end component;
    
    component stage_id is
    port (
        clk        : in std_logic;
        reset      : in std_logic;
		  stall      : in std_logic;
		  flush      : in std_logic;
		  predict_taken : in std_logic;
        wb         : in wb_t;
        ifid       : in ifid_t;
        idex       : out idex_t;
        
		-- Forwarding signals
		forwarding_c : in std_logic;
		forwarding_d : in std_logic
    );
    end component;
    
    component stage_wb is
    port (
				input  : in memwb_t;
        output : out wb_t
    );
    end component;
    
    -- Pipeline registers
    component register_ifid is
    port(
        input  : in ifid_t;
        clk    : in std_logic;
        reset  : in std_logic;
        stall : in std_logic;
		  enable : in std_logic;
        output : out ifid_t        
    );
    end component;

    component register_idex is
    port(
        input: in idex_t;
        clk  : in std_logic;
        reset  : in std_logic;
        output: out idex_t        
    );
    end component;

    component register_exmem is
        port(
            input: in exmem_t;
            clk  : in std_logic;
            reset  : in std_logic;        
            output: out exmem_t        
        );
    end component;
    
    component register_memwb is
    port(
        input: in memwb_t;
        clk  : in std_logic;
        reset  : in std_logic;
        output: out memwb_t        
    );
    end component;

	 component hazard_detection_unit is
	 port(
		  idex_rt : in std_logic_vector(4 downto 0);
		  idex_mem_read : in std_logic;
		  idex_jump : in std_logic;
		  idex_branch : in std_logic;
		  idex_predict_taken : in std_logic;
		  ifid_rt : in std_logic_vector(4 downto 0);
		  ifid_rs : in std_logic_vector(4 downto 0);
		  stall : out std_logic;
		  flush : out std_logic
	);
	end component;
		
   component branch_prediction_unit is 
	port(
		 predict_addr : in std_logic_vector(2 downto 0);
		 prediction   : out std_logic;
		 correct_addr   : in std_logic_vector(2 downto 0);
		 correct_taken  : in std_logic;
		 correct_enable : in std_logic;
		 clk            : in std_logic
	);
	end component;


    signal enable : std_logic;
    -- Pipeline register signals
    signal ifid_in, ifid_out : ifid_t;
    signal idex_in, idex_out : idex_t;
    signal exmem_in, exmem_out : exmem_t;
    signal memwb_in, memwb_out : memwb_t;

	 signal flush : std_logic;

		-- Stall signal from hazard unit to id stage
		signal stall : std_logic;
		signal hazard_flush : std_logic;
		
    -- Out singals from wb stage to reg file
    signal wb_out : wb_t;
    
    -- Program counters    
    signal pc_next_in : pc_next_t;
    
    -- Forwarding singals
    signal forwarding_a, forwarding_b : std_logic_vector(1 downto 0);
    signal mem_wb_rd : std_logic_vector(N-1 downto 0);
	 
	 -- Eager jump
	 signal pc_src : std_logic;
	 signal pc_next : std_logic_vector(N-1 downto 0) := X"00000000";
	 	  
    signal forwarding_c, forwarding_d : std_logic;
	 
	 -- Branch prediction
	 signal predict_taken : std_logic;
	 
	 -- Branch correction
	 signal correction_flush : std_logic;
	 signal pc_corrected : std_logic_vector(N-1 downto 0);
    
begin
    ifid_reg : register_ifid port map(input => ifid_in, clk => clk, reset => reset, stall => stall, enable => processor_enable, output => ifid_out);
    idex_reg : register_idex port map(input => idex_in, clk => clk, reset => reset, output => idex_out);
    exmem_reg : register_exmem port map(input => exmem_in, clk => clk, reset => reset, output => exmem_out);
    memwb_reg : register_memwb port map(input => memwb_in, clk => clk, reset => reset, output => memwb_out);
    
    pc_next_stage : stage_pc_next port map(
        clk => clk, 
        reset => reset, 
        pc_opt => pc_next_in,
        enable => enable,
		  stall => stall,
		  
		  pc => imem_address_out,
		  pc_next => pc_next
    );
    
    ex_stage : stage_ex port map(
    	input => idex_out, 
    	output => exmem_in,
    	
    	forwarding_a => forwarding_a,
    	forwarding_b => forwarding_b,
    	ex_mem_rd => exmem_out.alu_result,
    	-- wb_out holds memwb_out data after the mux
    	mem_wb_rd => wb_out.write_data ,
		
		flush => correction_flush ,
		pc_corrected => pc_corrected
		
    );
	 
    id_stage : stage_id port map(
        clk => clk,
        reset => reset,
		  stall => stall,
		  flush => flush,
		  predict_taken => predict_taken,
        ifid => ifid_out,
        idex => idex_in,
        
        -- Write back signals from the write back stage
        wb => wb_out,
        
		-- Forwarding signals
		forwarding_c => forwarding_c,
		forwarding_d => forwarding_d        
    );

		wb_stage: stage_wb port map(input => memwb_out,	output => wb_out);

		hdu : hazard_detection_unit port map(
				idex_rt       => idex_out.read_reg_rt_addr,
				idex_mem_read => idex_out.ctrl_m.mem_read,
				idex_jump     => idex_out.ctrl_m.jump,
				idex_branch    => idex_out.ctrl_m.branch,
				idex_predict_taken => idex_out.predict_taken,
				ifid_rt       => ifid_out.instruction(20 downto 16),
				ifid_rs       => ifid_out.instruction(25 downto 21),
				stall    => stall,
				flush    => hazard_flush
		);
		
		
		bpu : branch_prediction_unit port map(
		 predict_addr   => ifid_in.pc_current(2 downto 0), -- TODO Constants
		 prediction     => predict_taken,
		 correct_addr   => idex_in.pc_current(2 downto 0),
		 correct_taken  => idex_in.equals,
		 correct_enable => idex_in.ctrl_m.branch,
		 clk            => clk
	);		
    
    -- IF Stage
    imem_address <= pc_next;
    ifid_in.instruction <= imem_data_in when correction_flush = '0' else X"00000000";
	 ifid_in.pc_current <= imem_address_out;
    ifid_in.pc_incremented <= pc_next; 
	 
	 -- ID Stage
	 --idex_in.predict_taken <= predict_taken;
    
    -- MEM stage
    dmem_address <= exmem_out.alu_result;
    dmem_address_wr <= exmem_out.alu_result;
    dmem_data_out <= exmem_out.write_mem_data;
    dmem_write_enable <= exmem_out.ctrl_m.mem_write;
    memwb_in.mem_data <= dmem_data_in;
    memwb_in.alu_data <= exmem_out.alu_result;
    memwb_in.ctrl_wb <= exmem_out.ctrl_wb;
    memwb_in.write_reg_addr <= exmem_out.write_reg_addr;
	 
	 -- DEBUG
	 --idex_in.instruction <= ifid_out.instruction;
	 --exmem_in.instruction <= idex_out.instruction;
	 --memwb_in.instruction <= exmem_out.instruction;
	 -- /DEBUG
    
    -- PC next mux, TODO extract out of processor(?)
    pc_next_in_mux : process(idex_in, exmem_out)
    begin
		  if correction_flush = '1' then
		      pc_next_in.jump <= pc_corrected;
				pc_next_in.src  <= '1';
		  elsif idex_in.ctrl_m.jump = '1' then -- TODO: and prev ins == branch and taken
				pc_next_in.jump <= idex_in.jump_target;
            pc_next_in.src <= '1';
        elsif idex_in.ctrl_m.branch = '1' and predict_taken = '1' then
            pc_next_in.jump <= idex_in.branch_target;
            pc_next_in.src <= '1';
        else
            pc_next_in.jump <= (others => '0');
            pc_next_in.src <= '0';
        end if;
    end process;

	enable <= processor_enable;	
	
	-- Forwarding unit
	forward : forwarding_unit
		port map(
			id_ex_register_rs => idex_out.read_reg_rs_addr,
			id_ex_register_rt => idex_out.read_reg_rt_addr,
			ex_mem_register_rd => exmem_out.write_reg_addr,
			mem_wb_register_rd => memwb_out.write_reg_addr,
			ex_mem_reg_write => exmem_out.ctrl_wb.reg_write,
			mem_wb_reg_write => memwb_out.ctrl_Wb.reg_write,
			forwarding_a => forwarding_a,
			forwarding_b => forwarding_b,
			
			wb_register_rd => memwb_out.write_reg_addr,
			if_id_register_rs => ifid_out.instruction(25 downto 21),	
			if_id_register_rt => ifid_out.instruction(20 downto 16),
			forwarding_c => forwarding_c,
			forwarding_d => forwarding_d
		);
        
		  
	  flush <= hazard_flush or correction_flush;
    
end architecture;
