entity bitOperators is 
  port (
    input : in bit_vector (7 downto 0);
    sel : in bit_vector (1 downto 0);
    output : out bit_vector(7 downto 0)
  );
end entity;

architecture bitOperators_arch of bitOperators is 
  signal tLeft,tRight : bit_vector(7 downto 0);
  begin
    -- 00 Left Shift
    -- 01 Right Shift
    -- 10 Right Rotate
    -- 11 Left Rotate 
    
    GEN_SHIFT:
      for I in 0 to 6 generate 
        tLeft(I+1) <= input(I);
        tRight(I) <= input(I+1);
    end generate GEN_SHIFT;
    tLeft(0) <= '0';
    tRight(7) <= '0';
    
    output <= tLeft when sel = "00" else
              tRight when sel = "01" else
              input(0)&tRight(6 downto 0) when sel = "10" else
              tLeft(7 downto 1)&input(7) when sel = "11";
    
end bitOperators_arch;
