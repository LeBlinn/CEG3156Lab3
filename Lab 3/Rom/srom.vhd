library ieee;
use ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

library lpm;
use lpm.lpm_components.all;

entity srom is
	port(
		address: in std_logic_vector(7 downto 0);
		clk: in std_logic;
		
		q: out std_logic_vector(31 downto 0)
	);
end entity srom;

architecture rtl of srom is

	component LPM_ROM
        generic (LPM_WIDTH : natural;    -- MUST be greater than 0
                 LPM_WIDTHAD : natural;    -- MUST be greater than 0
                                 LPM_NUMWORDS : natural := 0;
                                 LPM_ADDRESS_CONTROL : string := "REGISTERED";
                                 LPM_OUTDATA : string := "REGISTERED";
                                 LPM_FILE : string;
                                 LPM_TYPE : string := L_ROM;
                                 INTENDED_DEVICE_FAMILY  : string := "UNUSED";
                                 LPM_HINT : string := "UNUSED");
                 port (ADDRESS : in STD_LOGIC_VECTOR(LPM_WIDTHAD-1 downto 0);
                           INCLOCK : in STD_LOGIC := '0';
                           OUTCLOCK : in STD_LOGIC := '0';
                           MEMENAB : in STD_LOGIC := '1';
                           Q : out STD_LOGIC_VECTOR(LPM_WIDTH-1 downto 0));
	end component;

begin

	rom0: LPM_ROM
	generic map(
		LPM_WIDTH => 32,
		LPM_WIDTHAD => 8,
		LPM_ADDRESS_CONTROL => "UNREGISTERED",
		LPM_FILE => "rom.mif"
	)
	port map(
		ADDRESS => address,
		OUTCLOCK => clk,
		Q => q
	);

end rtl;