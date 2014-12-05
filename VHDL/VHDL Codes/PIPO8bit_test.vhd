entity PIPO8bit_test is 
end entity;

architecture PIPO8bit_test_arch of PIPO8bit_test is
  component PIPO8bit is 
    port (
      clk, clear : in bit;
      data_in : in bit_vector (7 downto 0);
      data_out : out bit_vector (7 downto 0)
    );
  end component;
  signal testCLK, testCLR : bit;
  signal testIn, testOut : bit_vector(7 downto 0);
  begin
    REG : PIPO8bit port map (testCLK, testCLR, testIn, testOut);
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
        testIn <= "11000011";
        wait for 50 ns;
        testIn <= "11110000";
        wait for 50 ns;
        testCLR <= '1';
        wait for 50 ns;
        testCLR <= '0';
        testIn <= "01010101";
        wait for 50 ns;
        
    end process;
end architecture;
