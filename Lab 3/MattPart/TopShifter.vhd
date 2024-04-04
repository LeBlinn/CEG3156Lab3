--This code basically inserts 2 zeros to the LSB of a 26 bit instruction
library ieee;
use ieee.std_logic_1164.all;

entity TopShifter is
    port(
        i_Input: in STD_LOGIC_VECTOR(25 downto 0);
        o_Output: out STD_LOGIC_VECTOR(27 downto 0)
    );
end TopShifter;

architecture shift of TopShifter is
    signal i_d_output : STD_LOGIC_VECTOR(27 downto 0);
begin
    process(i_Input)
    begin
        for k in 0 to 25 loop
            i_d_output(k+2) <= i_Input(k);
        end loop;
        i_d_output(1) <= '0';
        i_d_output(0) <= '0';
    end process;

    o_Output <= i_d_output;
end architecture shift;