entity orCKT is 
    port (x,y : in bit;
            z : out bit
    );
end entity;
architecture orCKT_arch of orCKT is 
  begin
    z <= x or y;
  end orCKT_arch;


