entity SerialAdder is
  port ( 
    a, b, clk, reset : in bit;
    s, cout : out bit
  );
end entity;

architecture SerialAdder_arch of SerialAdder is 
  component DFlipFlop is
    port (
      d, clk, reset, preset : in bit;
      q : out bit
    );
  end component;
  component fa1bit is
    port(
      x,y,cin : in bit;
      sum,cout : out bit
    );
  end component;
  signal presentCarry, nextCarry , preset: bit;
  begin
    FA : fa1bit port map (a, b, nextCarry, s, presentCarry );
    DFF : DFlipFlop port map (presentCarry, clk, reset, preset, nextCarry );
    cout <= nextCarry;
end architecture;
