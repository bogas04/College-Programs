entity mux2x1 is
  port(x,y,s : in bit;
  z : out bit);
  end entity;

architecture mux2x1_arch of mux2x1 is
  begin
    z <= x when s = '0' else
    y when s = '1';
  end mux2x1_arch;
  