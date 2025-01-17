--The MSB of a 16 bit number is extended 16 MSB's, extending the value to 32 bits
library ieee;
use ieee.std_logic_1164.all;

entity SignExtender is
    port(
        i_Input: in STD_LOGIC_VECTOR(15 downto 0);
        o_Output: out STD_LOGIC_VECTOR(31 downto 0)
    );
end SignExtender;

architecture extension of SignExtender is
    signal i_d_output : STD_LOGIC_VECTOR(31 downto 0);
begin
    process(i_Input)
    begin
        for k in 0 to 15 loop
            i_d_output(k) <= i_Input(k);
        end loop;
        for k in 16 to 31 loop
            i_d_output(k) <= (i_input(15) and not(i_d_output(k)))
             or (i_input(15) and i_d_output(k));
        end loop;
    end process;

    o_Output <= i_d_output;
end architecture extension;