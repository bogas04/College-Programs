library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RestoringDivision_test is
  
end entity;

architecture RestoringDivision_test_arch of RestoringDivision_test is
  component RestoringDivision is  
    port (
      x, y : in std_logic_vector (7 downto 0);
      result : out std_logic_vector (7 downto 0);
      start : in std_logic
    );
  end component;
  signal testX, testY, testResult : std_logic_vector (7 downto 0);
  signal testStart : std_logic;
  begin
    RD : RestoringDivision port map (testX, testY, testResult, testStart);
    process
      begin 
        ------ 64,32,16,8,4,2,1
        testX <= "01101100"; -- 108
        testY <= "00001100"; -- 12
        -- Output should be : 9 , ie 00000000000001001 
        testStart <= '0';
        wait for 50 ns;
        testStart <= '1';
        wait for 100 ns;
    end process;
end architecture;
