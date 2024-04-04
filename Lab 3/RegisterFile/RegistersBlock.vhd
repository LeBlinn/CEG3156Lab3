library IEEE;
use ieee.std_logic_1164.ALL;

entity RegistersBlock is
    port(
        ReadReg1: in std_logic_vector(4 downto 0);
		  ReadReg2: in std_logic_vector(4 downto 0);
		  
		  RegWriteControl: in std_logic;
		  WriteReg: in std_logic_vector(4 downto 0);
		  WriteData: in std_logic_vector(7 downto 0);
		  
        i_reset: in std_logic;
        i_clock: in std_logic;

        ReadData1: out std_logic_vector(7 downto 0);
		  ReadData2: out std_logic_vector(7 downto 0)
        );
end RegistersBlock;

architecture rtl of RegistersBlock is
   
	component FiveBitDecoder
	 port(
        A: in std_logic_vector(4 downto 0);
		  output: out std_logic_vector(31 downto 0)
    );
	 end component;
	
	component eightBitRegister
	port(
        i_load: in STD_LOGIC_VECTOR(7 downto 0);
        i_reset: in std_logic;
        i_clock: in std_logic;
		  i_enable: in std_logic;
		
        o: out STD_LOGIC_VECTOR(7 downto 0)
   );
	end component;
	
	signal int_writeregEnable: std_logic_vector(31 downto 0);
	signal int_readreg1: std_logic_vector(31 downto 0);
	signal int_readreg2: std_logic_vector(31 downto 0);
	
	type int_regOutputArray is array (0 to 31) of std_logic_vector(7 downto 0);
	
	signal int_regOutputs: int_regOutputArray;
	
	type int_regOutputArray2 is array (0 to 31) of std_logic_vector(7 downto 0);
	
	signal int_ReadData1: int_regOutputArray2;
	signal int_ReadData2: int_regOutputArray2;
	
begin

	ReadReg1Decoder: FiveBitDecoder
	port map(
		A => ReadReg1,
		output => int_readreg1
	);
	
	ReadReg2Decoder: FiveBitDecoder
	port map(
		A => ReadReg2,
		output => int_readreg2
	);

	WriteRegDecoder: FiveBitDecoder
	port map(
		A => WriteReg,
		output => int_writeregEnable
	);
	
	Gen_Registers: for i in 0 to 31 generate
	begin
		reg: eightBitRegister
			port map(
				i_load => WriteData,
            i_reset => i_reset,
            i_clock => i_clock,
            i_enable => (int_writeregEnable(i) and RegWriteControl),
            o => int_regOutputs(i)
			);
			
			Gen_Outputs: for j in 0 to 7 generate
			begin
				int_ReadData1(i)(j) <= (int_regOutputs(i)(j) and int_readreg1(i));
				int_ReadData2(i)(j) <= (int_regOutputs(i)(j) and int_readreg2(i));
				end generate Gen_Outputs;
			
	end generate Gen_Registers;
	
	
			readData1(0) <= int_ReadData1(0)(0) or int_ReadData1(1)(0) or int_ReadData1(2)(0) or int_ReadData1(3)(0) or
               int_ReadData1(4)(0) or int_ReadData1(5)(0) or int_ReadData1(6)(0) or int_ReadData1(7)(0) or
               int_ReadData1(8)(0) or int_ReadData1(9)(0) or int_ReadData1(10)(0) or int_ReadData1(11)(0) or
               int_ReadData1(12)(0) or int_ReadData1(13)(0) or int_ReadData1(14)(0) or int_ReadData1(15)(0) or
               int_ReadData1(16)(0) or int_ReadData1(17)(0) or int_ReadData1(18)(0) or int_ReadData1(19)(0) or
               int_ReadData1(20)(0) or int_ReadData1(21)(0) or int_ReadData1(22)(0) or int_ReadData1(23)(0) or
               int_ReadData1(24)(0) or int_ReadData1(25)(0) or int_ReadData1(26)(0) or int_ReadData1(27)(0) or
               int_ReadData1(28)(0) or int_ReadData1(29)(0) or int_ReadData1(30)(0) or int_ReadData1(31)(0);

			readData1(1) <= int_ReadData1(0)(1) or int_ReadData1(1)(1) or int_ReadData1(2)(1) or int_ReadData1(3)(1) or
               int_ReadData1(4)(1) or int_ReadData1(5)(1) or int_ReadData1(6)(1) or int_ReadData1(7)(1) or
               int_ReadData1(8)(1) or int_ReadData1(9)(1) or int_ReadData1(10)(1) or int_ReadData1(11)(1) or
               int_ReadData1(12)(1) or int_ReadData1(13)(1) or int_ReadData1(14)(1) or int_ReadData1(15)(1) or
               int_ReadData1(16)(1) or int_ReadData1(17)(1) or int_ReadData1(18)(1) or int_ReadData1(19)(1) or
               int_ReadData1(20)(1) or int_ReadData1(21)(1) or int_ReadData1(22)(1) or int_ReadData1(23)(1) or
               int_ReadData1(24)(1) or int_ReadData1(25)(1) or int_ReadData1(26)(1) or int_ReadData1(27)(1) or
               int_ReadData1(28)(1) or int_ReadData1(29)(1) or int_ReadData1(30)(1) or int_ReadData1(31)(1);
					
			readData1(2) <= int_ReadData1(0)(2) or int_ReadData1(1)(2) or int_ReadData1(2)(2) or int_ReadData1(3)(2) or
               int_ReadData1(4)(2) or int_ReadData1(5)(2) or int_ReadData1(6)(2) or int_ReadData1(7)(2) or
               int_ReadData1(8)(2) or int_ReadData1(9)(2) or int_ReadData1(10)(2) or int_ReadData1(11)(2) or
               int_ReadData1(12)(2) or int_ReadData1(13)(2) or int_ReadData1(14)(2) or int_ReadData1(15)(2) or
               int_ReadData1(16)(2) or int_ReadData1(17)(2) or int_ReadData1(18)(2) or int_ReadData1(19)(2) or
               int_ReadData1(20)(2) or int_ReadData1(21)(2) or int_ReadData1(22)(2) or int_ReadData1(23)(2) or
               int_ReadData1(24)(2) or int_ReadData1(25)(2) or int_ReadData1(26)(2) or int_ReadData1(27)(2) or
               int_ReadData1(28)(2) or int_ReadData1(29)(2) or int_ReadData1(30)(2) or int_ReadData1(31)(2);

			readData1(3) <= int_ReadData1(0)(3) or int_ReadData1(1)(3) or int_ReadData1(2)(3) or int_ReadData1(3)(3) or
               int_ReadData1(4)(3) or int_ReadData1(5)(3) or int_ReadData1(6)(3) or int_ReadData1(7)(3) or
               int_ReadData1(8)(3) or int_ReadData1(9)(3) or int_ReadData1(10)(3) or int_ReadData1(11)(3) or
               int_ReadData1(12)(3) or int_ReadData1(13)(3) or int_ReadData1(14)(3) or int_ReadData1(15)(3) or
               int_ReadData1(16)(3) or int_ReadData1(17)(3) or int_ReadData1(18)(3) or int_ReadData1(19)(3) or
               int_ReadData1(20)(3) or int_ReadData1(21)(3) or int_ReadData1(22)(3) or int_ReadData1(23)(3) or
               int_ReadData1(24)(3) or int_ReadData1(25)(3) or int_ReadData1(26)(3) or int_ReadData1(27)(3) or
               int_ReadData1(28)(3) or int_ReadData1(29)(3) or int_ReadData1(30)(3) or int_ReadData1(31)(3);

			readData1(4) <= int_ReadData1(0)(4) or int_ReadData1(1)(4) or int_ReadData1(2)(4) or int_ReadData1(3)(4) or
               int_ReadData1(4)(4) or int_ReadData1(5)(4) or int_ReadData1(6)(4) or int_ReadData1(7)(4) or
               int_ReadData1(8)(4) or int_ReadData1(9)(4) or int_ReadData1(10)(4) or int_ReadData1(11)(4) or
               int_ReadData1(12)(4) or int_ReadData1(13)(4) or int_ReadData1(14)(4) or int_ReadData1(15)(4) or
               int_ReadData1(16)(4) or int_ReadData1(17)(4) or int_ReadData1(18)(4) or int_ReadData1(19)(4) or
               int_ReadData1(20)(4) or int_ReadData1(21)(4) or int_ReadData1(22)(4) or int_ReadData1(23)(4) or
               int_ReadData1(24)(4) or int_ReadData1(25)(4) or int_ReadData1(26)(4) or int_ReadData1(27)(4) or
               int_ReadData1(28)(4) or int_ReadData1(29)(4) or int_ReadData1(30)(4) or int_ReadData1(31)(4);

			readData1(5) <= int_ReadData1(0)(5) or int_ReadData1(1)(5) or int_ReadData1(2)(5) or int_ReadData1(3)(5) or
               int_ReadData1(4)(5) or int_ReadData1(5)(5) or int_ReadData1(6)(5) or int_ReadData1(7)(5) or
               int_ReadData1(8)(5) or int_ReadData1(9)(5) or int_ReadData1(10)(5) or int_ReadData1(11)(5) or
               int_ReadData1(12)(5) or int_ReadData1(13)(5) or int_ReadData1(14)(5) or int_ReadData1(15)(5) or
               int_ReadData1(16)(5) or int_ReadData1(17)(5) or int_ReadData1(18)(5) or int_ReadData1(19)(5) or
               int_ReadData1(20)(5) or int_ReadData1(21)(5) or int_ReadData1(22)(5) or int_ReadData1(23)(5) or
               int_ReadData1(24)(5) or int_ReadData1(25)(5) or int_ReadData1(26)(5) or int_ReadData1(27)(5) or
               int_ReadData1(28)(5) or int_ReadData1(29)(5) or int_ReadData1(30)(5) or int_ReadData1(31)(5);

			readData1(6) <= int_ReadData1(0)(6) or int_ReadData1(1)(6) or int_ReadData1(2)(6) or int_ReadData1(3)(6) or
               int_ReadData1(4)(6) or int_ReadData1(5)(6) or int_ReadData1(6)(6) or int_ReadData1(7)(6) or
               int_ReadData1(8)(6) or int_ReadData1(9)(6) or int_ReadData1(10)(6) or int_ReadData1(11)(6) or
               int_ReadData1(12)(6) or int_ReadData1(13)(6) or int_ReadData1(14)(6) or int_ReadData1(15)(6) or
               int_ReadData1(16)(6) or int_ReadData1(17)(6) or int_ReadData1(18)(6) or int_ReadData1(19)(6) or
               int_ReadData1(20)(6) or int_ReadData1(21)(6) or int_ReadData1(22)(6) or int_ReadData1(23)(6) or
               int_ReadData1(24)(6) or int_ReadData1(25)(6) or int_ReadData1(26)(6) or int_ReadData1(27)(6) or
               int_ReadData1(28)(6) or int_ReadData1(29)(6) or int_ReadData1(30)(6) or int_ReadData1(31)(6);

			readData1(7) <= int_ReadData1(0)(7) or int_ReadData1(1)(7) or int_ReadData1(2)(7) or int_ReadData1(3)(7) or
               int_ReadData1(4)(7) or int_ReadData1(5)(7) or int_ReadData1(6)(7) or int_ReadData1(7)(7) or
               int_ReadData1(8)(7) or int_ReadData1(9)(7) or int_ReadData1(10)(7) or int_ReadData1(11)(7) or
               int_ReadData1(12)(7) or int_ReadData1(13)(7) or int_ReadData1(14)(7) or int_ReadData1(15)(7) or
               int_ReadData1(16)(7) or int_ReadData1(17)(7) or int_ReadData1(18)(7) or int_ReadData1(19)(7) or
               int_ReadData1(20)(7) or int_ReadData1(21)(7) or int_ReadData1(22)(7) or int_ReadData1(23)(7) or
               int_ReadData1(24)(7) or int_ReadData1(25)(7) or int_ReadData1(26)(7) or int_ReadData1(27)(7) or
               int_ReadData1(28)(7) or int_ReadData1(29)(7) or int_ReadData1(30)(7) or int_ReadData1(31)(7);
					
			readData2(0) <= int_readData2(0)(0) or int_readData2(1)(0) or int_readData2(2)(0) or int_readData2(3)(0) or
               int_readData2(4)(0) or int_readData2(5)(0) or int_readData2(6)(0) or int_readData2(7)(0) or
               int_readData2(8)(0) or int_readData2(9)(0) or int_readData2(10)(0) or int_readData2(11)(0) or
               int_readData2(12)(0) or int_readData2(13)(0) or int_readData2(14)(0) or int_readData2(15)(0) or
               int_readData2(16)(0) or int_readData2(17)(0) or int_readData2(18)(0) or int_readData2(19)(0) or
               int_readData2(20)(0) or int_readData2(21)(0) or int_readData2(22)(0) or int_readData2(23)(0) or
               int_readData2(24)(0) or int_readData2(25)(0) or int_readData2(26)(0) or int_readData2(27)(0) or
               int_readData2(28)(0) or int_readData2(29)(0) or int_readData2(30)(0) or int_readData2(31)(0);

			readData2(1) <= int_readData2(0)(1) or int_readData2(1)(1) or int_readData2(2)(1) or int_readData2(3)(1) or
               int_readData2(4)(1) or int_readData2(5)(1) or int_readData2(6)(1) or int_readData2(7)(1) or
               int_readData2(8)(1) or int_readData2(9)(1) or int_readData2(10)(1) or int_readData2(11)(1) or
               int_readData2(12)(1) or int_readData2(13)(1) or int_readData2(14)(1) or int_readData2(15)(1) or
               int_readData2(16)(1) or int_readData2(17)(1) or int_readData2(18)(1) or int_readData2(19)(1) or
               int_readData2(20)(1) or int_readData2(21)(1) or int_readData2(22)(1) or int_readData2(23)(1) or
               int_readData2(24)(1) or int_readData2(25)(1) or int_readData2(26)(1) or int_readData2(27)(1) or
               int_readData2(28)(1) or int_readData2(29)(1) or int_readData2(30)(1) or int_readData2(31)(1);
					
			readData2(2) <= int_readData2(0)(2) or int_readData2(1)(2) or int_readData2(2)(2) or int_readData2(3)(2) or
               int_readData2(4)(2) or int_readData2(5)(2) or int_readData2(6)(2) or int_readData2(7)(2) or
               int_readData2(8)(2) or int_readData2(9)(2) or int_readData2(10)(2) or int_readData2(11)(2) or
               int_readData2(12)(2) or int_readData2(13)(2) or int_readData2(14)(2) or int_readData2(15)(2) or
               int_readData2(16)(2) or int_readData2(17)(2) or int_readData2(18)(2) or int_readData2(19)(2) or
               int_readData2(20)(2) or int_readData2(21)(2) or int_readData2(22)(2) or int_readData2(23)(2) or
               int_readData2(24)(2) or int_readData2(25)(2) or int_readData2(26)(2) or int_readData2(27)(2) or
               int_readData2(28)(2) or int_readData2(29)(2) or int_readData2(30)(2) or int_readData2(31)(2);

			readData2(3) <= int_readData2(0)(3) or int_readData2(1)(3) or int_readData2(2)(3) or int_readData2(3)(3) or
               int_readData2(4)(3) or int_readData2(5)(3) or int_readData2(6)(3) or int_readData2(7)(3) or
               int_readData2(8)(3) or int_readData2(9)(3) or int_readData2(10)(3) or int_readData2(11)(3) or
               int_readData2(12)(3) or int_readData2(13)(3) or int_readData2(14)(3) or int_readData2(15)(3) or
               int_readData2(16)(3) or int_readData2(17)(3) or int_readData2(18)(3) or int_readData2(19)(3) or
               int_readData2(20)(3) or int_readData2(21)(3) or int_readData2(22)(3) or int_readData2(23)(3) or
               int_readData2(24)(3) or int_readData2(25)(3) or int_readData2(26)(3) or int_readData2(27)(3) or
               int_readData2(28)(3) or int_readData2(29)(3) or int_readData2(30)(3) or int_readData2(31)(3);

			readData2(4) <= int_readData2(0)(4) or int_readData2(1)(4) or int_readData2(2)(4) or int_readData2(3)(4) or
               int_readData2(4)(4) or int_readData2(5)(4) or int_readData2(6)(4) or int_readData2(7)(4) or
               int_readData2(8)(4) or int_readData2(9)(4) or int_readData2(10)(4) or int_readData2(11)(4) or
               int_readData2(12)(4) or int_readData2(13)(4) or int_readData2(14)(4) or int_readData2(15)(4) or
               int_readData2(16)(4) or int_readData2(17)(4) or int_readData2(18)(4) or int_readData2(19)(4) or
               int_readData2(20)(4) or int_readData2(21)(4) or int_readData2(22)(4) or int_readData2(23)(4) or
               int_readData2(24)(4) or int_readData2(25)(4) or int_readData2(26)(4) or int_readData2(27)(4) or
               int_readData2(28)(4) or int_readData2(29)(4) or int_readData2(30)(4) or int_readData2(31)(4);

			readData2(5) <= int_readData2(0)(5) or int_readData2(1)(5) or int_readData2(2)(5) or int_readData2(3)(5) or
               int_readData2(4)(5) or int_readData2(5)(5) or int_readData2(6)(5) or int_readData2(7)(5) or
               int_readData2(8)(5) or int_readData2(9)(5) or int_readData2(10)(5) or int_readData2(11)(5) or
               int_readData2(12)(5) or int_readData2(13)(5) or int_readData2(14)(5) or int_readData2(15)(5) or
               int_readData2(16)(5) or int_readData2(17)(5) or int_readData2(18)(5) or int_readData2(19)(5) or
               int_readData2(20)(5) or int_readData2(21)(5) or int_readData2(22)(5) or int_readData2(23)(5) or
               int_readData2(24)(5) or int_readData2(25)(5) or int_readData2(26)(5) or int_readData2(27)(5) or
               int_readData2(28)(5) or int_readData2(29)(5) or int_readData2(30)(5) or int_readData2(31)(5);

			readData2(6) <= int_readData2(0)(6) or int_readData2(1)(6) or int_readData2(2)(6) or int_readData2(3)(6) or
               int_readData2(4)(6) or int_readData2(5)(6) or int_readData2(6)(6) or int_readData2(7)(6) or
               int_readData2(8)(6) or int_readData2(9)(6) or int_readData2(10)(6) or int_readData2(11)(6) or
               int_readData2(12)(6) or int_readData2(13)(6) or int_readData2(14)(6) or int_readData2(15)(6) or
               int_readData2(16)(6) or int_readData2(17)(6) or int_readData2(18)(6) or int_readData2(19)(6) or
               int_readData2(20)(6) or int_readData2(21)(6) or int_readData2(22)(6) or int_readData2(23)(6) or
               int_readData2(24)(6) or int_readData2(25)(6) or int_readData2(26)(6) or int_readData2(27)(6) or
               int_readData2(28)(6) or int_readData2(29)(6) or int_readData2(30)(6) or int_readData2(31)(6);

			readData2(7) <= int_readData2(0)(7) or int_readData2(1)(7) or int_readData2(2)(7) or int_readData2(3)(7) or
               int_readData2(4)(7) or int_readData2(5)(7) or int_readData2(6)(7) or int_readData2(7)(7) or
               int_readData2(8)(7) or int_readData2(9)(7) or int_readData2(10)(7) or int_readData2(11)(7) or
               int_readData2(12)(7) or int_readData2(13)(7) or int_readData2(14)(7) or int_readData2(15)(7) or
               int_readData2(16)(7) or int_readData2(17)(7) or int_readData2(18)(7) or int_readData2(19)(7) or
               int_readData2(20)(7) or int_readData2(21)(7) or int_readData2(22)(7) or int_readData2(23)(7) or
               int_readData2(24)(7) or int_readData2(25)(7) or int_readData2(26)(7) or int_readData2(27)(7) or
               int_readData2(28)(7) or int_readData2(29)(7) or int_readData2(30)(7) or int_readData2(31)(7);
    
end rtl;