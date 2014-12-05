library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RestoringDivision is
  port (
    x, y : in std_logic_vector (7 downto 0);
    result : out std_logic_vector (7 downto 0);
    start : in std_logic
  );
end entity;

architecture RestoringDivision_arch of RestoringDivision is
begin
  process(start)
    variable A, B : std_logic_vector (7 downto 0);
    variable Q : std_logic_vector (7 downto 0);
    begin
      if(start'event and start = '1') then -- Initialization 
        A := x;
        B := y;
        Q := (others => '0');
      else
        for i in 0 to 7 loop
          Q(7 downto 1) := Q(6 downto 0);
          Q(0) := A(7);
          A(7 downto 1) := A(6 downto 0);
          Q := (Q + ((not B) + '1'));
          if(Q(7) = '1') then -- If Q - B < 0
            A(0) := '0';
            Q := Q + B;
          else
            A(0) := '1';
          end if;
        end loop;
        result <= A;
      end if;
    end process;
end architecture;