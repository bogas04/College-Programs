entity TFlipFlop_test is
end entity;

architecture TFlipFlop_test_arch of TFlipFlop_test is 
  component TFlipFlop is
    port (
      t, clk, reset : in bit;
      q : inout bit
    );
  end component;
  signal testT, testCLK, testReset, testQ : bit;
  begin
    flipFlop: TFlipFlop port map (testT, testCLK, testReset, testQ);
    
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
        testT <= '1';
        wait for 50 ns;
        testT <= '0';
        wait for 50 ns;
        testT <= '1';
        wait for 50 ns;        
        testT <= '1';
        wait for 50 ns;
        testT <= '0';
        testReset <= '1';
        wait for 50 ns;
        testReset <= '0';
        wait for 50 ns;
        testT <= '1';
        wait for 150 ns;
    end process;
end architecture;




