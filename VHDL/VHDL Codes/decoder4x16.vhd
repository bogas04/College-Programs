entity decoder4x16 is
  port(
    inputs : in bit_vector(3 downto 0);
    en : in bit;
    outputs : out bit_vector(15 downto 0)
  );
end entity;

architecture decoder4x16_arch of decoder4x16 is 
  component decoder2x4 is
    port(
      xin : in bit_vector(1 downto 0);
      enable : in bit;
      output : out bit_vector(3 downto 0)
    );    
  end component;
  signal temp : bit_vector(3 downto 0);
  begin 
    inst0 : decoder2x4 port map (inputs(3 downto 2),en,temp);
    inst1 : decoder2x4 port map (inputs(1 downto 0),temp(3),outputs(15 downto 12));
    inst2 : decoder2x4 port map (inputs(1 downto 0),temp(2),outputs(11 downto 8));
    inst3 : decoder2x4 port map (inputs(1 downto 0),temp(1),outputs(7 downto 4));
    inst4 : decoder2x4 port map (inputs(1 downto 0),temp(0),outputs(3 downto 0));
    
end decoder4x16_arch;