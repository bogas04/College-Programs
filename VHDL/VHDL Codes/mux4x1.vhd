entity mux4x1 is 
  port(inp0,inp1,inp2,inp3,sel0,sel1 : in bit;
    f : out bit
  );
end entity;

architecture mux4x1_arch of mux4x1 is 
  component mux2x1 is
    port(x,y,s : in bit;
      z : out bit
    );
  end component;
  signal mux1_out, mux2_out : bit;
  begin
    inst0 : mux2x1 port map(inp0,inp1,sel1,mux1_out);
    inst1 : mux2x1 port map(inp2,inp3,sel1,mux2_out);
    inst2 : mux2x1 port map(mux1_out,mux2_out,sel1,f);
end mux4x1_arch;
    