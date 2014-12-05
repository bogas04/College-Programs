entity comparator8bit is
  port (
    x_in,y_in: in bit_vector(7 downto 0);
    greater,lesser,equal : out bit
  );
end entity;

architecture comparator8bit_arch of comparator8bit is
  component comparator1bit is 
    port(
      x,y,prev_lt,prev_eq,prev_gt : in bit;
      lt,eq,gt : out bit
    );
  end component;
  signal temp_prev_lt,temp_prev_eq,temp_prev_gt : bit_vector(8 downto 0);
  begin
    temp_prev_lt(0) <= '0';
    temp_prev_gt(0) <= '0';
    temp_prev_eq(0) <= '1';
    
    GEN:
      for I in 0 to 7 generate 
        COMP: comparator1bit port map(
          x_in(7-I),
          y_in(7-I),
          temp_prev_lt(I),temp_prev_eq(I),temp_prev_gt(I),
          temp_prev_lt(I+1),temp_prev_eq(I+1),temp_prev_gt(I+1)
        );
    end generate GEN;
    greater <= temp_prev_gt(8);
    lesser <= temp_prev_lt(8);
    equal <= temp_prev_eq(8);
end comparator8bit_arch;