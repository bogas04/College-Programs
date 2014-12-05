library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity bcdAdder is
  port(
    x_input,y_input : in std_logic_vector(3 downto 0);
    sum_out : out std_logic_vector(3 downto 0);
    c_out : out std_logic
  );
end entity;

architecture bcdAdder_arch of bcdAdder is
  component fa4bit_std_logic is
    port(
      xin,yin : in std_logic_vector(3 downto 0);
      carryin : in std_logic;
      sout : out std_logic_vector(3 downto 0);
      carryout : out std_logic
    );
  end component;
  signal x,unused_cout : std_logic;
  signal temp : std_logic_vector(4 downto 0);
  signal zero110 : std_logic_vector(3 downto 0);
  begin
    -- First Adder
    inst0 : fa4bit_std_logic port map (x_input,y_input,'0',temp(3 downto 0),temp(4));
    
    -- If x is one , the sum exceeds 9, so we add 0110, else 000
    x <= temp(4) or (temp(3) and (temp(2) or temp(1)));
    
    -- zero110 holds the right value , ie 0110 or 0000 accordingly
    zero110 <= '0'& x & x &'0';
    
    -- Last Adder (adds 0000 or 0110)
    inst1 : fa4bit_std_logic port map (temp(3 downto 0),zero110,'0',sum_out,unused_cout);
    c_out <= x;
end bcdAdder_arch;