entity fa4bit is
  port(
    xin,yin : in bit_vector(3 downto 0);
    carry_in : in bit;
    sum_out : out bit_vector(3 downto 0);    
    carry_out : out bit
  );
end entity;

architecture fa4bit_arch of fa4bit is 
  component fa1bit is 
  port(
    x,y,cin : in bit;
    sum,cout : out bit
  );
  end component;
  signal temp_carry : bit_vector(2 downto 0);
  begin
    inst0 : fa1bit port map(
        xin(0),yin(0),carry_in,sum_out(0),temp_carry(0)
    );
    inst1 : fa1bit port map(
        xin(1),yin(1),temp_carry(0),sum_out(1),temp_carry(1)
    );
    ints2 : fa1bit port map(
        xin(2),yin(2),temp_carry(1),sum_out(2),temp_carry(2)
    );
    inst3 : fa1bit port map(
        xin(3),yin(3),temp_carry(2),sum_out(3),carry_out
    ); 
end fa4bit_arch;
