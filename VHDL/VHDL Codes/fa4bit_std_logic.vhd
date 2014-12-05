library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity fa4bit_std_logic is
  port(
    xin,yin : in std_logic_vector(3 downto 0);
    carryin : in std_logic;
    sout : out std_logic_vector(3 downto 0);
    carryout : out std_logic
  );
end entity;
architecture fa4bit_std_logic_arch of fa4bit_std_logic is 
  signal temp_result : std_logic_vector(4 downto 0);
  begin
    temp_result <= '0'&xin + yin + carryin;
    sout <= temp_result(3 downto 0);
    carryout <= temp_result(4);
end fa4bit_std_logic_arch;
