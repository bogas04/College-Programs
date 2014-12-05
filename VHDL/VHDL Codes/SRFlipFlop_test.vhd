entity SRFlipFlop_test is
end entity;

architecture SRFlipFlop_test_arch of SRFlipFlop_test is 
  component SRFlipFlop is
    port (
      s, r, clk, reset : in bit;
      q, notQ : out bit
    );
  end component;
  signal testS, testR, testCLK, testReset, testQ, testQnot : bit;
  begin
    flipFlop: SRFlipFlop port map (testS, testR, testCLK, testReset, testQ, testQnot);
    
    -- Clock Generation
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
        testS <= '0';
        testR <= '0';
        wait for 50 ns;
        testS <= '0';
        testR <= '1';
        wait for 50 ns;
        testS <= '1';
        testR <= '0';
        wait for 50 ns;
        testReset <= '1';
        wait for 50 ns;
        testReset <= '0';
        wait for 50 ns;
        testS <= '1';
        testR <= '1';
        wait for 150 ns;
    end process;
end architecture;



