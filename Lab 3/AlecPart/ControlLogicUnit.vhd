library ieee;
use ieee.std_logic_1164.all;

Entity ControlLogicUnit is 
    Port (OpCode : IN std_logic_vector(5 downto 0);
          RegDst : OUT std_logic;
          ALUScr : OUT std_logic;
          MemToReg : OUT std_logic;
          RegWrite : OUT std_logic;
          MemRead : OUT std_logic;
          MemWrite : OUT std_logic;
          BranchEqual : OUT std_logic;
			 BranchNotEqual : OUT std_logic;
          ALUOp : OUT std_logic_vector(1 downto 0);
			 Jump : OUT std_logic);
End ControlLogicUnit;

Architecture rtl of ControlLogicUnit is

Signal Rformat, lw, sw, beq, jmp, bneq : std_logic;

Begin

Rformat <= (not OpCode(5)) and (not OpCode(4)) and (not OpCode(3)) and (not OpCode(2)) and (not OpCode(1)) and (not OpCode(0));

lw <= (OpCode(5)) and (not OpCode(4)) and (not OpCode(3)) and (not OpCode(2)) and (OpCode(1)) and (OpCode(0));

sw <= (OpCode(5)) and (not OpCode(4)) and (OpCode(3)) and (not OpCode(2)) and (OpCode(1)) and (OpCode(0));

beq <= (not OpCode(5)) and (not OpCode(4)) and (not OpCode(3)) and (OpCode(2)) and (not OpCode(1)) and (not OpCode(0));

bneq <= (not OpCode(5)) and (not OpCode(4)) and (not OpCode(3)) and (OpCode(2)) and (not OpCode(1)) and (OpCode(0));

jmp <= (not OpCode(5)) and (not OpCode(4)) and (not OpCode(3)) and (not OpCode(2)) and (OpCode(1)) and (not OpCode(0));

RegDst <= Rformat;
ALUScr <= lw or sw;
MemToReg <= lw;
RegWrite <= Rformat or lw;
MemRead <= lw;
MemWrite <= sw;
BranchEqual <= beq;
BranchNotEqual <= bneq;
ALUOp(1) <= Rformat;
ALUOp(0) <= beq;
Jump <= jmp;

End rtl;
