entity BoothMult5bit is
  port(
    a,b : in  bit_vector(4 downto 0);
    c   : out bit_vector(9 downto 0)
  );
end entity;

architecture BoothMult5bit_arch of BoothMult5bit is
  component ArithmeticHelper is
    port(
      ac,br : in  bit_vector(4 downto 0);
      q0,qn1 : in bit;
      new_ac : out bit_vector(4 downto 0) 
    );
  end component;
  component ashr11bit is
    port (
      x : in bit_vector(10 downto 0);
      y : out bit_vector(10 downto 0)
    );
  end component;
  type array5bit is array(0 to 4) of bit_vector(4 downto 0);
  type array11bit is array(0 to 10) of bit_vector(10 downto 0);
  signal ta,tq,tnew_a : array5bit;
  signal tqn1 : bit_vector(0 to 4);
  signal tsh : array11bit;
  begin
    tq(0) <= a;
    ta(0) <= (others => '0');
    tqn1(0) <= '0';
    
    MAP_GEN: for I in 0 to 4 generate 
      AH : ArithmeticHelper port map(ta(I),b,tq(I)(0),tqn1(I),tnew_a(I));
      SH : ashr11bit port map(tsh(2*I),tsh((2*I)+1));
      tsh(2*I) <= tnew_a(I) & tq(I) & tqn1(I);
    end generate MAP_GEN;
    
    INTERNAL_GEN: for I in 1 to 4 generate 
      tq(I) <= tsh(2*I - 1)(5 downto 1);
      ta(I) <= tsh(2*I - 1)(10 downto 6);
      tqn1(I) <= tsh(2*I - 1)(0);
    end generate INTERNAL_GEN;
  
    c <= tsh(9)(10 downto 1);
end architecture;
