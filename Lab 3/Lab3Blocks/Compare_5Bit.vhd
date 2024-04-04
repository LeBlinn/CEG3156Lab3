library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Compare_5Bit is
    Port (
        A : in  STD_LOGIC_VECTOR (4 downto 0); 
        B : in  STD_LOGIC_VECTOR (4 downto 0);  
        Equal : out  STD_LOGIC               
    );
end Compare_5Bit;

architecture Structural of Compare_5Bit is

    signal A_xor_B : STD_LOGIC_VECTOR (4 downto 0); 

begin

    A_xor_B(0) <= A(0) xor B(0);
    A_xor_B(1) <= A(1) xor B(1);
    A_xor_B(2) <= A(2) xor B(2);
    A_xor_B(3) <= A(3) xor B(3);
    A_xor_B(4) <= A(4) xor B(4);

    Equal <= not (A_xor_B(0) or A_xor_B(1) or A_xor_B(2) or A_xor_B(3) or A_xor_B(4));

end Structural;