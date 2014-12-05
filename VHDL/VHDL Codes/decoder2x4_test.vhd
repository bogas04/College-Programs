entity decoder2x4_test is 
end entity;

architecture decoder2x4_test_arch of decoder2x4_test is
  component decoder2x4 is
    port(
      xin : in bit_vector(1 downto 0);
      enable : in bit;
      output : out bit_vector(3 downto 0)
    );
  end component;
  signal test_inputs:bit_vector(1 downto 0);
  signal test_enable:bit;
  signal test_output: bit_vector(3 downto 0);
  begin
    inst0 : decoder2x4 port map(test_inputs,test_enable,test_output);
    process
      begin 
        test_enable <= '1';
        test_inputs <= "00"; 
        wait for 50 ns;
        test_inputs <= "01";
        wait for 50 ns;
        test_inputs <= "10";
        wait for 50 ns;
        test_inputs <= "11";
        wait for 50 ns;
        test_enable <= '0';
        test_inputs <= "01"; 
        wait for 50 ns;
    end process;
end decoder2x4_test_arch;
