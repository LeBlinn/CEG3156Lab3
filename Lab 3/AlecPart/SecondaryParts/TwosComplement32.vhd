library IEEE;
use ieee.std_logic_1164.ALL;

entity TwosComplement32 is
    port(
        Input : in std_logic_vector(31 downto 0);
        twos_complement_output : out std_logic_vector(31 downto 0)
    );
end TwosComplement32;

Architecture rtl of TwosComplement32 is 

Signal Invert : std_logic_vector(31 downto 0);

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

gen_inv: for i in 0 to 31 generate
        Invert(i) <= (not Input(i));
    end generate gen_inv;

Adder : ThirtyTwoBitCLA
	Port Map (A => Invert,
					B => "00000000000000000000000000000001",
					Cin => '0',
					S => twos_complement_output);
					
End rtl;