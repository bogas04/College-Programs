entity fsm_0101_test is
end entity;

architecture fsm_0101_test_arch of fsm_0101_test is
  component fsm_0101 is 
    port(
      x,reset,clk : in bit;
      z : out bit
    );
  end component;
  signal test_x ,test_z,test_reset,test_clk: bit;
  begin
    inst: fsm_0101 port map(test_x,test_reset,test_clk,test_z);
    process
      begin
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;
        test_clk <= '1'; wait for 25 ns;
        test_clk <= '0'; wait for 25 ns;                                        
    end process;
    process
      begin
        test_reset <= '1'; wait for 50 ns;
        test_x <= '0'; test_reset <= '0'; wait for 50 ns;
        test_x <= '1'; wait for 50 ns;
        test_x <= '1'; wait for 50 ns;
        test_x <= '0'; wait for 50 ns;
        test_x <= '1'; wait for 50 ns;
        test_x <= '0'; wait for 50 ns;
        test_x <= '1'; wait for 50 ns;
        test_x <= '0'; wait for 50 ns;
        test_x <= '1'; wait for 50 ns;
        test_x <= '1'; wait for 50 ns;
        test_x <= '1'; wait for 50 ns;
    end process;
end architecture;
