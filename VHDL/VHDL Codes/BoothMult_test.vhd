library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BoothMult_test is
end entity;

architecture BoothMult_test_arch of BoothMult_test is
  component BoothMult is
    port (
      mpcd, mplr : in std_logic_vector (7 downto 0);
      result : out std_logic_vector (15 downto 0);
      start : in std_logic
    );
  end component;
  signal testA, testB : std_logic_vector (7 downto 0);
  signal testResult : std_logic_vector (15 downto 0);
  signal testStart : std_logic;
  begin
    MULT : BoothMult port map(testA, testB, testResult, testStart);
    process 
      begin
        ----- 64,32,16,8,4,2,1
        testA <= "01001100"; -- 76
        testB <= "01101001"; -- 105
        -- Output should be : 7980 , ie 0001111100101100 
        testStart <= '0';
        wait for 50 ns;
        testStart <= '1';
        wait for 100 ns;
    end process;
end architecture;
