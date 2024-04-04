library IEEE;
use ieee.std_logic_1164.ALL;

-- Defining the entity for the 8-bit CLA
entity EightBitCLA is
    port(
        A: in std_logic_vector(7 downto 0);
        B: in std_logic_vector(7 downto 0);
        Cin: in std_logic;
        
        S: out std_logic_vector(7 downto 0);
        Cout: out std_logic
    );
end EightBitCLA;

-- Implementation of the 8-bit CLA
architecture rtl of EightBitCLA is
    -- Declaration of the 4-bit CLA component
    component fourBitCLA is
        port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            cin: in std_logic;
            
            s: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
    end component;

    -- Intermediate carry signal
    signal carry: std_logic; 

begin
    -- First 4-bit CLA block
    CLA_Lower: fourBitCLA port map(
        a => A(3 downto 0),
        b => B(3 downto 0),
        cin => Cin,
        
        s => S(3 downto 0),
        cout => carry
    );

    -- Second 4-bit CLA block
    CLA_Upper: fourBitCLA port map(
        a => A(7 downto 4),
        b => B(7 downto 4),
        cin => carry,
        
        s => S(7 downto 4),
        cout => Cout
    );

end rtl;
