library ieee;
use ieee.std_logic_1164.all;

Entity ALUControlUnit is
    Port(ALUOp0 : IN std_logic;
				ALUOp1 : IN std_logic;
            Instruction : IN std_logic_vector (5 downto 0);
            Operation : OUT std_logic_vector (2 downto 0 ));
End ALUControlUnit;

Architecture rtl of ALUControlUnit is

Begin

    Operation(2) <= (ALUOp1 and Instruction(1)) or ALUOp0;

    Operation(1) <= (not ALUOp1 or not Instruction(2));

    Operation(0) <= (Instruction(0) or Instruction(3)) and ALUOp1;

End rtl;