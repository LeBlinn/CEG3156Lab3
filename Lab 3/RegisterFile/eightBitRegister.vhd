library IEEE;
use ieee.std_logic_1164.ALL;

entity eightBitRegister is
    port(
        i_load: in STD_LOGIC_VECTOR(7 downto 0);
        i_reset: in std_logic;
        i_clock: in std_logic;
		  i_enable: in std_logic;
		
        o: out STD_LOGIC_VECTOR(7 downto 0)
        );
end eightBitRegister;

architecture rtl of eightBitRegister is
    signal int_q: STD_LOGIC_VECTOR(7 downto 0);
    signal int_inBetween: STD_LOGIC_VECTOR(7 downto 0);
    signal int_qBar: STD_LOGIC_VECTOR(7 downto 0);
    signal int_enable: std_logic;
	 signal int_set: std_logic;
    signal int_load: std_logic;

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
begin

    dFlipFlop0: DFlipFlopASR
    port map(
        i_enable => int_enable,
        i_clear => i_reset,
		  i_set => int_set,
        i_clock => i_clock,
        i_d => int_inBetween(0),
        o_q => int_q(0),
        o_qBar => int_qBar(0)
    );

    dFlipFlop1: DFlipFlopASR
    port map(
        i_enable => int_enable,
        i_clear => i_reset,
		  i_set => int_set,
        i_clock => i_clock,
        i_d => int_inBetween(1),
        o_q => int_q(1),
        o_qBar => int_qBar(1)
    );

    dFlipFlop2: DFlipFlopASR
    port map(
        i_enable => int_enable,
        i_clear => i_reset,
		  i_set => int_set,
        i_clock => i_clock,
        i_d => int_inBetween(2),
        o_q => int_q(2),
        o_qBar => int_qBar(2)
    );

    dFlipFlop3: DFlipFlopASR
    port map(
        i_enable => int_enable,
        i_clear => i_reset,
		  i_set => int_set,
        i_clock => i_clock,
        i_d => int_inBetween(3),
        o_q => int_q(3),
        o_qBar => int_qBar(3)
    );

    dFlipFlop4: DFlipFlopASR
    port map(
        i_enable => int_enable,
        i_clear => i_reset,
		  i_set => int_set,
        i_clock => i_clock,
        i_d => int_inBetween(4),
        o_q => int_q(4),
        o_qBar => int_qBar(4)
    );

    dFlipFlop5: DFlipFlopASR
    port map(
        i_enable => int_enable,
        i_clear => i_reset,
		  i_set => int_set,
        i_clock => i_clock,
        i_d => int_inBetween(5),
        o_q => int_q(5),
        o_qBar => int_qBar(5)
    );

    dFlipFlop6: DFlipFlopASR
    port map(
        i_enable => int_enable,
        i_clear => i_reset,
		  i_set => int_set,
        i_clock => i_clock,
        i_d => int_inBetween(6),
        o_q => int_q(6),
        o_qBar => int_qBar(6)
    );

    dFlipFlop7: DFlipFlopASR
    port map(
        i_enable => int_enable,
        i_clear => i_reset,
		  i_set => int_set,
        i_clock => i_clock,
        i_d => int_inBetween(7),
        o_q => int_q(7),
        o_qBar => int_qBar(7)
    );

	 int_set <= '0';
    int_enable <= i_enable;
    int_inBetween(0) <= i_load(0);
    int_inBetween(1) <= i_load(1);
    int_inBetween(2) <= i_load(2);
    int_inBetween(3) <= i_load(3);
    int_inBetween(4) <= i_load(4);
    int_inBetween(5) <= i_load(5);
    int_inBetween(6) <= i_load(6);
    int_inBetween(7) <= i_load(7);

    o <= int_q;
    
end rtl;