entity fa8bit_nogen is
  port(    
    xin,yin : in bit_vector(7 downto 0);
    c_in : in bit;
    sum_out : out bit_vector(7 downto 0);      
    c_out : out bit
  );
end entity;

architecture fa8bit_nogen_arch of fa8bit_nogen is
  component fa1bit is
    port(
      x,y,cin : in bit;
      sum,cout : out bit
    );
  end component;
  signal carry : bit_vector(8 downto 0);
  begin
    
    carry(0) <= '0';
    INST0: fa1bit port map(xin(0),yin(0),carry(0),sum_out(0),carry(1));
    INST1: fa1bit port map(xin(1),yin(1),carry(1),sum_out(1),carry(2));
    INST2: fa1bit port map(xin(2),yin(2),carry(2),sum_out(2),carry(3));
    INST3: fa1bit port map(xin(3),yin(3),carry(3),sum_out(3),carry(4));
    INST4: fa1bit port map(xin(4),yin(4),carry(4),sum_out(4),carry(5));
    INST5: fa1bit port map(xin(5),yin(5),carry(5),sum_out(5),carry(6));
    INST6: fa1bit port map(xin(6),yin(6),carry(6),sum_out(6),carry(7));
    INST7: fa1bit port map(xin(7),yin(7),carry(7),sum_out(7),carry(8));
    c_out <= carry(8);
    
end fa8bit_nogen_arch;
