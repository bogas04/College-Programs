entity multiplier8x8_test is end entity;

architecture multiplier8x8_test_arch of multiplier8x8_test is
  component multiplier8x8 is
    port (
      aIn,bIn : in bit_vector(7 downto 0);
      product : out bit_vector(15 downto 0)
    );
  end component;
  signal test_a,test_b: bit_vector(7 downto 0);
  signal test_product: bit_vector(15 downto 0);
  begin
    inst0 : multiplier8x8 port map(test_a,test_b,test_product);
    process
      begin 
        test_a <= "00000011"; -- 3
        test_b <= "00010001"; -- 17
        -- product should be 51 or 0000000000110011
        wait for 50 ns;
        test_a <= "00010000"; -- 16 (left shift 4)
        -- product should be 0000000100010000
        wait for 50 ns;
    end process;
end multiplier8x8_test_arch;
