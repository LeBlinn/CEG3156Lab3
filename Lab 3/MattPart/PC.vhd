-- 8 Bit Register for the processor counter
library ieee;
use ieee.std_logic_1164.all;

entity PC is
    port(
        i_Input: in STD_LOGIC_VECTOR(7 downto 0);
        i_CLK,i_RST: in STD_LOGIC;
        o_Output: out STD_LOGIC_VECTOR(7 downto 0)
    );
end PC;

architecture rtl of PC is
    signal int_Input, int_Output : std_logic_vector(7 downto 0);

    component D_FF
        port(
        i_d, i_clk, i_clr, i_set: in STD_LOGIC;
        o_Q, o_Qbar : out STD_LOGIC);
    end component;

begin

    nFF: for k in 0 to 7 generate
        D_FFk: D_FF
        PORT MAP(
            i_set => '0',
            i_clr => i_RST,
            i_clk => i_CLK,
            i_d => i_Input(k),
            o_Q => int_Output(k)
          );
    end generate nFF;

    o_Output <= int_Output;

end architecture;