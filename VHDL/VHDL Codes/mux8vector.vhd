
entity mux8vector is 
  port(
    inp0,inp1,inp2,inp3,inp4,inp5,inp6,inp7 : in bit_vector(8 downto 0);
    mux_sel : in bit_vector(2 downto 0);
    mux_out : out bit_vector(8 downto 0)
  );
end entity;

architecture mux8vector_arch of mux8vector is
  begin
    mux_out <= inp0 when mux_sel = "000" else
               inp1 when mux_sel = "001" else
               inp2 when mux_sel = "010" else
               inp3 when mux_sel = "011" else
               inp4 when mux_sel = "100" else
               inp5 when mux_sel = "101" else
               inp6 when mux_sel = "110" else
               inp7 when mux_sel = "111";
end architecture;