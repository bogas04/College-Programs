entity Mod10 is 
  port (
    up, clk : in bit;
    output : inout bit_vector (3 downto 0)
  );
end entity;

architecture Mod10_test of Mod10 is
  component TFlipFlop is
    port (
      t, clk, reset : in bit;
      q : inout bit
    );
  end component;
  signal high, low, clr: bit;
  signal tempCLK : bit_vector(0 to 4);
  begin
    
    high <= '1';
    clr <= output(3) and output(1); -- 1X1X
    
    tempCLK(0) <= not clk when up = '1' else clk;
    
    GEN: for i in 0 to 3 generate 
      tempCLK(i + 1) <= (not output(i)) when up = '1' else output(i); 
      FF : TFlipFlop port map (high, tempCLK(i), clr, output(i));
    end generate GEN;
    
end architecture; 