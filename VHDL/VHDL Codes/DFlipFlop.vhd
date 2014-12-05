entity DFlipFlop is
  port (
    d, clk, reset, preset : in bit;
    q : out bit
  );
end entity;

architecture DFlipFlop_arch of DFlipFlop is
  begin
    process(clk) 
      begin
        if(preset = '1') then
          q <= '1';
        elsif(reset = '1') then
          q <= '0';
        elsif(clk'event and clk = '1') then
          q <= d;
        end if;
    end process;
end architecture;
