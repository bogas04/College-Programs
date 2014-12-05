library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ram_8K is
  generic (
    bits : integer := 8;
    words : integer := 1024 
  );
  port (
    addr : in integer range 0 to words - 1;
    data : inout std_logic_vector( bits -1 downto 0);
    clk, write_enable : in std_logic
  ); 
end entity;

architecture ram_8K_arch of ram_8K is
  type ram_array is array (0 to words - 1) of std_logic_vector(bits - 1 downto 0);
  signal memory : ram_array;
 
  begin
    memory <= (others => "00000000");
    process(clk, write_enable) 
      begin
        if(write_enable = '0') then
          data <= memory(addr);
        else
          data <= (others => 'Z');
          if(clk'event and clk = '1') then
            memory(addr) <= data;
          end if;
        end if;
    end process;  
end architecture;

