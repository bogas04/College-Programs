entity mux4x1_selected is 
  port (
    inputs : in bit_vector(3 downto 0);
    sel : in bit_vector(1 downto 0);
    output : out bit
  );
end entity;

architecture mux4x1_selected_arch of mux4x1_selected is 
  begin
    with sel select output <=
      inputs(0) when "00",
      inputs(1) when "01",
      inputs(2) when "10",
      inputs(3) when "11";
end mux4x1_selected_arch;
