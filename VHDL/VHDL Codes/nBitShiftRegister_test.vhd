entity nBitLeftShiftRegister_test is
end entity;

architecture nBitLeftShiftRegister_test_arch of nBitLeftShiftRegister_test is
  component nBitLeftShiftRegister is 
    generic (
      bits : integer := 16
    );
    port (
      enable, write, clk, reset : in bit;
      data : in bit_vector (bits - 1 downto 0);
      output : out bit_vector (bits - 1 downto 0)
    );
  end component; 
  signal testEnable, testWrite, testCLK, testReset : bit;
  signal testData, testOutput : bit_vector(15 downto 0);
  begin
    REG : nBitLeftShiftRegister port map (testEnable, testWrite, testCLK, testReset, testData, testOutput);
    process
      begin
        for i in 0 to 20 loop
          testCLK <= '0';
          wait for 20 ns;
          testCLK <= '1';
          wait for 20 ns;
        end loop;
    end process;
    
    process
      begin
        testWrite <= '1';
        testEnable <= '0';
        testData <= "1010001111110000";
        wait for 50 ns;
        testWrite <= '0';
        testEnable <= '1';
        wait for 200 ns;
        testEnable <= '0';
        testReset <= '1';
        wait for 50 ns;
        testReset <= '0';
        wait for 50 ns;
        testWrite <= '1';
        testEnable <= '0';
        testData <= "1111000011110000";
        wait for 50 ns;
        testWrite <= '0';
        testEnable <= '1';
        wait for 200 ns;
    end process; 
end architecture;
