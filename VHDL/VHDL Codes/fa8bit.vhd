entity fa8bit is
  port(    
    xin,yin : in bit_vector(7 downto 0);
    c_in : in bit;
    sum_out : out bit_vector(7 downto 0);      
    c_out : out bit
  );
end entity;

architecture fa8bit_arch of fa8bit is
  component fa1bit is
    port(
      x,y,cin : in bit;
      sum,cout : out bit
    );
  end component;
  signal carry : bit_vector(8 downto 0);
  begin
    carry(0) <= '0';
    SUM_GEN :
      for I in 0 to 7 generate 
        INST: fa1bit port map(xin(I),yin(I),carry(I),sum_out(I),carry(I+1));
    end generate SUM_GEN;
    c_out <= carry(8);
end fa8bit_arch;