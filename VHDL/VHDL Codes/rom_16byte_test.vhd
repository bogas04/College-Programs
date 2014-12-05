library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rom_16byte_test is
end entity;

architecture rom_16byte_test_arch of rom_16byte_test is
  component rom_16byte is 
    generic (
      bits : integer := 8;
      words : integer := 16
    );
    port (
      addr : in integer range 0 to words - 1;
      dataout : out std_logic_vector(bits-1 downto 0)
    );
  end component;
  signal test_out : std_logic_vector(7 downto 0);
  signal test_addr : integer range 0 to 15;
  begin
      inst : rom_16byte port map(test_addr,test_out);
      process 
        begin
          test_addr <= 4;
          wait for 20 ns;
          test_addr <= 6;
          wait for 20 ns;
          test_addr <= 1;
          wait for 20 ns;
        end process;
end architecture;
