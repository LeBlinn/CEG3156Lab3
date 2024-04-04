library ieee;
use ieee.std_logic_1164.all;

Entity HazardDetectionUnit is
	Port(IDEXMemRead : IN std_logic;
			IDEX_RegisterRt, IFID_RegisterRs, IFID_RegisterRt : IN std_logic_vector(4 downto 0);
			ControlMUX, IFIDWrite, PCWrite : OUT std_logic);
End HazardDetectionUnit;

Architecture rtl of HazardDetectionUnit is

Signal RtRsEQ, RtRtEQ, Stall : std_logic;

	Component Compare_5Bit is
		 Port (
			  A : in  STD_LOGIC_VECTOR (4 downto 0); 
			  B : in  STD_LOGIC_VECTOR (4 downto 0);  
			  Equal : out  STD_LOGIC               
		 );
	end Component;

Begin

IsRtRsEQ : Compare_5Bit
	Port Map (A => IDEX_RegisterRt,
					B => IFID_RegisterRs,
					Equal => RtRsEQ);

IsRtRtEQ : Compare_5Bit
	Port Map (A => IDEX_RegisterRt,
					B => IFID_RegisterRt,
					Equal => RtRtEQ);
					
Stall <= IDEXMemRead and (RtRsEQ or RtRtEQ);

ControlMUX <= Stall;
IFIDWrite <= not Stall;
PCWrite <= not Stall;

End; 
