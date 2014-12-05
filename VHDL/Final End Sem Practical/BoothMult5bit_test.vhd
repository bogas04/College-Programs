entity BoothMult5bit_test is
end entity;

architecture BoothMult5bit_test_arch of BoothMult5bit_test is
  component BoothMult5bit is
    port(
      a,b : in  bit_vector(4 downto 0);
      c   : out bit_vector(9 downto 0)
    );
  end component;
  signal testA,testB : bit_vector(4 downto 0);
  signal testC : bit_vector(9 downto 0);
  begin
    BM : BoothMult5bit port map(testA,testB,testC);
    process 
      begin
        testA <= "00010"; -- 2
        testB <= "00101"; -- 5
        -- 10
        wait for 50 ns;
        testA <= "00011"; -- 3
        -- 15
        wait for 50 ns;
        testB <= "01000"; -- 8
        -- 24
        wait for 50 ns;
        testA <= "11101"; -- -3
        -- -24
        wait for  50 ns;
        testA <= "11101"; -- -3
        testB <= "11011"; -- -5
        -- 15
        wait for 50 ns;
    end process;
end architecture;

