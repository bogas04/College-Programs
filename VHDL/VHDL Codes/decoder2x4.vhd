entity decoder2x4 is 
  port(
    xin : in bit_vector(1 downto 0);
    enable : in bit;
    output : out bit_vector(3 downto 0)
  );
end entity;

architecture decoder2x4_arch of decoder2x4 is
  begin
    -- conditional assignment
    output <= "0000" when enable = '0' else
              "0001" when xin = "00" and enable = '1' else
              "0010" when xin = "01" and enable = '1' else
              "0100" when xin = "10" and enable = '1' else
              "1000" when xin = "11" and enable = '1' ; 
end decoder2x4_arch;