entity RegisterFile is
  port (
    clk, rw, reset : in bit;                    -- rw = '1' - Write data in addrA
    data : in bit_vector(7 downto 0);           -- rw = '0' - Read addrA and addrB in portA and portB
    addrA, addrB : in integer range 0 to 15; -- 16 Registers in total
    portA, portB : out bit_vector (7 downto 0)  -- Each 8 bit wide
  );
end entity;

architecture RegisterFile_test of RegisterFile is 
  type reg_array is array(0 to 15) of bit_vector(7 downto 0);
  signal memory : reg_array;
  begin
    process(clk) 
      begin
        if (clk'event and clk = '1') then
          if (reset = '1') then 
            memory <= (others => "00000000");
          elsif (rw = '1') then -- Write
            memory(addrA) <= data;
          end if;
            portA <= memory(addrA);
            portB <= memory(addrB);
        end if;
    end process;
end architecture;