entity comparator1bit_test is
end entity;

architecture comparator1bit_test_arch of comparator1bit_test is
  component comparator1bit is
    port(
      x,y,prev_lt,prev_eq,prev_gt : in bit;
      lt,eq,gt : out bit
    );
  end component;
  signal test_x,test_y,test_prev_lt,test_prev_eq,
  test_prev_gt,test_lt,test_eq,test_gt : bit;
  begin
    inst0: comparator1bit port map(test_x,test_y,test_prev_lt,test_prev_eq,
  test_prev_gt,test_lt,test_eq,test_gt);
  process
    begin
      test_prev_lt <= '0';
      test_prev_eq <= '1';
      test_prev_gt <= '0';
      test_x <= '1';
      test_y <= '1';
      wait for 50 ns;
      test_x <= '0';
      wait for 50 ns;
      test_y <= '0';
      wait for 50 ns;
      test_x <= '1';
      wait for 50 ns;
      test_prev_eq <= '0';
      test_prev_lt <= '1';
      wait for 50 ns;
  end process;
end comparator1bit_test_arch;
