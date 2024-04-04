library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF32bit is
    Port (RST, CLK, ENB : in std_logic;
			D : in std_logic_vector(31 downto 0);
			Q : out std_logic_vector(31 downto 0));
end DFF32bit;

architecture rtl of DFF32bit is
    component enARdFF_2 is
        Port ( i_resetBar : in  STD_LOGIC;
               i_d        : in  STD_LOGIC;
               i_enable   : in  STD_LOGIC;
               i_clock    : in  STD_LOGIC;
               o_q, o_qBar : out STD_LOGIC);
    end component;
begin

    Gen_FlipFlops: for i in 0 to 31 generate
        FlipFlop_i: enARdFF_2
            port map (
                i_resetBar => RST,
                i_d        => D(i),
                i_enable   => ENB,
                i_clock    => CLK,
                o_q        => Q(i)
            );
    end generate Gen_FlipFlops;

end rtl;