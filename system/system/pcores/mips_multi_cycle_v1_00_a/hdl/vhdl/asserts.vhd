--
-- Asserts is a package providing utility functions that eases the testing process
--

library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

package asserts is
    procedure assertEqual(actual : std_logic_vector; expected : std_logic_vector);
end asserts;

package body asserts is

    -- Print a report of actual and expected, and return a string that the assert itself will print
    function printReport(actual : std_logic_vector; expected : std_logic_vector) return string is
        variable outline : line;
    begin
        write(outline, string'("expected "));
        
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
        assert ( actual =  expected ) report printReport(actual, expected) severity warning;
    end assertEqual;
end ASSERTS;
