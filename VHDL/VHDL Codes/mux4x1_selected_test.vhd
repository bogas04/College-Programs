entity mux4x1_selected_test is 
end entity;

architecture mux4x1_selected_test_arch of mux4x1_selected_test is 
  component mux4x1_selected
    port (
      inputs : in bit_vector(3 downto 0);
      sel : in bit_vector(1 downto 0);
      output : out bit
    );
  end component;
  signal test_inputs : bit_vector(3 downto 0);
  signal test_sel : bit_vector(1 downto 0);
  signal test_output : bit;
  begin
    inst0 : mux4x1_selected port map(test_inputs,test_sel,test_output);
    process
      begin
        test_inputs <= "0101";
        test_sel <= "00";
        wait for 50 ns;
        test_sel <= "01";
        wait for 50 ns;
        test_sel <= "10";
        wait for 50 ns;
        test_sel <= "11";
        wait for 50 ns;
    end process;
end mux4x1_selected_test_arch;

