library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcdAdder_test is end entity;

architecture bcdAdder_test_arch of bcdAdder_test is
  component bcdAdder is
    port(
      x_input,y_input : in std_logic_vector(3 downto 0);
      sum_out : out std_logic_vector(3 downto 0);
      c_out : out std_logic
    );
  end component;
  signal test_x,test_y,test_sum: std_logic_vector(3 downto 0);
  signal test_cout: std_logic;
  begin
    test0 : bcdAdder port map (test_x,test_y,test_sum,test_cout);
  
    process
      begin
        test_x <= "1001";
        test_y <= "0001";
        wait for 50 ns;
        test_x <= "0010";
        wait for 50 ns;
        test_x <= "1001";
        test_y <= "1001";
        wait for 50 ns;
    end process;  
end bcdAdder_test_arch;
