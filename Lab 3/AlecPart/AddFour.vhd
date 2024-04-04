library ieee;
use ieee.std_logic_1164.all;

Entity AddFour is
	Port (PC : IN std_logic_vector(7 downto 0);
			PCplusFour : OUT std_logic_vector(31 downto 0));
End AddFour;

Architecture rtl of AddFour is

Component ThirtyTwoBitCLA is
    port(
        A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        Cin: in std_logic;
        
        S: out std_logic_vector(31 downto 0);
        Cout: out std_logic
    );
end Component;

Begin 

Adder : ThirtyTwoBitCLA
	Port Map (A => PC & "000000000000000000000000",
					B => "00000001000000000000000000000000",
					Cin => '0',
					S => PCplusFour);
End rtl;

