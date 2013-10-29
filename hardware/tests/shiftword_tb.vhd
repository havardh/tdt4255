library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;



entity shiftword_tb is
end shiftword_tb;


architecture Behavioral of shiftword_tb is

	component shiftword is
		generic ( N: natural := 32; D: natural := 1);
		port (
			X : in STD_LOGIC_VECTOR(N-1 downto 0);
			SHAMT : in STD_LOGIC;
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
	signal SHAMT : STD_LOGIC;

	signal R1 : STD_LOGIC_VECTOR(31 downto 0);
	signal R2 : STD_LOGIC_VECTOR(31 downto 0);
	signal R3 : STD_LOGIC_VECTOR(31 downto 0);

begin
	
	uut: shiftword
		generic map(N => 32, D => 0)
	  port map (X => X, SHAMT => SHAMT, R => R1);
	
	stim_proc : process
	begin
	
		X <= "00000000000000000000000000000001";
		SHAMT <= '1';
		wait for 10 ns;
		assertEqual(R1, "10000000000000000000000000000000", "10000000000000000000000000000000");

		SHAMT <= '0'; SHAMT <= '1';

		X <= "00000000000000000000000000000001";
		SHAMT <= '0';
		wait for 10 ns;
		assertEqual(R1, "00000000000000000000000000000001", "00000000000000000000000000000001");

		SHAMT <= '0'; SHAMT <= '1';
		
		X <= "10000000000000000000000000000001";
		SHAMT <= '1';
		wait for 10 ns;
		assertEqual(R1, "11000000000000000000000000000000", "11000000000000000000000000000000");

		SHAMT <= '0'; SHAMT <= '1';

		X <= "10101010101010101010101010101010";
		SHAMT <= '1';
		wait for 10 ns;
		assertEqual(R1, "01010101010101010101010101010101", "01010101010101010101010101010101");

		SHAMT <= '0'; SHAMT <= '1';
		
		
		wait;
		
	end process;

	
	uut2: shiftword
		generic map(N => 32, D => 2)
	  port map (X => X, SHAMT => SHAMT, R => R2);
	
	stim_proc2 : process
	begin
	
		X <= "00000000000000000000000000000001";
		SHAMT <= '1';
		wait for 10 ns;
		assertEqual(R2, "00010000000000000000000000000000", "00010000000000000000000000000000");

		SHAMT <= '0'; SHAMT <= '1';

		X <= "00000000000000000000000000000001";
		SHAMT <= '0';
		wait for 10 ns;
		assertEqual(R2, "00000000000000000000000000000001", "00000000000000000000000000000001");

		SHAMT <= '0'; SHAMT <= '1';
		
		X <= "10000000000000000000000000000001";
		SHAMT <= '1';
		wait for 10 ns;
		assertEqual(R2, "00011000000000000000000000000000", "00011000000000000000000000000000");

		SHAMT <= '0'; SHAMT <= '1';

		X <= "10101010101010101010101010101010";
		SHAMT <= '1';
		wait for 10 ns;
		assertEqual(R2, "10101010101010101010101010101010", "10101010101010101010101010101010");

		SHAMT <= '0'; SHAMT <= '1';
		
		
		wait;
		
	end process;

	uut3: shiftword
		generic map(N => 32, D => 4)
	  port map (X => X, SHAMT => SHAMT, R => R3);
	
	stim_proc3 : process
	begin
	
		X <= "00000000000000000000000000000001";
		SHAMT <= '1';
		wait for 10 ns;
		assertEqual(R3, "00000000000000010000000000000000", "00000000000000010000000000000000");

		SHAMT <= '0'; SHAMT <= '1';

		X <= "00000000000000000000000000000001";
		SHAMT <= '0';
		wait for 10 ns;
		assertEqual(R3, "00000000000000000000000000000001", "00000000000000000000000000000001");

		SHAMT <= '0'; SHAMT <= '1';
		
		X <= "10000000000000000000000000000001";
		SHAMT <= '1';
		wait for 10 ns;
		assertEqual(R3, "00000000000000011000000000000000", "00000000000000001100000000000000");

		SHAMT <= '0'; SHAMT <= '1';

		X <= "10101010101010101010101010101010";
		SHAMT <= '1';
		wait for 10 ns;
		assertEqual(R3, "10101010101010101010101010101010", "10101010101010101010101010101010");

		SHAMT <= '0'; SHAMT <= '1';
		
		
		wait;
		
	end process;

	
end Behavioral;
