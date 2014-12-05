library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity fa16bit_std_logic is
  port(
    xin,yin : in std_logic_vector(15 downto 0);
    carryin : in std_logic;
    sout : out std_logic_vector(15 downto 0);
    carryout : out std_logic
  );
end entity;
architecture fa16bit_std_logic_arch of fa16bit_std_logic is 
  signal temp_result : std_logic_vector(16 downto 0);
  begin
    temp_result <= '0'&xin + yin + carryin;
    sout <= temp_result(15 downto 0);
    carryout <= temp_result(16);
  end fa16bit_std_logic_arch;