library ieee;
use ieee.std_logic_1164.all;

package asserts is
	procedure assertEqual(actual : std_logic_vector; expected : std_logic_vector; msg : string);
end asserts;

package body asserts is
	function signalToString (v : std_logic_vector ) return string is
	variable s : string ( 3 downto 1 );
	variable r : string ( (v'left+1) downto (v'right+1) );
	begin
		for i in v'left downto v'right loop
			s := std_logic'image(v(i));
			r(i+1) := s(2);
		end loop;
		return r;
	end signalToString;

	procedure assertEqual (actual : std_logic_vector; expected : std_logic_vector; msg : string) is
	begin
        assert ( actual =  expected ) report "expected " & signalToString( actual ) & " to be equal to " & msg severity failure;
	end assertEqual;
end ASSERTS;
