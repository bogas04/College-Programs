entity multiplier8x8 is
  port (
    aIn,bIn : in bit_vector(7 downto 0);
    product : out bit_vector(15 downto 0)
  );
end entity;

architecture multiplier8x8_arch of multiplier8x8 is
  component fa8bit is
    port(
      xin,yin : in bit_vector(7 downto 0);
      c_in : in bit;
      sum_out : out bit_vector(7 downto 0);
      c_out : out bit
    );
  end component;
  signal temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,
         sum0,sum1,sum2,sum3,sum4,sum5,sum6,sum7,carry,
         tsum0,tsum1,tsum2,tsum3,tsum4,tsum5,tsum6,tsum7 : bit_vector(7 downto 0);
  
  begin
    -- Getting all the partial products
    A0 :
      for I in 0 to 7 generate 
        temp0(7-I) <= (aIn(0)and bIn(7-I));
        temp1(7-I) <= (aIn(1)and bIn(7-I));
        temp2(7-I) <= (aIn(2)and bIn(7-I));
        temp3(7-I) <= (aIn(3)and bIn(7-I));
        temp4(7-I) <= (aIn(4)and bIn(7-I));
        temp5(7-I) <= (aIn(5)and bIn(7-I));
        temp6(7-I) <= (aIn(6)and bIn(7-I));
        temp7(7-I) <= (aIn(7)and bIn(7-I));
    end generate A0;
    
    -- Initializing inputs of FAs and first carry
    sum0 <= temp0;
    carry(0) <= '0';
    tsum0 <= carry(0)&sum0(7 downto 1);
    tsum1 <= carry(1)&sum1(7 downto 1);
    tsum2 <= carry(2)&sum2(7 downto 1);
    tsum3 <= carry(3)&sum3(7 downto 1);
    tsum4 <= carry(4)&sum4(7 downto 1);
    tsum5 <= carry(5)&sum5(7 downto 1);
    tsum6 <= carry(6)&sum6(7 downto 1);
    
    -- Adding all partial products
    INST1 : fa8bit port map(tsum0,temp1,carry(0),sum1,carry(1));
    INST2 : fa8bit port map(tsum1,temp2,carry(0),sum2,carry(2));
    INST3 : fa8bit port map(tsum2,temp3,carry(0),sum3,carry(3));
    INST4 : fa8bit port map(tsum3,temp4,carry(0),sum4,carry(4));
    INST5 : fa8bit port map(tsum4,temp5,carry(0),sum5,carry(5));
    INST6 : fa8bit port map(tsum5,temp6,carry(0),sum6,carry(6));
    INST7 : fa8bit port map(tsum6,temp7,carry(0),sum7,carry(7));
    
    -- Computing the product
    product <=  carry(7)&sum7(7 downto 0)&
      sum6(0)&sum5(0)&sum4(0)&sum3(0)&
      sum2(0)&sum1(0)&sum0(0);
    
end multiplier8x8_arch;