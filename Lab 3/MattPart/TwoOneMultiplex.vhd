library ieee;
use ieee.std_logic_1164.all;

entity TwoOneMultiplex is
	port(
	sel : in STD_LOGIC;
	in1, in0 : in STD_LOGIC;
	muxOut : out STD_LOGIC);
end TwoOneMultiplex;

architecture structure of TwoOneMultiplex is
	signal out1, out0 : STD_LOGIC;
	begin
		out1 <= in1 and sel;
		out0 <= in0 and (not sel);
		muxOut <= out1 or out0;
end structure;