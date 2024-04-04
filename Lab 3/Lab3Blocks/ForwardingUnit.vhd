library IEEE;
use ieee.std_logic_1164.ALL;

entity ForwardingUnit is
    port(
        --EX Hazard
        EXMEMRegWrite: in std_logic;
        EXMEMRegisterRd: in std_logic_vector(4 downto 0);
        IDEXRegisterRs: in std_logic_vector(4 downto 0);
        IDEXRegisterRt: in std_logic_vector(4 downto 0);
        --MEM Hazard
        MEMWBRegWrite: in std_logic;
        MEMWBRegisterRd: in std_logic_vector(4 downto 0);
        --outputs
        ForwardA: out std_logic_vector(1 downto 0);
        ForwardB: out std_logic_vector(1 downto 0)
        );
end ForwardingUnit;

architecture rtl of ForwardingUnit is
    
    signal EXMEMRegisterRdis0: std_logic;
    signal MEMWBRegisterRdis0: std_logic;

    signal EXMEMRegisterRdEqualIDEXRegisterRs: std_logic;
    signal EXMEMRegisterRdEqualIDEXRegisterRt: std_logic;

    signal MEMWBRegisterRdEqualIDEXRegisterRs: std_logic;
    signal MEMWBRegisterRdEqualIDEXRegisterRt: std_logic;

begin

    EXMEMRegisterRdis0 <=  not(EXMEMRegisterRd(4) or EXMEMRegisterRd(3) or EXMEMRegisterRd(2) or EXMEMRegisterRd(1) or EXMEMRegisterRd(0)); --if the register is r0, it will tell us.

    MEMWBRegisterRdis0 <=  not(MEMWBRegisterRd(4) or MEMWBRegisterRd(3) or MEMWBRegisterRd(2) or MEMWBRegisterRd(1) or MEMWBRegisterRd(0)); --if the register is r0, it will tell us.

    EXMEMRegisterRdEqualIDEXRegisterRs <= (EXMEMRegisterRd(4) and IDEXRegisterRs(4)) and (EXMEMRegisterRd(3) and IDEXRegisterRs(3)) and (EXMEMRegisterRd(2) and IDEXRegisterRs(2)) and (EXMEMRegisterRd(1) and IDEXRegisterRs(1)) and (EXMEMRegisterRd(0) and IDEXRegisterRs(0));

    EXMEMRegisterRdEqualIDEXRegisterRt <= (EXMEMRegisterRd(4) and IDEXRegisterRt(4)) and (EXMEMRegisterRd(3) and IDEXRegisterRt(3)) and (EXMEMRegisterRd(2) and IDEXRegisterRt(2)) and (EXMEMRegisterRd(1) and IDEXRegisterRt(1)) and (EXMEMRegisterRd(0) and IDEXRegisterRt(0));

    MEMWBRegisterRdEqualIDEXRegisterRs <= (MEMWBRegisterRd(4) and IDEXRegisterRs(4)) and (MEMWBRegisterRd(3) and IDEXRegisterRs(3)) and (MEMWBRegisterRd(2) and IDEXRegisterRs(2)) and (MEMWBRegisterRd(1) and IDEXRegisterRs(1)) and (MEMWBRegisterRd(0) and IDEXRegisterRs(0));

    MEMWBRegisterRdEqualIDEXRegisterRt <= (MEMWBRegisterRd(4) and IDEXRegisterRt(4)) and (MEMWBRegisterRd(3) and IDEXRegisterRt(3)) and (MEMWBRegisterRd(2) and IDEXRegisterRt(2)) and (MEMWBRegisterRd(1) and IDEXRegisterRt(1)) and (MEMWBRegisterRd(0) and IDEXRegisterRt(0));

    --EX Hazard
    ForwardA(1) <= (EXMEMRegWrite and not(EXMEMRegisterRdis0) and EXMEMRegisterRdEqualIDEXRegisterRs);

    ForwardB(1) <= (EXMEMRegWrite and not(EXMEMRegisterRdis0) and EXMEMRegisterRdEqualIDEXRegisterRt);

    --MEM Hazard
    ForwardA(0) <= (MEMWBRegWrite and not(MEMWBRegisterRdis0) and not(EXMEMRegWrite) and EXMEMRegisterRdis0 and not(EXMEMRegisterRdEqualIDEXRegisterRs) and MEMWBRegisterRdEqualIDEXRegisterRs);

    ForwardB(0) <= (MEMWBRegWrite and not(MEMWBRegisterRdis0) and not(EXMEMRegWrite) and EXMEMRegisterRdis0 and not(EXMEMRegisterRdEqualIDEXRegisterRt) and MEMWBRegisterRdEqualIDEXRegisterRt);

end rtl;