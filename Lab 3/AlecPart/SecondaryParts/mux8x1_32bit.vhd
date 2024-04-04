library ieee;
USE ieee.std_logic_1164.ALL;

entity mux8x1_32bit is
    port(
        S : in std_logic_vector(2 downto 0);
        In0, In1, In2, In3, In4, In5, In6, In7: in std_logic_vector(31 downto 0);
        Output : out std_logic_vector(31 downto 0)
    );
end mux8x1_32bit;

Architecture rtl of mux8x1_32bit is
    signal sel_signals: std_logic_vector(7 downto 0); 
begin
    sel_signals(0) <= not S(2) and not S(1) and not S(0);
    sel_signals(1) <= not S(2) and not S(1) and     S(0);
    sel_signals(2) <= not S(2) and     S(1) and not S(0);
    sel_signals(3) <= not S(2) and     S(1) and     S(0);
    sel_signals(4) <=     S(2) and not S(1) and not S(0);
    sel_signals(5) <=     S(2) and not S(1) and     S(0);
    sel_signals(6) <=     S(2) and     S(1) and not S(0);
    sel_signals(7) <=     S(2) and     S(1) and     S(0);

    gen_output: for i in 0 to 31 generate
        Output(i) <= (In0(i) and sel_signals(0)) or
                     (In1(i) and sel_signals(1)) or
                     (In2(i) and sel_signals(2)) or
                     (In3(i) and sel_signals(3)) or
                     (In4(i) and sel_signals(4)) or
                     (In5(i) and sel_signals(5)) or
                     (In6(i) and sel_signals(6)) or
                     (In7(i) and sel_signals(7));
    end generate gen_output;

end rtl;