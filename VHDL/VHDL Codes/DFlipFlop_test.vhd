entity DFlipFlop_test is
end entity;

architecture DFlipFlop_test_arch of DFlipFlop_test is 
  component DFlipFlop is
    port (
      d, clk, reset, preset : in bit;
      q : out bit
    );
  end component;
  signal testD, testCLK, testReset, testPreset, testQ : bit;
  begin
    flipFlop: DFlipFlop port map (testD, testCLK, testReset, testPreset, testQ);
    
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
        testD <= '1';
        wait for 50 ns;
        testD <= '0';
        wait for 50 ns;
        testD <= '1';
        wait for 50 ns;        
        testD <= '1';
        wait for 50 ns;
        testD <= '0';
        testReset <= '1';
        wait for 50 ns;
        testReset <= '0';
        wait for 50 ns;
        testD <= '1';
        wait for 150 ns;
    end process;
end architecture;





