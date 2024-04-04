library ieee;
use ieee.std_logic_1164.all;

Entity ControlSgnialMultiplexer is 
	Port (HazardSignal : IN std_logic;
			RegDst_IN : IN std_logic;
          ALUScr_IN : IN std_logic;
          MemToReg_IN : IN std_logic;
          RegWrite_IN : IN std_logic;
          MemRead_IN : IN std_logic;
          MemWrite_IN : IN std_logic;
          BranchEqual_IN : IN std_logic;
          ALUOp_IN : IN std_logic_vector(1 downto 0);
			 Jump_IN : IN std_logic;
			 
			 MemToReg_OUT : OUT std_logic;
			 RegWrite_OUT : OUT std_logic;
			 BranchEqual_OUT : OUT std_logic;
			 MemRead_OUT : OUT std_logic;
          MemWrite_OUT : OUT std_logic;
			 RegDst_OUT : OUT std_logic;
          ALUOp1_OUT : OUT std_logic;
			 ALUOp0_OUT : OUT std_logic;
			 ALUScr_OUT : OUT std_logic;
			 Jump_OUT : OUT std_logic);
End ControlSgnialMultiplexer;

Architecture rtl of ControlSgnialMultiplexer is 

Component Mux1Bit is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
		  S : in STD_LOGIC;
        Y : out STD_LOGIC);
end Component;

Begin

HazardSignalMux : Mux1Bit
	Port map (A => RegDst_IN,
				B => '0',
				S => HazardSignal,
				Y => RegDst_OUT);

ALUScrMux : Mux1Bit
	Port map (A =>  ALUScr_IN,
				B => '0',
				S => HazardSignal,
				Y =>  ALUScr_OUT);

MemToRegMux : Mux1Bit
	Port map (A => MemToReg_IN,
				B => '0',
				S => HazardSignal,
				Y => MemToReg_OUT);

RegWriteMux : Mux1Bit
	Port map (A => RegWrite_IN,
				B => '0',
				S => HazardSignal,
				Y => RegWrite_OUT);
				
MemWriteMux : Mux1Bit
	Port map (A => MemWrite_IN,
				B => '0',
				S => HazardSignal,
				Y => MemWrite_OUT);
 
BranchEqualMux : Mux1Bit
	Port map (A => BranchEqual_IN,
				B => '0',
				S => HazardSignal,
				Y => BranchEqual_OUT);
  
ALUOp0Mux : Mux1Bit
	Port map (A => ALUOp_IN(0),
				B => '0',
				S => HazardSignal,
				Y => ALUOp0_OUT);
				
ALUOp1Mux : Mux1Bit
	Port map (A => ALUOp_IN(1),
				B => '0',
				S => HazardSignal,
				Y => ALUOp1_OUT);
				
JumpMux : Mux1Bit
	Port map (A => Jump_IN,
				B => '0',
				S => HazardSignal,
				Y => Jump_OUT);
				
End;