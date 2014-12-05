entity bitOperators_test is 
end entity;

architecture bitOperators_test_arch of bitOperators_test is 
  component  bitOperators is
    port (
      input : in bit_vector (7 downto 0);
      sel : in bit_vector (1 downto 0);
      output : out bit_vector(7 downto 0)
    );
  end component;
  signal test_input,test_output : bit_vector(7 downto 0);
  signal test_sel : bit_vector(1 downto 0);
  begin
    -- 00 Left Shift
    -- 01 Right Shift
    -- 10 Right Rotate
    -- 11 Left Rotate 
    
    inst0: bitOperators port map(test_input,test_sel,test_output);
    process
      begin
        test_input <= "00110011";
        test_sel <= "00";
        wait for 50 ns;
        test_sel <= "01";
        wait for 50 ns;
        test_sel <= "10";
        wait for 50 ns;
        test_sel <= "11";
        wait for 50 ns;
    end process;
end bitOperators_test_arch;
