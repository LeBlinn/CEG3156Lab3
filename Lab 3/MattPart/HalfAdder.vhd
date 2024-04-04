library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
	port (
	A, B : in STD_LOGIC;
	SUM, Cout : out STD_LOGIC);
end entity;

architecture struct of HalfAdder is
	begin
	SUM <= A xor B;
	Cout <= A and B;
end architecture;
