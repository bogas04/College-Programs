entity GrayCodeCounter is 
  port (
    clk , reset : in bit;
    output : out bit_vector(2 downto 0)
  );
end entity;

architecture GrayCodeCounter_arch of GrayCodeCounter is
  type state is (S0,S1,S2,S3,S4,S5,S6,S7); -- user defined enumerative data type
  signal presentState,nextState : state;                    -- using state data type defined above
  begin
    process(clk, reset) 
      begin
        if(reset = '1') then
          presentState <= S7;
        elsif(clk'event and clk = '1') then
          presentState <= nextState;
        end if;
    end process;
    process(presentState)
      begin
        case presentState is
          when S0 =>
            nextState <= S1;
            output <= "001";
          when S1 => 
            nextState <= S2;
            output <= "011";
          when S2 =>
            nextState <= S3;
            output <= "010";
          when S3 =>
            nextState <= S4;
            output <= "110";
          when S4 =>
            nextState <= S5;
            output <= "111";
          when S5 =>
            nextState <= S6;
            output <= "110";
          when S6 =>
            nextState <= S7;
            output <= "100";
          when S7 =>
            nextState <= S0;
            output <= "000";
        end case; 
    end process;
end architecture;