library IEEE;
use ieee.std_logic_1164.ALL;

entity ThirtyTwoBitCLA is
    port(
        A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        Cin: in std_logic;
        
        S: out std_logic_vector(31 downto 0);
        Cout: out std_logic
    );
end ThirtyTwoBitCLA;

architecture rtl of ThirtyTwoBitCLA is
    component fourBitCLA is
        port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            cin: in std_logic;
            
            s: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
    end component;

    signal carry: std_logic_vector(7 downto 0); 

begin
    
 CLA_0: fourBitCLA port map(
	  a => A(3 downto 0),
	  b => B(3 downto 0),
	  cin => Cin,
	  
	  s => S(3 downto 0),
	  cout => carry(0)
 );


 gen_cla_blocks: for i in 1 to 7 generate
 CLA: fourBitCLA port map(
	  a => A(i*4+3 downto i*4),
	  b => B(i*4+3 downto i*4),
	  cin => carry(i-1),
	  
	  s => S(i*4+3 downto i*4),
	  cout => carry(i)
 );
 end generate gen_cla_blocks;

 Cout <= carry(7); 
end rtl;
