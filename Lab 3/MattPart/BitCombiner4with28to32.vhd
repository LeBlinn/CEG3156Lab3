-- Takes a 28 bit and 4 bit number and combines them to 32 bit.
-- 4 bit goes first, then 28 bits.
library ieee;
use ieee.std_logic_1164.all;

entity BitCombiner4with28to32 is 
    port(
        i_num1: in STD_LOGIC_VECTOR(3 downto 0);
        i_num2: in STD_LOGIC_VECTOR(27 downto 0);
        o_Output: out STD_LOGIC_VECTOR(31 downto 0)
    );
end BitCombiner4with28to32;

architecture combine of BitCombiner4with28to32 is
    signal i_d_output: STD_LOGIC_VECTOR(31 downto 0);

begin
    process(i_num1, i_num2)
    begin
        for k in 0 to 3 loop
            i_d_output(31-k) <= i_num1(k);
        end loop;
        for k in 4 to 31 loop
            i_d_output(31-k) <= i_num2(k - 4);
        end loop;
    end process;

    o_Output <= i_d_output;
end architecture combine;