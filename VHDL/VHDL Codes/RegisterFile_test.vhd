entity RegisterFile_test is
end entity;

architecture RegisterFile_test_test of RegisterFile_test is 
  component RegisterFile is
    port (
      clk, rw, reset : in bit;                    -- rw = '1' - Write data in addrA
      data : in bit_vector(7 downto 0);           -- rw = '0' - Read addrA and addrB in portA and portB
      addrA, addrB : in integer range 0 to 15; -- 16 Registers in total
      portA, portB : out bit_vector (7 downto 0)  -- Each 8 bit wide
    );
  end component;
  signal testCLK, testRW, testRESET : bit;
  signal testData, testPortA, testPortB : bit_vector(7 downto 0);
  signal testAddrA, testAddrB : integer range 0 to 15;
  begin
  RF : RegisterFile port map(testCLK, testRW, testRESET, 
   testData, testAddrA, testAddrB, testPortA, testPortB);
  
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
      testRW <= '1';
      testData <= "01010101";
      testAddrA <= 2;
      testAddrB <= 3;
      wait for 50 ns;
      testData <= "11110000";
      testAddrA <= 5;
      testAddrB <= 2;
      wait for 50 ns;
      testData <= "00111100";
      testAddrA <= 8;
      testAddrB <= 5;
      wait for 50 ns;
      testRW <= '0';
      testAddrA <= 2;
      testAddrB <= 8;
      wait for 50 ns;
      testRESET <= '1';
      wait for 50 ns;
      testRESET <= '0';
      wait for 50 ns;
  end process;
end architecture;
