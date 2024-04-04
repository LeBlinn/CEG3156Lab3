LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

Entity Comparator32bit is 
    Port (
        A : in std_logic_vector(31 downto 0);
        B : in std_logic_vector(31 downto 0);
        G : out std_logic;  -- A > B
        GorE : out std_logic  -- A >= B
    );
End Comparator32bit;

Architecture Structural of Comparator32bit is 
    Signal AGB: std_logic_vector(31 downto 0); 
    Signal m: std_logic_vector(31 downto 0);
    Signal Gr, E : std_logic;

Begin
   
    AGB(31) <= (not B(31) and A(31));
    m(31) <= not(B(31) xor A(31));
    gen_comp: for i in 30 downto 0 generate
    begin
        AGB(i) <= (m(i+1) and not B(i) and A(i));
        m(i) <= m(i+1) and not(B(i) xor A(i));
    end generate;

  
    Gr <= AGB (31) or AGB (30) or AGB (29) or AGB (28) or AGB (27) or AGB (26) or AGB (25) or AGB (24) or 
			AGB (23) or AGB (22) or AGB (21) or AGB (20) or AGB (19) or AGB (18) or AGB (17) or AGB (16) or
			AGB (15) or AGB (14) or AGB (13) or AGB (12) or AGB (11) or AGB (10) or AGB (9) or AGB (8) or
			AGB (7) or AGB (6) or AGB (5) or AGB (4) or AGB (3) or AGB (2) or AGB (1) or AGB (0); 
    E <= m(0);

    G <= Gr;
    GorE <= Gr or E;

End Structural;