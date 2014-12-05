entity andckt_test is
end entity;

architecture andckt_test_arch of andckt_test is
  component andCKT is
    port (  
      x,y : in bit;
      z : out bit
    );    
  end component;
  signal test_x,test_y,test_z : bit;
  begin
    inst0: andCKT port map(test_x,test_y,test_z);
    process begin
      test_x <= '0';
      test_y <= '0';
      wait for 10 ns;
      test_x <= '1';
      wait for 10 ns;
      test_y <= '1';
      wait for 10 ns;
      test_x <= '0';
      wait for 10 ns;
   end process;    
end andckt_test_arch;
