LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity MuxnBit is
  generic(
    n :integer := 4
);
	port(i_sel : in STD_LOGIC;
	     in0, in1 : in STD_LOGIC_VECTOR(n-1 downto 0);
			o_c : out STD_LOGIC_VECTOR(n-1 downto 0));
end entity MuxnBit;

--if sel is active get a, otherwise b
architecture struct of MuxnBit is

  signal out_c : STD_LOGIC_VECTOR(n-1 downto 0);
  
  COMPONENT TwoOneMultiplex
    port(
      sel : in STD_LOGIC;
      in1, in0 : in STD_LOGIC;
      muxOut : out STD_LOGIC);
  END COMPONENT;
  
	begin
	nMux: for i in 0 to n-1 generate
    MuxnBit_K: TwoOneMultiplex
      port map(
        in0 => in0(i),
        in1 => in1(i),
        sel => i_sel,
        muxOut => out_c(i)
      );
  end generate nMux;

	o_c <= out_c;

end architecture struct;