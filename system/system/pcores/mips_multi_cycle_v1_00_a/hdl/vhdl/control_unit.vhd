
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.mips_constant_pkg.all;

entity control_unit is
    port ( 
         clk        : in std_logic;
         reset      : in std_logic; 
         opcode     : in std_logic_vector (5 DOWNTO 0);
         enable     : in std_logic;
         reg_dst    : out std_logic;
         branch     : out std_logic;
         mem_read   : out std_logic;
         mem_to_reg : out std_logic;
         alu_op     : out ALU_OP;
         mem_write  : out std_logic;
         alu_src    : out std_logic;
         reg_write  : out std_logic;
         jump       : out std_logic;
         pc_latch   : out std_logic := '0'
     );
end control_unit;

architecture Behavioral of control_unit is

    -- Control unit states
    type const_state is (STATE_FETCH, STATE_EXECUTE, STATE_STALL, STATE_RESET);
    signal state : const_state := STATE_RESET;
    signal next_state : const_state; 
    
    -- opcodes
    constant op_alu : std_logic_vector (5 downto 0) := "000000";
    constant op_lw  : std_logic_vector (5 downto 0) := "100011";
    constant op_sw  : std_logic_vector (5 downto 0) := "101011";
    constant op_lui : std_logic_vector (5 downto 0) := "001111";
    constant op_beq : std_logic_vector (5 downto 0) := "000100";
    constant op_j   : std_logic_vector (5 downto 0) := "000010";
begin

    -- State machine control process
    control_unit_state_machine_control: process(clk, enable, reset)
    begin
        if rising_edge(clk) and enable = '1' then
            if reset = '1' then
                state <= STATE_RESET;
            else 			
					 if next_state = STATE_FETCH and state /= STATE_RESET then
					    pc_latch <= '1';
						 state <= next_state;
					 else 
						pc_latch <= '0';
						 state <= next_state;
					 end if;
            end if;
        end if;
    end process;
    
    -- Actual state machine
    control_unit_state_machine: process(state, opcode)
    begin
        case state is
            when STATE_FETCH =>-- assert (false) report "state_fetch" severity note;
                mem_write <= '0';
                reg_write <= '0';
                --pc_latch <= '0';
                
                next_state <= STATE_EXECUTE;
                
            when STATE_EXECUTE =>
                case opcode is
                    when op_alu =>
							   -- assert (false) report "op_alu" severity note;
                        reg_dst <= '1';
                        branch <= '0';
                        mem_read <= '0';
                        mem_to_reg <= '0';
                        alu_op <= ALUOP_FUNC;
                        mem_write <= '0';
                        alu_src <= '0';
                        reg_write <= '1';
                        jump <= '0';
                        
                        --pc_latch <= '1';
                        next_state <= STATE_FETCH;
                    
                    when op_lw =>
						  -- assert (false) report "op_lw" severity note;
                        reg_dst <= '0';
                        branch <= '0';
                        mem_read <= '1';
                        mem_to_reg <= '1';
                        alu_op <= ALUOP_LOAD_STORE;
                        mem_write <= '0';
                        alu_src <= '1';
                        reg_write <= '1';
                        jump <= '0';
                        
                        next_state <= STATE_STALL;
                    
                    when op_sw =>
						  -- assert (false) report "op_sw" severity note;
                        reg_dst <= '0';
                        branch <= '0';
                        mem_read <= '0';
                        mem_to_reg <= '0';
                        alu_op <= ALUOP_LOAD_STORE;
                        mem_write <= '1';
                        alu_src <= '1';
                        reg_write <= '0';
                        jump <= '0';
                        
                        next_state <= STATE_STALL;
                        
                    when op_lui =>
						  -- assert (false) report "op_lui" severity note;
                        reg_dst <= '0';
                        branch <= '0';
                        mem_read <= '0';
                        mem_to_reg <= '0';
                        alu_op <= ALUOP_LDI;
                        mem_write <= '0';
                        alu_src <= '1';
                        reg_write <= '1';
                        jump <= '0';
                        
                        --pc_latch <= '1';                        
                        next_state <= STATE_FETCH;
                        
                    when op_beq =>
						  -- assert (false) report "op_beq" severity note;
                        reg_dst <= '1';
                        branch <= '1';
                        mem_read <= '0';
                        mem_to_reg <= '0';
                        alu_op <= ALUOP_BRANCH;
                        mem_write <= '0';
                        alu_src <= '0';
                        reg_write <= '0';
                        jump <= '0';
                        
                        --pc_latch <= '1';
                        next_state <= STATE_FETCH;
                        
                    when op_j =>
						  -- assert (false) report "op_jump" severity note;
                        reg_dst <= '1';
                        branch <= '0';
                        mem_read <= '0';
                        mem_to_reg <= '0';
                        alu_op <= ALUOP_BRANCH;
                        mem_write <= '0';
                        alu_src <= '0';
                        reg_write <= '0';
                        jump <= '1';
                        
                        --pc_latch <= '1';
                        next_state <= STATE_FETCH;
                    
                    when others =>
						  -- assert (false) report "op_others" severity note;
                        reg_dst <= '0';
                        branch <= '0';
                        mem_read <= '0';
                        mem_to_reg <= '0';
                        alu_op <= ALUOP_BRANCH;
                        mem_write <= '0';
                        alu_src <= '0';
                        reg_write <= '0';
                        jump <= '0';
                        
                        --pc_latch <= '1';
                        next_state <= STATE_FETCH;                                
                end case;
                
            when STATE_STALL => -- assert (false) report "state_stall" severity note;
                --pc_latch <= '1';
                next_state <= STATE_FETCH;

            -- Initial state, and state after reset has been toggled, do no harm and enter FETCH
            when STATE_RESET =>                
                mem_write <= '0';
                reg_write <= '0';
                --pc_latch <= '0';
                next_state <= STATE_FETCH;
                
        end case;
    end process;

end Behavioral;
