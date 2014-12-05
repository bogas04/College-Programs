library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rom_16byte is
  generic (
    bits : integer := 8;
    words : integer := 16
  );
  port (
    addr : in integer range 0 to words - 1;
    dataout : out std_logic_vector(bits-1 downto 0)
  );
end entity;

architecture rom_16byte_arch of rom_16byte is
  type rom_array is array(0 to words - 1) of std_logic_vector(bits - 1 downto 0);
  constant memory : rom_array := ("10101010","00001111","00110011",
  "11001111","11111111","00000000","11100111","00111100",
  "11100010","01011111","11001100","10101010","00001111",
  "00110011","11001111","11101010");
  begin
    dataout <= memory(addr);
end architecture;
