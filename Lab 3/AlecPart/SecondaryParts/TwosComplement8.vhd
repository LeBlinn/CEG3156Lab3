library IEEE;
use ieee.std_logic_1164.ALL;

entity TwosComplement8 is
    port(
        Input : in std_logic_vector(7 downto 0);
        twos_complement_output : out std_logic_vector(7 downto 0)
    );
end TwosComplement8;

Architecture rtl of TwosComplement8 is 

Signal Invert : std_logic_vector(7 downto 0);

-- Assuming an 8-bit adder component exists or the ThirtyTwoBitCLA has been adjusted for 8-bit operation
Component EightBitCLA is
    port(
        A: in std_logic_vector(7 downto 0);
        B: in std_logic_vector(7 downto 0);
        Cin: in std_logic;
        
        S: out std_logic_vector(7 downto 0);
        Cout: out std_logic
    );
end Component;

Begin

-- Invert each bit of the 8-bit input
gen_inv: for i in 0 to 7 generate
        Invert(i) <= not Input(i);
    end generate gen_inv;

-- Add 1 to the inverted input to complete the two's complement operation
Adder : EightBitCLA
    Port Map (
        A => Invert,
        B => "00000001", -- 8-bit representation of 1
        Cin => '0', -- No carry input for the addition
        S => twos_complement_output
    );
                    
End rtl;
