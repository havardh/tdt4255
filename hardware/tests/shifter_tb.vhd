library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;



entity shifter_tb is
end shifter_tb;


architecture Behavioral of shifter_tb is

	component shifter is
		generic ( N: natural := 32);
		port (
			X : in STD_LOGIC_VECTOR(N-1 downto 0);
			SHAMT : in STD_LOGIC_VECTOR(integer(log2(real(N)))-1 downto 0);
			R : out STD_LOGIC_VECTOR(N-1 downto 0)
		);
	end component;

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
	
	procedure assertEqual (
		actual : std_logic_vector;
		expected : std_logic_vector;
		msg : string) is
	 

		begin
			assert ( actual =  expected )
				report "expected "
				  & signalToString( actual )
				  & " to be equal to "
			    & msg
				severity failure;
	end assertEqual;

	
	signal X : STD_LOGIC_VECTOR(31 downto 0);
	signal SHAMT : STD_LOGIC_VECTOR(4 downto 0);

	signal R : STD_LOGIC_VECTOR(31 downto 0);

begin
	
	uut: shifter
		generic map(N => 32)
	  port map (X => X, SHAMT => SHAMT, R => R);
	
	stim_proc : process
	begin

		X <= "00000000000000000000000000000001";
		SHAMT <= "00000";
		wait for 10 ns;
		assertEqual(R, "00000000000000000000000000000001", "00000000000000000000000000000001");
		
		X <= "00000000000000000000000000000001";
		SHAMT <= "00001";
		wait for 10 ns;
		assertEqual(R, "10000000000000000000000000000000", "10000000000000000000000000000000");

		X <= "00000000000000000000000000000001";
		SHAMT <= "00011";
		wait for 10 ns;
		assertEqual(R, "00100000000000000000000000000000", "00100000000000000000000000000000");

		X <= "00000000000000000000000000000001";
		SHAMT <= "11111";
		wait for 10 ns;
		assertEqual(R, "00000000000000000000000000000010", "00000000000000000000000000000010");
		
		wait;
		
	end process;
	
end Behavioral;
