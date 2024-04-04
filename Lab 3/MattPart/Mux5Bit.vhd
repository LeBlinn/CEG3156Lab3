LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity Mux5Bit is
	port(i_sel : in STD_LOGIC;
	     in0, in1 : in STD_LOGIC_VECTOR(4 downto 0);
			o_c : out STD_LOGIC_VECTOR(4 downto 0));
end entity Mux5Bit;

--if sel is active get a, otherwise b
architecture struct of Mux5Bit is

  signal out_c : STD_LOGIC_VECTOR(4 downto 0);
  
  COMPONENT TwoOneMultiplex
    port(
      sel : in STD_LOGIC;
      in1, in0 : in STD_LOGIC;
      muxOut : out STD_LOGIC);
  END COMPONENT;
  
	begin
	nMux: for i in 0 to 4 generate
    Mux5Bit_K: TwoOneMultiplex
      port map(
        in0 => in0(i),
        in1 => in1(i),
        sel => i_sel,
        muxOut => out_c(i)
      );
  end generate nMux;

	o_c <= out_c;

end architecture struct;
