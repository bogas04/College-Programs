entity mux16x1_test is 
end entity;
architecture mux16x1_test_arch of mux16x1_test is 
  component mux16x1
    port(
      xin : in bit_vector(15 downto 0);
      xsel : in bit_vector(3 downto 0);
      xout : out bit
    );
  end component;
  signal test_inputs : bit_vector(15 downto 0);
  signal test_sel : bit_vector(3 downto 0);
  signal test_output : bit;
  begin
    inst0 : mux16x1 port map(test_inputs,test_sel,test_output);
    process
      begin
        test_inputs <= "1010101010101010";
        test_sel <= "0000";
        wait for 50 ns;
        test_sel <= "0101";
        wait for 50 ns;
        test_sel <= "1010";
        wait for 50 ns;
        test_sel <= "1100";
        wait for 50 ns;
        test_sel <= "1101";
        wait for 50 ns;
    end process;
end mux16x1_test_arch;


