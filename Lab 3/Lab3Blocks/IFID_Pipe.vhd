library ieee;
use ieee.std_logic_1164.all;

Entity IFID_Pipe is 
	Port(PCplusFour_IN : IN std_logic_vector (31 downto 0);
			Instruction_IN : IN std_logic_vector (31 downto 0);
			HazardCS, IF_Flush, Clock, Reset: IN std_logic;
			PCplusFour_OUT : OUT std_logic_vector (31 downto 0);
			Instruction_OUT : OUT std_logic_vector (31 downto 0));
End IFID_Pipe;

Architecture rtl of IFID_Pipe is 

signal RST_combined, ENB_signal: std_logic;
	
--Component DFF8bit is 
--	Port (RST, CLK, ENB : in std_logic;
--			D : in std_logic_vector(7 downto 0);
--			Q : out std_logic_vector(7 downto 0));
--END Component;

Component DFF32bit is
    Port (RST, CLK, ENB : in std_logic;
			D : in std_logic_vector(31 downto 0);
			Q : out std_logic_vector(31 downto 0));
end Component;

Begin

	RST_combined <= Reset or IF_Flush;
	ENB_signal <= not HazardCS;

--    PCFlipFlop : DFF8bit 
--	 port map(
--        RST => RST_combined,
--        CLK => Clock,
--        ENB => ENB_signal,
--        D   => PCplusFour_IN,
--        Q   => PCplusFour_OUT);
		  
    PCFlipFlop : DFF32bit 
	 port map(
        RST => RST_combined,
        CLK => Clock,
        ENB => ENB_signal,
        D   => PCplusFour_IN,
        Q   => PCplusFour_OUT);

    InstructionFlipFlop : DFF32bit 
	 port map(
        RST => RST_combined,
        CLK => Clock,
        ENB => ENB_signal,
        D   => Instruction_IN,
        Q   => Instruction_OUT);
end rtl;