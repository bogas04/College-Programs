entity SRFlipFlop is
  port (
    s, r : in bit;
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
  signal temp1, temp2 : bit;
  begin
    gate1: nand1 port map (s, temp2, temp1);
    gate2: nand2 port map (r, temp1, temp2);
    q <= temp1;
    notQ <= temp2;
end architecture;
