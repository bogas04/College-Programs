entity ashr11bit is
  port (
    x : in bit_vector(10 downto 0);
    y : out bit_vector(10 downto 0)
  );
end entity;

architecture ashr11bit_arch of ashr11bit is
  begin
    y(9 downto 0) <= x(10 downto 1);
    y(10) <= x(10);
end architecture;