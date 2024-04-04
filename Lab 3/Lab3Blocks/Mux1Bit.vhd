library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux1Bit is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
		  S : in STD_LOGIC;
        Y : out STD_LOGIC);
end Mux1Bit;

architecture Structural of Mux1Bit is

begin
    Y <= (A and not S) or (B and S);
end Structural;
