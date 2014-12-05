entity TFlipFlop is
  port (
    t, clk, reset : in bit;
    q : inout bit
  );
end entity;

architecture TFlipFlop_arch of TFlipFlop is
  begin
    process(clk) 
      begin
        if(clk'event and clk = '1') then
          if(reset = '1') then
            q <= '0';
          elsif(t = '1') then
            q <= not q;
          end if;
        end if;
    end process;
end architecture;