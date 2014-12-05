entity nand2 is
  port (
    x , y : in bit;
    z : out bit
  );
end entity;

architecture nand2_arch of nand2 is 
  begin
    z <= x nand y after 2 ns;
end architecture;

