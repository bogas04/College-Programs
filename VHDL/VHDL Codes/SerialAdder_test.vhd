entity SerialAdder_test is
end entity;

architecture SerialAdder_test_arch of SerialAdder_test is 
  component SerialAdder is
    port ( 
      a, b, clk, reset : in bit;
      s, cout : out bit
    );
  end component;
  signal testA, testB, testCLK, testRESET, testS, testCout : bit;
  begin
    SA : SerialAdder port map (testA, testB, testCLK, testRESET, testS, testCout);

    -- Clock generation
    process
      begin
        for i in 0 to 20 loop
          testCLK <= '0';
          wait for 20 ns;
          testCLK <= '1';
          wait for 20 ns;
        end loop;
    end process;
    
    -- Inputs
    process 
      begin
        testRESET <= '1';
        wait for 50 ns;
        testRESET <= '0';
        wait for 50 ns;
        testA <= '1';
        testB <= '0';
        wait for 100 ns;
        testA <= '0';
        testB <= '1';
        wait for 100 ns;
        testA <= '1';
        testB <= '1';
        wait for 1  00 ns;
    end process;
end architecture;

