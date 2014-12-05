entity mux16x1 is
  port(
    xin : in bit_vector(15 downto 0);
    xsel : in bit_vector(3 downto 0);
    xout : out bit
  );
end entity;

architecture mux16x1_arch of mux16x1 is
  component mux4x1_selected is 
    port (
      inputs : in bit_vector(3 downto 0);
      sel : in bit_vector(1 downto 0);
      output : out bit
    );
  end component;
  signal temp : bit_vector(3 downto 0);
  begin 
    inst0: mux4x1_selected port map (xin(3 downto 0),xsel(1 downto 0),temp(0));
    inst1: mux4x1_selected port map (xin(7 downto 4),xsel(1 downto 0),temp(1));
    inst2: mux4x1_selected port map (xin(11 downto 8),xsel(1 downto 0),temp(2));
    inst3: mux4x1_selected port map (xin(15 downto 12),xsel(1 downto 0),temp(3));
    inst4: mux4x1_selected port map (temp,xsel(3 downto 2),xout);
end mux16x1_arch;