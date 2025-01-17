library ieee;
use ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

library lpm;
use lpm.lpm_components.all;

entity sram is
	port(
		data: in std_logic_vector(7 downto 0);
		address: in std_logic_vector(7 downto 0);
		
		wren: in std_logic;
		clk: in std_logic;
		
		q: out std_logic_vector(7 downto 0)
	);
end entity sram;

architecture rtl of sram is

	COMPONENT LPM_RAM_DP
   GENERIC ( 
		LPM_WIDTH: POSITIVE;
      LPM_WIDTHAD: POSITIVE;
      LPM_NUMWORDS: NATURAL := 0;
      LPM_INDATA: STRING := "REGISTERED";
      LPM_OUTDATA: STRING := "REGISTERED";
      LPM_RDADDRESS_CONTROL: STRING := "REGISTERED";
      LPM_WRADDRESS_CONTROL: STRING := "REGISTERED";
      LPM_FILE: STRING := "UNUSED";
      LPM_TYPE: STRING := "LPM_RAM_DP";
      LPM_HINT: STRING := "UNUSED");
   PORT ( 
		data: IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0); 
      rdaddress, wraddress: IN STD_LOGIC_VECTOR(LPM_WIDTHAD-1 DOWNTO 0);
      rdclock, wrclock: IN STD_LOGIC := '0';
      rden, rdclken, wrclken: IN STD_LOGIC := '1';
      wren: IN STD_LOGIC; 
      q: OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0));
END COMPONENT;

begin

	ram0: LPM_RAM_DP
	generic map(
		LPM_WIDTH => 8,
		LPM_WIDTHAD => 8,
		LPM_FILE => "ram.mif"
	)
	port map(
		data => data, --write data
		wraddress => address,
		rdaddress => address,
		wrclock => clk,
		rdclock => clk,
		wren => wren,
		q => q
	);

end rtl;