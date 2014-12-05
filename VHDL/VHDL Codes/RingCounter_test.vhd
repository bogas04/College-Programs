
entity RingCounter_test is 

end entity;

architecture RingCounter_test_arch of RingCounter_test is
  component RingCounter is 
    port (
      clk, clear, set : in bit;
      data : inout bit_vector (3 downto 0)
    );
  end component;
  signal testCLK, testCLR, testSET : bit;
  signal testData : bit_vector (3 downto 0);
  begin
    RC: RingCounter port map(testCLK, testCLR, testSET, testData);
      
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
        testSET <= '1';
        wait for 50 ns;
        testSET <= '0';
        wait for 200 ns;
        testCLR <= '1';
        wait for 50 ns;
        testCLR <= '0';
        wait for 200 ns;
    end process;
end architecture;


