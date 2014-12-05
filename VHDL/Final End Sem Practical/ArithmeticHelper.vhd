entity ArithmeticHelper is
  port(
    ac,br : in  bit_vector(4 downto 0);
    q0,qn1 : in bit;
    new_ac : out bit_vector(4 downto 0) 
  );
end entity;

architecture ArithmeticHelper_arch of ArithmeticHelper is
  component mux4x1 is
    port(
      i1,i2,i3,i4,sel0,sel1 : in bit;
      i0 : out bit
    );
  end component;
  component fa1bit is 
    port (
      x,y,cin : in bit;
      sum,cout : out bit
    );
  end component;
  signal low: bit;
  signal c : bit_vector(5 downto 0);
  signal nbr,t : bit_vector(4 downto 0); 
  begin
    nbr <= not br;
    low <= '0';
    c(0) <= ((q0) and (not qn1));
    GEN : for I in 0 to 4 generate 
      MUX : mux4x1 port map(low,br(I),nbr(I),low,qn1,q0,t(I));
      FA  : fa1bit port map(t(I),ac(I),c(I),new_ac(I),c(I+1)); 
    end generate GEN;
    
end architecture;
