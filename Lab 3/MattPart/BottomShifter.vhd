--Shifts a 32 bit value to the left, changing 2 LSB to zero
library ieee;
use ieee.std_logic_1164.all;

entity BottomShifter is
    port(
        i_Input: in STD_LOGIC_VECTOR(31 downto 0);
        o_Output: out STD_LOGIC_VECTOR(31 downto 0)
    );
end BottomShifter;

architecture shift of BottomShifter is
    signal i_d_output : STD_LOGIC_VECTOR(31 downto 0);
begin
    process(i_Input)
    begin
        for k in 0 to 29 loop
            i_d_output(k+2) <= i_Input(k);
        end loop;
        i_d_output(1) <= '0';
        i_d_output(0) <= '0';
    end process;

    o_Output <= i_d_output;
end architecture shift;