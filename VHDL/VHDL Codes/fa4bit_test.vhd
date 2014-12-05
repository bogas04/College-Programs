
entity fa4bit_test is end entity;

architecture fa4bit_test_arch of fa4bit_test is 
  component fa4bit is 
    port(
      xin,yin : in bit_vector(3 downto 0);
      carry_in : in bit;
      sum_out : out bit_vector(3 downto 0);
      carry_out : out bit
    );
  end component;
  signal txin,tyin,tsum_out : bit_vector(3 downto 0);
  signal tcarry_in,tcarry_out : bit;
  begin 
    inst0 : fa4bit port map (txin,tyin,tcarry_in,tsum_out,tcarry_out);
      process begin
        txin <= "1010";
        tyin <= "0101";  
        tcarry_in <= '0';
        wait for 50 ns;
        
        txin <= "0011";
        tyin <= "1100";  
        tcarry_in <= '0';
        wait for 50 ns;
        
        txin <= "1010";
        tyin <= "0101";  
        tcarry_in <= '1';
        wait for 50 ns;
      end process;
end fa4bit_test_arch;
