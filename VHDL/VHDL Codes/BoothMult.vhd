library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BoothMult is
  port (
    mpcd, mplr : in std_logic_vector (7 downto 0);
    result : out std_logic_vector (15 downto 0);
    start : in std_logic
  );
end entity;

architecture BoothMult_arch of BoothMult is
  begin
    process(start) 
      variable br, nbr : std_logic_vector(7 downto 0);
      variable acqr : std_logic_vector(15 downto 0);
      variable qn1 : std_logic;
      begin
        if(start'event and start = '1') then
          acqr (15 downto 8) := (others => '0');
          acqr (7 downto 0) := mpcd;
          br := mplr;
          nbr := (not br) + '1'; -- 2's complement of br
          qn1 := '0';
        else
          for i in 7 downto 0 loop
            -- Special cases (01 and 10)
            if(acqr(0) = '0' and qn1 = '1') then
             acqr(15 downto 8) := acqr(15 downto 8) + br;
            elsif(acqr(0) = '1' and qn1 = '0') then
              acqr(15 downto 8) := acqr(15 downto 8) + nbr;
            end if;  
            
            -- Shifting
            qn1 := acqr(0);
            acqr(14 downto 0) := acqr(15 downto 1);
          end loop;
          result <= acqr;
        end if;
     end process;
end architecture;