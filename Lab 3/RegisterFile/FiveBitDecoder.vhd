library IEEE;
use ieee.std_logic_1164.ALL;

entity FiveBitDecoder is
    port(
        A: in std_logic_vector(4 downto 0);
		  output: out std_logic_vector(31 downto 0)
        );
end FiveBitDecoder;

architecture rtl of FiveBitDecoder is
   
	signal AI: std_logic_vector(4 downto 0);
	
begin

	AI(0) <= not(A(0));
	AI(1) <= not(A(1));
	AI(2) <= not(A(2));
	AI(3) <= not(A(3));
	AI(4) <= not(A(4));
	
	output(0) <= AI(4) and AI(3) and AI(2) and AI(1) and AI(0);
	output(1) <= AI(4) and AI(3) and AI(2) and AI(1) and A(0);
	output(2) <= AI(4) and AI(3) and AI(2) and A(1) and AI(0);
	output(3) <= AI(4) and AI(3) and AI(2) and A(1) and A(0);
	output(4) <= AI(4) and AI(3) and A(2) and AI(1) and AI(0);
	output(5) <= AI(4) and AI(3) and A(2) and AI(1) and A(0);
	output(6) <= AI(4) and AI(3) and A(2) and A(1) and AI(0);
	output(7) <= AI(4) and AI(3) and A(2) and A(1) and A(0);
	output(8) <= AI(4) and A(3) and AI(2) and AI(1) and AI(0);
	output(9) <= AI(4) and A(3) and AI(2) and AI(1) and A(0);
	output(10) <= AI(4) and A(3) and AI(2) and A(1) and AI(0);
	output(11) <= AI(4) and A(3) and AI(2) and A(1) and A(0);
	output(12) <= AI(4) and A(3) and A(2) and AI(1) and AI(0);
	output(13) <= AI(4) and A(3) and A(2) and AI(1) and A(0);
	output(14) <= AI(4) and A(3) and A(2) and A(1) and AI(0);
	output(15) <= AI(4) and A(3) and A(2) and A(1) and A(0);
	
	output(16) <= A(4) and AI(3) and AI(2) and AI(1) and AI(0);
	output(17) <= A(4) and AI(3) and AI(2) and AI(1) and A(0);
	output(18) <= A(4) and AI(3) and AI(2) and A(1) and AI(0);
	output(19) <= A(4) and AI(3) and AI(2) and A(1) and A(0);
	output(20) <= A(4) and AI(3) and A(2) and AI(1) and AI(0);
	output(21) <= A(4) and AI(3) and A(2) and AI(1) and A(0);
	output(22) <= A(4) and AI(3) and A(2) and A(1) and AI(0);
	output(23) <= A(4) and AI(3) and A(2) and A(1) and A(0);
	output(24) <= A(4) and A(3) and AI(2) and AI(1) and AI(0);
	output(25) <= A(4) and A(3) and AI(2) and AI(1) and A(0);
	output(26) <= A(4) and A(3) and AI(2) and A(1) and AI(0);
	output(27) <= A(4) and A(3) and AI(2) and A(1) and A(0);
	output(28) <= A(4) and A(3) and A(2) and AI(1) and AI(0);
	output(29) <= A(4) and A(3) and A(2) and AI(1) and A(0);
	output(30) <= A(4) and A(3) and A(2) and A(1) and AI(0);
	output(31) <= A(4) and A(3) and A(2) and A(1) and A(0);
    
end rtl;