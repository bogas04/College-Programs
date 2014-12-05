entity basicALU_test is
end entity;

architecture basicALU_test_arch of basicALU_test is 
  component basicALU is 
    port (
      x : in bit_vector(7 downto 0);
      y : in bit_vector(7 downto 0);
      sel : in bit_vector(2 downto 0);
      output : out bit_vector(8 downto 0)
    );
  end component;
  signal test_x,test_y: bit_vector(7 downto 0);
  signal test_sel : bit_vector(2 downto 0);
  signal test_output : bit_vector(8 downto 0);
  begin
    
      -- 000 Add
      -- 001 Subtract
      -- 010 Increment (add with 00000001)
      -- 011 Decrememt (subtract 00000001)
      -- 100 AND
      -- 101 OR
      -- 110 XOR
      -- 111 NOT (of x)
    inst0 : basicALU port map(test_x,test_y,test_sel,test_output);
    process
      begin
        test_x <= "11001010";
        test_y <= "00110011";
        test_sel <= "000";
        wait for 50 ns;
        test_sel <= "001";
        wait for 50 ns;
        test_sel <= "010";
        wait for 50 ns;
        test_sel <= "011";
        wait for 50 ns;
        test_sel <= "100";
        wait for 50 ns;
        test_sel <= "101";
        wait for 50 ns;
        test_sel <= "110";
        wait for 50 ns;
        test_sel <= "111";
        wait for 50 ns;
    end process;  
    
end basicALU_test_arch;
