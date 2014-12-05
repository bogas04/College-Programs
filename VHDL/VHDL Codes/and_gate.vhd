entity andCKT is 
  port (  
    x,y : in bit;
    z : out bit
  );
end entity;
architecture andCKT_arch of andCKT is 
  begin
    z <= x and y;
end andCKT_arch;
