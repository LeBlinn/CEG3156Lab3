-- The top right full adder that adds two 32 bits for a 32 bit product, carry out included
-- but not necessary for the functionality of the processor.

library ieee;
use ieee.std_logic_1164.all;

ENTITY TopRightAdder IS

  PORT(
	    i_carryIn : in std_logic;
	    i_a : in std_logic_vector(31 downto 0);
	    i_b : in std_logic_vector(31 downto 0);
	    o_carryOut : out std_logic;
	    o_SumOut : out std_logic_vector(31 downto 0)
	  );
	  
END ENTITY TopRightAdder;

architecture add of TopRightAdder is

  signal int_Sum, int_CarryOut : STD_LOGIC_VECTOR (31 downto 0);

	COMPONENT FullAdder
	PORT(
		A, B, Cin: IN STD_LOGIC;
		SUM, Cout: OUT STD_LOGIC);
	END COMPONENT;
	
begin

lsb: FullAdder
      PORT MAP(
            Cin => i_carryIn,
            A => i_a(0),
            B => i_b(0),
            SUM => int_Sum(0),
            Cout => int_CarryOut(0));

nAdders: for k in 1 to 31 generate
      FA_k: FullAdder 
      PORT MAP(
            A => i_a(k),
            B => i_b(k),
            Cin => int_CarryOut(k-1),
            SUM => int_Sum(k) ,
            Cout => int_CarryOut(k) 
      );
end generate nAdders;

o_SumOut <= int_Sum;
o_carryOut <= int_CarryOut(31);

end architecture;