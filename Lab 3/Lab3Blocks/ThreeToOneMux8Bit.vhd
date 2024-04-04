library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ThreeToOneMux8Bit is
    Port (
        D0 : in STD_LOGIC_VECTOR(7 downto 0); -- Input data 0
        D1 : in STD_LOGIC_VECTOR(7 downto 0); -- Input data 1
        D2 : in STD_LOGIC_VECTOR(7 downto 0); -- Input data 2
        S : in STD_LOGIC_VECTOR(1 downto 0);  -- 2-bit select signal
        Y : out STD_LOGIC_VECTOR(7 downto 0)  -- Output data
    );
end ThreeToOneMux8Bit;

architecture Structural of ThreeToOneMux8Bit is
    -- Assuming AND_Gate, OR_Gate, and NOT_Gate are defined similarly to AND_Gate example
    signal notS0, notS1: STD_LOGIC;
    signal and0, and1, and2: STD_LOGIC_VECTOR(7 downto 0);
begin
    -- Inverting select lines
    notS0 <= not S(0);
    notS1 <= not S(1);

    -- Connecting gates to implement the multiplexer functionality
    gen_d0: for i in 0 to 7 generate
        and0(i) <= D0(i) and notS1 and notS0;
    end generate gen_d0;

    gen_d1: for i in 0 to 7 generate
        and1(i) <= D1(i) and notS1 and S(0);
    end generate gen_d1;

    gen_d2: for i in 0 to 7 generate
        and2(i) <= D2(i) and S(1) and notS0;
    end generate gen_d2;

    -- Combining the results
    gen_y: for i in 0 to 7 generate
        Y(i) <= and0(i) or and1(i) or and2(i);
    end generate gen_y;

end Structural;
