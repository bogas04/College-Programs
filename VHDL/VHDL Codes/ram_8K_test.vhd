library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ram_8K_test is
end entity;

architecture ram_8K_test_arch of ram_8K_test is
  component ram_8K is
   generic (
      bits : integer := 8;
      words : integer := 1024 
    );
    port (
      addr : in integer range 0 to words - 1;
      data : inout std_logic_vector(bits -1 downto 0);
      clk, write_enable : in std_logic
    ); 
  end component;
  signal test_clk, test_we : std_logic;
  signal test_data : std_logic_vector(7 downto 0);
  signal test_addr : integer range 0 to 1023;
  begin
    test_we <= '0';
    test_clk <= '0';
    test_data <= (others => '0');
    inst : ram_8K port map (test_addr, test_data, test_clk, test_we);
      
    -- Clock
    process 
      begin
        for i in 0 to 20 loop
          test_clk <= '1';
          wait for 20 ns;
          test_clk <= '0';
          wait for 20 ns;
        end loop;
    end process;
   
    -- Inputs
    process
      begin
        test_we <= '1';
        test_addr <= 0;
        wait for 50 ns;
        test_we <= '1';
        test_addr <= 0;
        test_data <= "10101010";
        wait for 50 ns;
        test_we <= '1';
        test_addr <= 6;
        test_data <= "11111010";
        wait for 50 ns;
        test_we <= '0';
        test_addr <= 2;
        wait for 50 ns;
        test_addr <= 6;
        wait for 50 ns;
    end process;  
end architecture;

