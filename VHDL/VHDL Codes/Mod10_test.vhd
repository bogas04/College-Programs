entity Mod10_test is 
end entity;

architecture Mod10_test_test of Mod10_test is
  component Mod10 is
    port (
      up, clk : in bit;
      output : inout bit_vector (3 downto 0)
    );
  end component;
  signal testUp, testCLK : bit;
  signal testOutput : bit_vector (3 downto 0);
  begin
    COUNTER : Mod10 port map(testUp, testCLK, testOutput);
    testUp <= '1';
    process 
      begin
        for i in 0 to 20 loop
          testCLK <= '0';
          wait for 20 ns;
          testCLK <= '1';
          wait for 20 ns;
        end loop;
    end process;
end architecture; 
