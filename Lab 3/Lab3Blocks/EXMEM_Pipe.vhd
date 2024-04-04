library IEEE;
use ieee.std_logic_1164.ALL;

entity EXMEM_Pipe is
    port(

        
        --control signals
        WB_RegWrite_In, WB_MemtoReg_In: in std_logic;
        M_Branch_In, M_MemRead_In, M_MemWrite_In: in std_logic;
        Zero_In: in std_logic;

        WB_RegWrite_Out, WB_MemtoReg_Out: out std_logic;
        M_Branch_Out, M_MemRead_Out, M_MemWrite_Out: out std_logic;
        Zero_Out: out std_logic;

        --data signals
      --  BranchALUResult_In: in std_logic_vector(7 downto 0);
        ALUResult_In: in std_logic_vector(7 downto 0);
        RegRtData_In: in std_logic_vector(7 downto 0); --read data 2
        RegDst_In: in std_logic_vector(4 downto 0); --write register location

       -- BranchALUResult_Out: out std_logic_vector(7 downto 0);
        ALUResult_Out: out std_logic_vector(7 downto 0);
        RegRtData_Out: out std_logic_vector(7 downto 0); --read data 2
        RegDst_Out: out std_logic_vector(4 downto 0); --write register location
		  
		  clock, reset: in std_logic
        );
end EXMEM_Pipe;

architecture rtl of EXMEM_Pipe is

    component eightBitRegister
    port(
        i_load: in STD_LOGIC_VECTOR(7 downto 0);
        i_reset: in std_logic;
        i_clock: in std_logic;
		i_enable: in std_logic;
		
        o: out STD_LOGIC_VECTOR(7 downto 0)
    );
    end component;

    component DFlipFlopASR
    port(
        i_set: in std_logic;
        i_d: in std_logic;
		i_enable: in std_logic;
        i_clock: in std_logic;
        i_clear: in std_logic;

        o_q: out std_logic;
        o_qBar: out std_logic
    );
    end component;

    signal enable: std_logic;
	 
	 signal RegRtDataTemp: std_logic_vector(7 downto 0);
	 signal RegDstTemp: std_logic_vector(7 downto 0);

begin

    enable <= '1';
	 
	 RegRtData_Out <= RegRtDataTemp;
	 RegDst_Out <= RegDstTemp(4 downto 0);

    --control signals
    WB_RegWrite: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => WB_RegWrite_In,
        i_enable => enable,
        i_clock => clock,
        i_clear => reset,

        o_q => WB_RegWrite_Out
    );

    WB_MemtoReg: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => WB_MemtoReg_In,
        i_enable => enable,
        i_clock => clock,
        i_clear => reset,

        o_q => WB_MemtoReg_Out
    );

    M_Branch: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => M_Branch_In,
        i_enable => enable,
        i_clock => clock,
        i_clear => reset,

        o_q => M_Branch_Out
    );

    M_MemRead: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => M_MemRead_In,
        i_enable => enable,
        i_clock => clock,
        i_clear => reset,

        o_q => M_MemRead_Out
    );

    M_MemWrite: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => M_MemWrite_In,
        i_enable => enable,
        i_clock => clock,
        i_clear => reset,

        o_q => M_MemWrite_Out
    );

    Zero: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => Zero_In,
        i_enable => enable,
        i_clock => clock,
        i_clear => reset,

        o_q => Zero_Out
    );

    --data signals

--    BranchALUResult: eightBitRegister
--    port map(
--        i_load => BranchALUResult_In,
--        i_reset => reset,
--        i_clock => clock,
--        i_enable => enable,
--
--        o => BranchALUResult_Out
--    );

    ALUResult: eightBitRegister
    port map(
        i_load => ALUResult_In,
        i_reset => reset,
        i_clock => clock,
        i_enable => enable,

        o => ALUResult_out
    );

    RegRtData: eightBitRegister
    port map(
        i_load => RegRtData_In,
        i_reset => reset,
        i_clock => clock,
        i_enable => enable,

        o => RegRtDataTemp
    );

    RegDst: eightBitRegister
    port map(
        i_load => "000" & RegDst_In,
        i_reset => reset,
        i_clock => clock,
        i_enable => enable,

        o => RegDstTemp
    );


end rtl;