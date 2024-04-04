library ieee;
use ieee.std_logic_1164.all;

Entity MEMWB_Pipe is
	Port (WB_MemtoReg_IN, WB_RegWrite_IN : IN std_logic;
				MemoryData_IN, MemoryAddress_IN : IN std_logic_vector (7 downto 0);
				RdLocation_IN : IN std_logic_vector(4 downto 0);
				
				Clock, Reset: IN std_logic;
				
				WB_MemtoReg_OUT, WB_RegWrite_OUT: OUT std_logic;
				MemoryData_OUT, MemoryAddress_OUT : OUT std_logic_vector (7 downto 0);
				RdLocation_OUT : OUT std_logic_vector(4 downto 0));
End MEMWB_Pipe;

Architecture rtl of MEMWB_Pipe is 

component enARdFF_2 is
  Port ( i_resetBar : in  STD_LOGIC;
			i_d        : in  STD_LOGIC;
			i_enable   : in  STD_LOGIC;
			i_clock    : in  STD_LOGIC;
			o_q, o_qBar : out STD_LOGIC);
end component;

component DFF5bit is 
	Port (RST, CLK, ENB : in std_logic;
			D : in std_logic_vector(4 downto 0);
			Q : out std_logic_vector(4 downto 0));
END component;
	
Component DFF8bit is 
	Port (RST, CLK, ENB : in std_logic;
			D : in std_logic_vector(7 downto 0);
			Q : out std_logic_vector(7 downto 0));
END Component;

Begin

	WB_MemtoRegFlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        => WB_MemtoReg_IN,
		 i_enable   => '1',
		 i_clock    => Clock,
		 o_q        => WB_MemtoReg_OUT);
		 
	WB_RegWriteFlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        => WB_RegWrite_IN,
		 i_enable   => '1',
		 i_clock    => Clock,
		 o_q        => WB_RegWrite_OUT);
		 
	MemoryDataFlipFlop : DFF8bit 
	port map(
      RST => Reset,
      CLK => Clock,
      ENB => '1',
      D   => MemoryData_IN,
      Q   => MemoryData_OUT);
	
	RtDataIDFlipFlop : DFF8bit 
	port map(
		RST => Reset,
      CLK => Clock,
      ENB => '1',
      D   => MemoryAddress_IN,
      Q   => MemoryAddress_OUT);
		
	RdLocationFlipFlop : DFF5bit 
	port map(
      RST => Reset,
      CLK => Clock,
      ENB => '1',
      D   => RdLocation_IN,
      Q   => RdLocation_OUT);	

End; 
		
		 
