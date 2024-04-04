library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AllZero32 is
    port(
        input_vector : in std_logic_vector(31 downto 0);
        all_zero : out std_logic
    );
end AllZero32;

architecture rtl of AllZero32 is

begin

      all_zero <= not (input_vector (31) or input_vector (30) or input_vector (29) or input_vector (28) or input_vector (27) or input_vector (26) or input_vector (25) or input_vector (24) or 
			input_vector (23) or input_vector (22) or input_vector (21) or input_vector (20) or input_vector (19) or input_vector (18) or input_vector (17) or input_vector (16) or
			input_vector (15) or input_vector (14) or input_vector (13) or input_vector (12) or input_vector (11) or input_vector (10) or input_vector (9) or input_vector (8) or
			input_vector (7) or input_vector (6) or input_vector (5) or input_vector (4) or input_vector (3) or input_vector (2) or input_vector (1) or input_vector (0)); 
			
end rtl;
