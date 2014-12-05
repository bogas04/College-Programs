entity ArithmeticHelper_test is
end entity;

architecture ArithmeticHelper_test_arch of ArithmeticHelper_test is
  component ArithmeticHelper is
    port(
      ac,br : in  bit_vector(4 downto 0);
      q0,qn1 : in bit;
      new_ac : out bit_vector(4 downto 0) 
    );
  end component;
  signal testA,testB,testNewA : bit_vector(4 downto 0);
  signal testQ0,testQn1 : bit;
  begin
    AH : ArithmeticHelper port map(testA,testB,testQ0,testQn1,testNewA);
    process
      begin
        testA <= "00100";
        testB <= "00010";
        testQ0 <= '0';
        testQn1 <= '0';
        wait for 50 ns;
        testQ0 <= '0';
        testQn1 <= '1';
        wait for 50 ns;
        testQ0 <= '1';
        testQn1 <= '0';
        wait for 50 ns;
        testQ0 <= '1';
        testQn1 <= '1';
        wait for 50 ns;
    end process;
end architecture;

