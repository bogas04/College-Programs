entity fa8bit_nogen_test is end entity;

architecture fa8bit_nogen_test_arch of fa8bit_nogen_test is
  component fa8bit_nogen is
    port(    
      xin,yin : in bit_vector(7 downto 0);
      c_in : in bit;
      sum_out : out bit_vector(7 downto 0);      
      c_out : out bit
    );
  end component;
  signal test_x,test_y,test_sum:bit_vector(7 downto 0);
  signal test_cin,test_cout:bit;
  begin
    inst0 : fa8bit_nogen port map(test_x,test_y,test_cin,test_sum,test_cout);
      process
        begin
          test_x <= "10101010";
          test_y <= "01010101";
          wait for 50 ns;
          test_x <= "00001111";
          test_y <= "00000101";
          wait for 50 ns;
      end process;
end fa8bit_nogen_test_arch;