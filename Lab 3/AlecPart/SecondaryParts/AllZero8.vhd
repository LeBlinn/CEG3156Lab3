library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AllZero8 is
    port(
        input_vector : in std_logic_vector(7 downto 0);
        all_zero : out std_logic
    );
end AllZero8;

architecture rtl of AllZero8 is

begin

      all_zero <= not (input_vector (7) or input_vector (6) or input_vector (5) or input_vector (4) or input_vector (3) or input_vector (2) or input_vector (1) or input_vector (0)); 
			
end rtl;
