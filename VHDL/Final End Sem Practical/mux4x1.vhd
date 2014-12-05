entity mux4x1 is
  port(
   i1,i2,i3,i4,sel0,sel1 : in bit;
   i0 : out bit
  );
end entity;

architecture mux4x1_arch of mux4x1 is
begin
  i0 <= i1 when sel0 = '0' and sel1 = '0' else
  i2 when sel0 = '1' and sel1 = '0' else
  i3 when sel0 = '0' and sel1 = '1' else
  i4;
end architecture;

