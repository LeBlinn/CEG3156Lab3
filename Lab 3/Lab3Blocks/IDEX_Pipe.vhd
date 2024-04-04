library ieee;
use ieee.std_logic_1164.all;

Entity IDEX_Pipe is 
	Port (WB_MemtoReg_IN, WB_RegWrite_IN : IN std_logic;
			M_Branch_IN, M_MemRaed_IN, M_MemWirte_IN : IN std_logic;
			EX_RegDst_IN, EX_ALUOp1_IN, EX_ALUOp0_IN, EX_ALUSrt_IN : IN std_logic;
			RsDataID_IN, RtDataID_IN : IN std_logic_vector(7 downto 0);
			AddressEXT_IN : IN std_logic_vector(31 downto 0);
			RsLocationID_IN, RtLocationID_IN, RdLocationID_IN : IN std_logic_vector(4 downto 0);
			
			Clock, Reset: IN std_logic;
			
			WB_MemtoReg_OUT, WB_RegWrite_OUT : OUT std_logic;
			M_Branch_OUT, M_MemRaed_OUT, M_MemWirte_OUT : OUT std_logic;
			EX_RegDst_OUT, EX_ALUOp1_OUT, EX_ALUOp0_OUT, EX_ALUSrt_OUT : OUT std_logic;
			RsDataID_OUT, RtDataID_OUT : OUT std_logic_vector(7 downto 0);
			AddressEXT_OUT : OUT std_logic_vector(31 downto 0);
			RsLocationID_OUT, RtLocationID_OUT, RdLocationID_OUT : OUT std_logic_vector(4 downto 0));
			
End IDEX_Pipe;

Architecture rtl of IDEX_Pipe is 

signal ENB_signal: std_logic;


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

Component DFF32bit is
    Port (RST, CLK, ENB : in std_logic;
			D : in std_logic_vector(31 downto 0);
			Q : out std_logic_vector(31 downto 0));
end Component;

Begin

	ENB_signal <= (WB_MemtoReg_IN or WB_RegWrite_IN or M_Branch_IN or M_MemRaed_IN or M_MemWirte_IN or EX_RegDst_IN or EX_ALUOp1_IN or EX_ALUOp0_IN or EX_ALUSrt_IN);
	
	WB_MemtoRegFlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        => WB_MemtoReg_IN,
		 i_enable   => ENB_signal,
		 i_clock    => Clock,
		 o_q        => WB_MemtoReg_OUT);
		 
	WB_RegWriteFlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        => WB_RegWrite_IN,
		 i_enable   => ENB_signal,
		 i_clock    => Clock,
		 o_q        => WB_RegWrite_OUT);
	
	M_BranchFlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        => M_Branch_IN,
		 i_enable   => ENB_signal,
		 i_clock    => Clock,
		 o_q        => M_Branch_OUT);
	
	M_MemRaedFlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        =>  M_MemRaed_IN,
		 i_enable   => ENB_signal,
		 i_clock    => Clock,
		 o_q        =>  M_MemRaed_OUT);
	
	M_MemWirteFlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        =>  M_MemWirte_IN,
		 i_enable   => ENB_signal,
		 i_clock    => Clock,
		 o_q        => M_MemWirte_OUT);
	
	EX_RegDstFlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        => EX_RegDst_IN,
		 i_enable   => ENB_signal,
		 i_clock    => Clock,
		 o_q        => EX_RegDst_OUT);
	
	EX_ALUOp1FlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        => EX_ALUOp1_IN,
		 i_enable   => ENB_signal,
		 i_clock    => Clock,
		 o_q        => EX_ALUOp1_OUT);
		 
	EX_ALUOp0FlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        => EX_ALUOp0_IN,
		 i_enable   => ENB_signal,
		 i_clock    => Clock,
		 o_q        => EX_ALUOp0_OUT);
	
	EX_ALUSrtFlipFlop: enARdFF_2
	port map (
		 i_resetBar => Reset,
		 i_d        => EX_ALUSrt_IN,
		 i_enable   => ENB_signal,
		 i_clock    => Clock,
		 o_q        => EX_ALUSrt_OUT);
	 
	 
	RsDataIDFlipFlop : DFF8bit 
	port map(
      RST => Reset,
      CLK => Clock,
      ENB => ENB_signal,
      D   => RsDataID_IN,
      Q   => RsDataID_OUT);
	
	RtDataIDFlipFlop : DFF8bit 
	port map(
		RST => Reset,
      CLK => Clock,
      ENB => ENB_signal,
      D   => RtDataID_IN,
      Q   => RtDataID_OUT);
		   
	AddressEXTFlipFlop : DFF32bit 
	port map(
      RST => Reset,
      CLK => Clock,
      ENB => ENB_signal,
      D   => AddressEXT_IN,
      Q   => AddressEXT_OUT);

	RsLocationIDFlipFlop : DFF5bit 
	port map(
      RST => Reset,
      CLK => Clock,
      ENB => ENB_signal,
      D   => RsLocationID_IN,
      Q   => RsLocationID_OUT);	
	
	RtLocationIDFlipFlop : DFF5bit 
	port map(
      RST => Reset,
      CLK => Clock,
      ENB => ENB_signal,
      D   => RtLocationID_IN,
      Q   => RtLocationID_OUT);	
		
	RdLocationIDFlipFlop : DFF5bit 
	port map(
      RST => Reset,
      CLK => Clock,
      ENB => ENB_signal,
      D   => RdLocationID_IN,
      Q   => RdLocationID_OUT);	
		
		
		
end rtl;
