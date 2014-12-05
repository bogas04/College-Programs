entity GrayCodeCounter_test is 
end entity;

architecture GrayCodeCounter_test_arch of GrayCodeCounter_test is
  component GrayCodeCounter is
    port (
      clk , reset : in bit;
      output : out bit_vector(2 downto 0)
    );
  end component;
  signal testCLK, testRESET : bit;
  signal testOutput : bit_vector(2 downto 0);
  begin
    GCC : GrayCodeCounter port map(testCLK, testRESET, testOutput);
      
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
        wait for 250 ns;
        testRESET <= '1';
        wait for 50 ns;
        testRESET <= '0';
        wait for 150 ns;
    end process;
end architecture;
