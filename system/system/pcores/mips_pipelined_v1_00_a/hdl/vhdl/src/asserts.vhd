--
-- Asserts is a package providing utility functions that eases the testing process
--

library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

use work.mips_constant_pkg.all;
use work.pipeline_types.all;

package asserts is
    procedure assertEqual(actual : std_logic_vector; expected : std_logic_vector);
    
    procedure assertEqual(actual : ifid_t; expected : ifid_t);
    procedure assertEqual(actual : idex_t; expected : idex_t);
    procedure assertEqual(actual : exmem_t; expected : exmem_t);
    procedure assertEqual(actual : memwb_t; expected : memwb_t);
    
    procedure assertEqual(actual : ctrl_ex_t; expected : ctrl_ex_t);
    procedure assertEqual(actual : ctrl_m_t; expected : ctrl_m_t);
    procedure assertEqual(actual : ctrl_wb_t; expected : ctrl_wb_t);
    
    procedure assertEqual(actual : alu_op; expected : alu_op);
    procedure assertEqual(actual : alu_flags; expected : alu_flags);
end asserts;

package body asserts is

    -- Print a report of actual and expected, and return a string that the assert itself will print
    impure function printReport(actual : std_logic_vector; expected : std_logic_vector; message : string) return string 
    is
        variable outline : line;
    begin
        write(outline, message);
        write(outline, string'(" - expected "));
        
        for i in actual'left downto actual'right loop
            write(outline, actual(i));
        end loop;

        write(outline, string'(" to be equal to "));

        -- not sure why, but we need to loop the constant interface backwards. (its just vhdl I guess)
        for y in expected'right downto 0 loop
            write(outline, expected(expected'right-y));
        end loop;
        writeline(output, outline);
        return string'("failure");
    end printReport;

    -- Assert that two std logic vectors are equal
    procedure assertEqual(actual : std_logic_vector; expected : std_logic_vector) is
    begin
        assert ( actual =  expected ) report printReport(actual, expected, "") severity warning;
    end assertEqual;
    
    -- Assert that two std logic signals are equal
    procedure assertEqual(actual : std_logic; expected : std_logic; message : string) is
        variable actual_v : std_logic_vector(0 downto 0);
        variable expected_v : std_logic_vector(0 downto 0);
    begin
        actual_v(0) := actual;
        expected_v(0) := expected;
        assert ( actual =  expected ) report printReport(actual_v, expected_v, message) severity warning;
    end assertEqual;
    
    -- Assert equal with a custom message
    procedure assertEqual(actual : std_logic_vector; expected : std_logic_vector; message : string) is
    begin
        assert ( actual =  expected ) report printReport(actual, expected, message) severity warning;
    end assertEqual;
    
    -- Assert that two IFID records are equal
    procedure assertEqual(actual : ifid_t; expected : ifid_t) is
    begin
        assertEqual(actual.instruction, expected.instruction, string'("ifid.instruction"));
        assertEqual(actual.pc_incremented, expected.pc_incremented, string'("ifid.pc_incremented"));
    end procedure;
    
    -- Assert that two alu_op types are equal
    procedure assertEqual(actual : alu_op; expected : alu_op) is
    begin
        -- TODO Actually print the value of actual and expected here
        assert ( actual =  expected ) report "Actual value of ALU_OP is as expected" severity warning;
    end procedure;
    
    -- Assert that two IDEX records are equal
    procedure assertEqual(actual : idex_t; expected : idex_t) is
    begin
        assertEqual(actual.ctrl_wb, expected.ctrl_wb);
        assertEqual(actual.ctrl_m, expected.ctrl_m);
        assertEqual(actual.ctrl_ex, expected.ctrl_ex);
        
        assertEqual(actual.branch_target, expected.branch_target, string'("idex.branch_target"));
        assertEqual(actual.jump_target, expected.jump_target, string'("idex.jump_target"));
        assertEqual(actual.reg1, expected.reg1, string'("idex.reg1"));
        assertEqual(actual.reg2, expected.reg2, string'("idex.reg2"));
        assertEqual(actual.sign_extended, expected.sign_extended, string'("idex.sign_extended"));
        assertEqual(actual.write_reg_addr_i_type, expected.write_reg_addr_i_type, string'("idex.write_reg_addr_i_type"));
        assertEqual(actual.write_reg_addr_r_type, expected.write_reg_addr_r_type, string'("idex.write_reg_addr_r_type"));
    end procedure;
    
    -- Assert that two IDEX records are equal
    procedure assertEqual(actual : exmem_t; expected : exmem_t) is
    begin
        assertEqual(actual.ctrl_wb, expected.ctrl_wb);
        assertEqual(actual.ctrl_m, expected.ctrl_m);
        
        assertEqual(actual.flags, expected.flags);
        
        assertEqual(actual.branch_target, expected.branch_target, string'("exmem.branch_target"));
        assertEqual(actual.jump_target, expected.jump_target, string'("exmem.jump_target"));
        assertEqual(actual.alu_result, expected.alu_result, string'("exmem.alu_result"));
        assertEqual(actual.write_mem_data, expected.write_mem_data, string'("exmem.write_mem_data"));
        assertEqual(actual.write_reg_addr, expected.write_reg_addr, string'("exmem.write_reg_addr"));
    end procedure;
    
    -- Assert that two MEMWB records are equal
    procedure assertEqual(actual : memwb_t; expected : memwb_t) is
    begin
        assertEqual(actual.ctrl_wb, expected.ctrl_wb);
        
        assertEqual(actual.mem_data, expected.mem_data, string'("memwb.mem_data"));
        assertEqual(actual.alu_data, expected.alu_data, string'("memwb.alu_data"));
        assertEqual(actual.write_reg_addr, expected.write_reg_addr, string'("memwb.write_reg_addr"));
    end procedure;
    
    -- Assert that two ctrl_ex records are equal
    procedure assertEqual(actual : ctrl_ex_t; expected : ctrl_ex_t) is
    begin
        assertEqual(actual.alu_src, expected.alu_src, string'("ctrl_ex.alu_src"));
        assertEqual(actual.reg_dst, expected.reg_dst, string'("ctrl_ex.reg_dst"));
        assertEqual(actual.alu_op, expected.alu_op);            
    end procedure;
    
    -- Assert that two ctrl_m records are equal
    procedure assertEqual(actual : ctrl_m_t; expected : ctrl_m_t) is
    begin
        assertEqual(actual.jump, expected.jump, string'("ctrl_m.jump"));
        assertEqual(actual.branch, expected.branch, string'("ctrl_m.branch"));
        assertEqual(actual.mem_write, expected.mem_write, string'("ctrl_m.mem_write"));            
    end procedure;
    
    -- Assert that two ctrl_wb records are equal
    procedure assertEqual(actual : ctrl_wb_t; expected : ctrl_wb_t) is
    begin
        assertEqual(actual.mem_to_reg, expected.mem_to_reg, string'("ctrl_wb.mem_to_reg"));
        assertEqual(actual.reg_write, expected.reg_write, string'("ctrl_wb.reg_write"));
    end procedure;
    
    -- Assert that two alu_flags records are equal
    procedure assertEqual(actual : alu_flags; expected : alu_flags) is
    begin
        assertEqual(actual.carry, expected.carry, string'("alu_flags.carry"));
        assertEqual(actual.overflow, expected.overflow, string'("alu_flags.overflow"));
        assertEqual(actual.zero, expected.zero, string'("alu_flags.zero"));
        assertEqual(actual.negative, expected.negative, string'("alu_flags.negative"));
    end procedure;

end ASSERTS;
