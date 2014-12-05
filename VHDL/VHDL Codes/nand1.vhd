entity nand1 is
  port (
    x , y : in bit;
    z : out bit
  );
end entity;

architecture nand1_arch of nand1 is 
  begin
    z <= x nand y;
end architecture;