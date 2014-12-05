entity fsm_0101 is
  port(
    x,reset,clk : in bit;
    z : out bit
  );
end entity;

architecture fsm_0101_arch of fsm_0101 is
  type state is (S0,S1,S2,S3); -- user defined enumerative data type
  signal ps,ns : state; -- using state data type defined above
  begin
  process(clk,reset)
    begin
      if(reset = '1') then
        ps <= S0;
      elsif(clk'event and clk = '1') then
        ps <= ns;
      end if;    
  end process;
  process(x,ps) 
    begin
      case ps is
        when S0 =>
          if(x = '0') then
            ns <= S1;
            z <= '0';
          else
            ns <= S0;
            z <= '0';
          end if;

        when S1 =>
          if(x = '1') then
            ns <= S2;
            z <= '0';
          else
            ns <= S1;
            z <= '0';
          end if;

        when S2 =>
          if(x = '0') then
            ns <= S3;
            z <= '0';            
          else
            ns <= S0;
            z <= '0';            
          end if;

        when S3 =>
          if(x = '1') then
            ns <= S2;
            z <= '1';
          else
            ns <= S1;
            z <= '0';            
          end if;
      end case;
  end process;
end architecture;