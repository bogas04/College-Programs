library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fa4bit_std_logic_test is end entity;
architecture fa4bit_std_logic_test_arch of fa4bit_std_logic_test is 
  component fa4bit_std_logic is
    port(
      xin,yin : in std_logic_vector(3 downto 0);
      carryin : in std_logic;
      sout : out std_logic_vector(3 downto 0);
      carryout : out std_logic
    );
  end component;
  signal test_x,test_y,test_sum : std_logic_vector(3 downto 0);
  signal test_cin,test_cout : std_logic;
  begin
    inst0: fa4bit_std_logic port map(test_x,test_y,test_cin,test_sum,test_cout);
    process
      begin
        test_x <= "0101";
        test_y <= "1010";
        test_cin <= '0';
        wait for 50 ns;
        test_y <= "0101";
        wait for 50 ns;      
    end process;
end fa4bit_std_logic_test_arch;

