
entity mux4x1_test is end entity;

architecture mux4x1_test_arch of mux4x1_test is 
  component mux4x1 is 
     port(inp0,inp1,inp2,inp3,sel0,sel1 : in bit;
     f : out bit
  );

  end component;
  signal tf,tinp0,tinp1,tinp2,tinp3,tsel1,tsel0 : bit;
  begin 
    inst0 : mux4x1 port map (tinp0,tinp1,tinp2,tinp3,tsel0,tsel1,tf);
      process begin
        tinp0 <= '1';
        tinp1 <= '0';
        tinp2 <= '1';
        tinp3 <= '0';
        
        tsel0 <= '0';
        tsel1 <= '0';
        wait for 20 ns;
        tsel0 <= '0';
        tsel1 <= '1';
        wait for 20 ns;
        tsel0 <= '1';
        tsel1 <= '0';
        wait for 20 ns;
        tsel0 <= '1';
        tsel1 <= '1';
        wait for 20 ns;
      end process;
end mux4x1_test_arch;

