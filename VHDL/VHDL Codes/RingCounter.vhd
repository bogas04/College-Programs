entity RingCounter is 
  port (
    clk, clear, set : in bit;
    data : inout bit_vector (3 downto 0)
  );
end entity;

architecture RingCounter_arch of RingCounter is
  component DFlipFlop is 
    port (
      d, clk, reset, preset : in bit;
      q : out bit
    );
  end component;
  signal temp : bit_vector(0 to 4);
  begin
    temp(0) <= not data(3);
    GEN : for i in 0 to 3 generate 
      temp(i + 1) <= data(i);
      DFF : DFlipFlop port map (temp(i), clk, clear, set, data(i));
    end generate GEN;
end architecture;

