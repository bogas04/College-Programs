entity fa1bit is
  port(
    x,y,cin : in bit;
    sum,cout : out bit
  );
end entity;

architecture fa1bit_arch of fa1bit is 
  begin
    sum <= x xor y xor cin;
    cout <= (x and y) or (x and cin) or (y and cin); 
end fa1bit_arch;