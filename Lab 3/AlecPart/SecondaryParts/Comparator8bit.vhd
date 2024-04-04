LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

Entity Comparator8bit is 
    Port (
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        G : out std_logic;  -- A > B
        GorE : out std_logic  -- A >= B
    );
End Comparator8bit;

Architecture Structural of Comparator8bit is 
    Signal AGB: std_logic_vector(7 downto 0); 
    Signal m: std_logic_vector(7 downto 0);
    Signal Gr, E : std_logic;

Begin
   
    -- Initialize the comparison from the MSB
    AGB(7) <= (not B(7) and A(7));
    m(7) <= not(B(7) xor A(7));

    -- Generate the comparison results for each bit
    gen_comp: for i in 6 downto 0 generate
    begin
        AGB(i) <= (m(i+1) and not B(i) and A(i));
        m(i) <= m(i+1) and not(B(i) xor A(i));
    end generate;

    -- Determine if A > B
    Gr <= AGB(7) or AGB(6) or AGB(5) or AGB(4) or AGB(3) or AGB(2) or AGB(1) or AGB(0); 

    -- Determine if all bits are equal
    E <= m(0);

    -- Output results
    G <= Gr;
    GorE <= Gr or E;

End Structural;
