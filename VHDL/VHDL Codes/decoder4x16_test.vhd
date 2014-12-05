entity decoder4x16_test is 
end entity;

architecture decoder4x16_test_arch of decoder4x16_test is
  component decoder4x16 is
    port(
      inputs : in bit_vector(3 downto 0);
      en : in bit;
      outputs : out bit_vector(15 downto 0)
    );
  end component;
  signal test_inputs:bit_vector(3 downto 0);
  signal test_enable:bit;
  signal test_output: bit_vector(15 downto 0);
  begin
    inst0 : decoder4x16 port map(test_inputs,test_enable,test_output);
    process
      begin 
        test_enable <= '1';
        test_inputs <= "0000"; 
        wait for 50 ns;
        test_inputs <= "0001";
        wait for 50 ns;
        test_inputs <= "0010";
        wait for 50 ns;
        test_inputs <= "0011";
        wait for 50 ns;
        test_inputs <= "0100";
        wait for 50 ns;
        test_inputs <= "0101";
        wait for 50 ns;
        test_inputs <= "0110";
        wait for 50 ns;
        test_inputs <= "0111";
        wait for 50 ns;
        test_inputs <= "1000";
        wait for 50 ns;
        test_inputs <= "1001";
        wait for 50 ns;
        test_enable <= '0';
        test_inputs <= "1010"; 
        wait for 50 ns;
    end process;
end decoder4x16_test_arch;

