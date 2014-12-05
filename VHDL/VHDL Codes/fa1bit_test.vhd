entity fa1bit_test is end entity;

architecture fa1bit_test_arch of fa1bit_test is 
  component fa1bit is 
    port(
      x,y,cin : in bit;
      sum,cout : out bit
    );
  end component;
  signal tx,ty,tcin,tsum,tcout : bit;
  begin 
    inst0 : fa1bit port map (tx,ty,tcin,tsum,tcout);
      process begin
        tx <= '1';
        ty <= '0';  
        tcin <= '0';
        wait for 50 ns;
        tx <= '1';
        ty <= '1';  
        tcin <= '0';
        wait for 50 ns;
        tx <= '1';
        ty <= '1';  
        tcin <= '1';
        wait for 50 ns;
        tx <= '0';
        ty <= '0';  
        tcin <= '0';
        wait for 50 ns;
      end process;
end fa1bit_test_arch;
