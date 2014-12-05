entity PIPO8bit is 
  port (
    clk, clear : in bit;
    data_in : in bit_vector (7 downto 0);
    data_out : out bit_vector (7 downto 0)
  );
end entity;

architecture PIPO8bit_arch of PIPO8bit is
  component DFlipFlop is 
    port (
      d, clk, reset, preset : in bit;
      q : out bit
    );
  end component;
  signal preset : bit;
  begin
    GEN : for i in 0 to 7 generate 
      DFF : DFlipFlop port map (data_in(i), clk, clear, preset, data_out(i));
    end generate GEN;
end architecture;
