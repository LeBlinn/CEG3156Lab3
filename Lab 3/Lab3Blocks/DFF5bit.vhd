LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

Entity DFF5bit is 
	Port (RST, CLK, ENB : in std_logic;
			D : in std_logic_vector(4 downto 0);
			Q : out std_logic_vector(4 downto 0));
END DFF5bit;

Architecture STR of DFF5bit is

Component enARdFF_2 IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END Component;
Begin

DFF0 : enardFF_2
	Port Map (i_resetBar => RST,
				i_d => D(0),
				i_enable => ENB,
				i_clock => CLK,
				o_q => Q(0));
DFF1 : enardFF_2
	Port Map (i_resetBar => RST,
				i_d => D(1),
				i_enable => ENB,
				i_clock => CLK,
				o_q => Q(1));
DFF2 : enardFF_2
	Port Map (i_resetBar => RST,
				i_d => D(2),
				i_enable => ENB,
				i_clock => CLK,
				o_q => Q(2));
				
DFF3 : enardFF_2
	Port Map (i_resetBar => RST,
				i_d => D(3),
				i_enable => ENB,
				i_clock => CLK,
				o_q => Q(3));
				
DFF4 : enardFF_2
	Port Map (i_resetBar => RST,
				i_d => D(4),
				i_enable => ENB,
				i_clock => CLK,
				o_q => Q(4));


End;