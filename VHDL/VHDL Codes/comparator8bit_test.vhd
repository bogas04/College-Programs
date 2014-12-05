entity comparator8bit_test is
end entity;

architecture comparator8bit_test_arch of comparator8bit_test is
  component comparator8bit is
    port (
      x_in,y_in: in bit_vector(7 downto 0);
      greater,lesser,equal : out bit
    );
  end component;
  signal test_x,test_y:bit_vector(7 downto 0);
  signal test_greater,test_lesser,test_equal : bit;
  begin
    inst0: comparator8bit port map(test_x,test_y,test_greater,
    test_lesser,test_equal);
  process
    begin
      test_x <= "01100000";
      test_y <= "10000000";
      wait for 50 ns;
      test_x <= "11100000";
      wait for 50 ns;
      test_y <= "11100000";
      wait for 50 ns;
  end process;
end comparator8bit_test_arch;

