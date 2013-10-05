
library ieee;
use ieee.std_logic_1164.all;

library work; 
use work.mips_constant_pkg.all;

entity alu_control_tb is
end alu_control_tb;
 
architecture behavior of alu_control_tb is 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component alu_control
        port (
            alu_op    : in  ALU_OP;
            func      : in  std_logic_vector(5 downto 0);
            alu_input : out  ALU_INPUT
        );
    end component;

   --Inputs and outputs
   signal alu_op    : ALU_OP;
   signal func      : std_logic_vector(5 downto 0) := (others => '0');
   signal alu_input : ALU_INPUT; 
    
 
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: alu_control PORT MAP (
        alu_op    => alu_op,
        func      => func,
        alu_input => alu_input
    );
    

    -- Stimulus process
    stim_proc: process
    begin
        -- asserting with severity note. Combinatorial logic only, so tests does not rely on previous results. 
        alu_op <=  ALUOP_FUNC;
        func <= "100000";

        -- testing add 
        wait for 1 ns;
        assert (ALU_INPUT.Op3 = '0') report "Op3 fail in and-test" severity note;
        assert (ALU_INPUT.Op2 = '0') report "Op2 fail in and-test" severity note;
        assert (ALU_INPUT.Op1 = '1') report "Op1 fail in and-test" severity note;
        assert (ALU_INPUT.Op0 = '0') report "Op0 fail in and-test" severity note;

        -- testing sub
        wait for 1 ns; 
        func <= "100010";
        wait for 1 ns;
        assert (ALU_INPUT.Op3 = '0') report "Op3 fail in sub-test" severity note;
        assert (ALU_INPUT.Op2 = '1') report "Op2 fail in sub-test" severity note;
        assert (ALU_INPUT.Op1 = '1') report "Op1 fail in sub-test" severity note;
        assert (ALU_INPUT.Op0 = '0') report "Op0 fail in sub-test" severity note;

        -- testing and 
        wait for 1 ns; 
        func <= "100100";
        wait for 1 ns;
        assert (ALU_INPUT.Op3 = '0') report "Op3 fail in and-test" severity note;
        assert (ALU_INPUT.Op2 = '0') report "Op2 fail in and-test" severity note;
        assert (ALU_INPUT.Op1 = '0') report "Op1 fail in and-test" severity note;
        assert (ALU_INPUT.Op0 = '0') report "Op0 fail in and-test" severity note;

        -- testing or
        wait for 1 ns; 
        func <= "100101";
        wait for 1 ns;
        assert (ALU_INPUT.Op3 = '0') report "Op3 fail in or-test" severity note;
        assert (ALU_INPUT.Op2 = '0') report "Op2 fail in or-test" severity note;
        assert (ALU_INPUT.Op1 = '0') report "Op1 fail in or-test" severity note;
        assert (ALU_INPUT.Op0 = '1') report "Op0 fail in or-test" severity note;

        -- testing slt        
        wait for 1 ns; 
        func <= "101010";
        wait for 1 ns;
        assert (ALU_INPUT.Op3 = '0') report "Op3 fail in slt-test" severity note;
        assert (ALU_INPUT.Op2 = '1') report "Op2 fail in slt-test" severity note;
        assert (ALU_INPUT.Op1 = '1') report "Op1 fail in slt-test" severity note;
        assert (ALU_INPUT.Op0 = '1') report "Op0 fail in slt-test" severity note;

        -- testing load/store
        wait for 1 ns;
        ALU_OP <= ALUOP_LOAD_STORE;
        wait for 1 ns;
        assert (ALU_INPUT.Op3 = '0') report "Op3 fail in load/store-test" severity note;
        assert (ALU_INPUT.Op2 = '0') report "Op2 fail in load/store-test" severity note;
        assert (ALU_INPUT.Op1 = '1') report "Op1 fail in load/store-test" severity note;
        assert (ALU_INPUT.Op0 = '0') report "Op0 fail in load/store-test" severity note;

        -- testing branch
        wait for 1 ns; 
        ALU_OP <= ALUOP_BRANCH;
        wait for 1 ns;
        assert (ALU_INPUT.Op3 = '0') report "Op3 fail in branch-test" severity note;
        assert (ALU_INPUT.Op2 = '1') report "Op2 fail in branch-test" severity note;
        assert (ALU_INPUT.Op1 = '1') report "Op1 fail in branch-test" severity note;
        assert (ALU_INPUT.Op0 = '0') report "Op0 fail in branch-test" severity note;

        -- testing LDI
        wait for 1 ns; 
        ALU_OP <= ALUOP_LDI;
        wait for 1 ns;
        assert (ALU_INPUT.Op3 = '1') report "Op3 fail in ldi-test" severity note;
        assert (ALU_INPUT.Op2 = '0') report "Op2 fail in ldi-test" severity note;
        assert (ALU_INPUT.Op1 = '0') report "Op1 fail in ldi-test" severity note;
        assert (ALU_INPUT.Op0 = '0') report "Op0 fail in ldi-test" severity note;

        wait;
    end process;
end;
