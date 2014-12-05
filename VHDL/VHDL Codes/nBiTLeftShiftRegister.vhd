entity nBitLeftShiftRegister is
  generic (
    bits : integer := 8
  );
  port (
    enable, write, clk, reset : in bit;
    data : in bit_vector (bits - 1 downto 0);
    output : out bit_vector (bits - 1 downto 0)
  );
end entity;

architecture nBitLeftShiftRegister_arch of nBitLeftShiftRegister is
  signal tempOut : bit_vector(bits - 1 downto 0);
  begin
    process(clk) 
      begin
        if (reset = '1') then
          tempOut <= (others => '0');
        elsif (clk'event and clk = '1') then
          if( enable = '1') then
            for i in bits - 1  downto 1 loop
              tempOut(i) <= tempOut(i - 1);
            end loop;
            tempOut(0) <= '0';
          elsif( enable = '0' and write = '1') then 
            tempOut <= data;
          end if;
        end if;
        output <= tempOut;
    end process; 
end architecture;