library IEEE;
use ieee.std_logic_1164.ALL;

-- IMPLEMENT SOLT

Entity ALU is 
	Port (Data1, Data2 : IN std_logic_vector(7 downto 0);
			ALUop : IN std_logic_vector (2 downto 0);
			Zero : OUT std_logic;
			ALUout : OUT std_logic_vector(7 downto 0));
End ALU;

Architecture rtl of ALU is 
Signal ANDed, ORed, ADDed, SUBed, TwosComp2, Result : std_logic_vector(7 downto 0);
Signal SOLT : std_logic; 

Component mux8x1_8bit is
    port(
        S : in std_logic_vector(2 downto 0);
        In0, In1, In2, In3, In4, In5, In6, In7: in std_logic_vector(7 downto 0);
        Output : out std_logic_vector(7 downto 0)
    );
end Component;

Component EightBitCLA is
    port(
        A: in std_logic_vector(7 downto 0);
        B: in std_logic_vector(7 downto 0);
        Cin: in std_logic;
        
        S: out std_logic_vector(7 downto 0);
        Cout: out std_logic
    );
end Component;

Component TwosComplement8 is
    port(
        Input : in std_logic_vector(7 downto 0);
        twos_complement_output : out std_logic_vector(7 downto 0)
    );
end Component;

Component AllZero8 is
    port(
        input_vector : in std_logic_vector(7 downto 0);
        all_zero : out std_logic
    );
end Component;

Component Comparator8bit is 
    Port (
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        G : out std_logic;  -- A > B
        GorE : out std_logic  -- A >= B
    );
End Component;

Begin

gen_and: for i in 0 to 7 generate
        ANDed(i) <= (Data1(i) and Data2(i));
    end generate gen_and;
	 
gen_or: for i in 0 to 7 generate
        ORed(i) <= (Data1(i) or Data2(i));
    end generate gen_or;
	 

	 
Adder : EightBitCLA
	Port Map (A => Data1,
					B => Data2,
					Cin => '0',
					S => ADDed);

TwosComp : TwosComplement8
	port Map (Input => Data2,
					twos_complement_output => TwosComp2);
					
Suber : EightBitCLA
	Port Map (A => Data1,
					B => TwosComp2,
					Cin => '0',
					S => SUBed);
					
Compare : Comparator8bit
	Port Map (A => Data1,
					B => Data2,
					G => SOLT);

MUX : mux8x1_8bit
	Port Map (S => ALUop,
					In0 => ANDed,
					In1 => ORed,
					In2 => ADDed, 
					In3 => "00000000", 
					In4 => "00000000", 
					In5 => "00000000", 
					In6 => SUBed, 
					In7 => "0000000" & SOLT, 
					Output => Result);
					
IsZero : AllZero8
	Port Map (input_vector => Result,
					all_zero => Zero);
					
ALUout <= Result;

End rtl;

					
