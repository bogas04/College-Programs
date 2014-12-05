entity SRFlipFlop is
  port (
    s, r, clk, reset : in bit;
    q, notQ : out bit
  );
end entity;

architecture SRFlipFlop_arch of SRFlipFlop is 
  component nand1 is
    port (
      x , y : in bit;
      z : out bit
    );
  end component;
  component nand2 is
    port (
      x , y : in bit;
      z : out bit
    );
  end component;
  signal temp1, temp2, notR, notS : bit;
  begin
    gate1: nand1 port map (notS, temp2, temp1);
    gate2: nand2 port map (notR, temp1, temp2);
    process(clk) 
      begin
        if(reset = '1') then
          q <= '0';
          notQ <= '1';
        elsif(clk'event and clk = '1') then -- rising edge 
           notR <= not r;
           notS <= not s;
           q <= temp1;
           notQ <= temp2;
        end if;
    end process;
end architecture;

