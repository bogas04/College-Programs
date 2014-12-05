entity basicALU is
  port (
    x : in bit_vector(7 downto 0);
    y : in bit_vector(7 downto 0);
    sel : in bit_vector(2 downto 0);
    output : out bit_vector(8 downto 0)
  );
end entity;

architecture basicALU_arch of basicALU is 
  component fa1bit is 
    port(
    x,y,cin : in bit;
    sum,cout : out bit
  );
  end component;
  component mux8vector is 
    port(
      inp0,inp1,inp2,inp3,inp4,inp5,inp6,inp7 : in bit_vector(8 downto 0);
      mux_sel : in bit_vector(2 downto 0);
      mux_out : out bit_vector(8 downto 0)
    );
  end component;
  signal adderCarry,adderOutput,incDecCarry,incDecOutput : bit_vector(8 downto 0);
  signal tempInput,one : bit_vector(7 downto 0);
  signal adderControl : bit;
  signal andO,orO,notO,xorO : bit_vector(8 downto 0);
  begin
    
      -- 000 Add
      -- 001 Subtract
      -- 010 Increment (add with 00000001)
      -- 011 Decrememt (subtract 00000001)
      -- 100 AND
      -- 101 OR
      -- 110 XOR
      -- 111 NOT (of x)
  
      one <= "00000001";
      adderControl <= '0' when sel = "000" or sel = "010" else
           '1' when sel = "001" or sel = "011";
      adderCarry(0) <= adderControl;
      incDecCarry(0) <= adderControl;
      
     ADD:
        for I in 0 to 7 generate 
          tempInput(I) <= (adderControl xor y(I)) when sel = "000" or sel = "001" else
                          (adderControl xor one(I)) when sel = "010" or sel = "011";
          add_sub: fa1bit port map(x(I),tempInput(I),adderCarry(I),adderOutput(I),adderCarry(I+1));      
          inc_dec: fa1bit port map(x(I),tempInput(I),incDecCarry(I),incDecOutput(I),incDecCarry(I+1));
      end generate ADD;
      
      adderOutput(8) <= adderCarry(8) xor adderCarry(7);
      incDecOutput(8) <= incDecCarry(8) xor incDecCarry(7);
      andO <= '0'& (x and y);
      orO <= '0'& (x or y);
      xorO <=  '0'& (x xor y);
      notO <= '0'& (not x);
      
      inst0 : mux8vector port map (adderOutput,adderOutput,
      incDecOutput,incDecOutput,andO,
      orO,xorO,notO,sel,output);
     
     -- output <= adderOutput when sel = "000" or sel = "001" else
      --         incDecOutput when sel = "010" or sel ="011" else
        --        '0'& (x and y) when sel = "100" else
          --      '0'& (x or y) when sel = "101" else
            --    '0'& (x xor y) when sel = "110" else
              --  '0'& (not x) when sel = "111";
      
end basicALU_arch;