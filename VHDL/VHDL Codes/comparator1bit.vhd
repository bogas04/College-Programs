entity comparator1bit is
  port(
    x,y,prev_lt,prev_eq,prev_gt : in bit;
    lt,eq,gt : out bit
  );
end entity;

architecture comparator1bit_arch of comparator1bit is
  begin
    gt <= prev_gt or (prev_eq and (not y) and x); -- if pervious is greater or prev equal and present is greater
    lt <= prev_lt or (prev_eq and (not x) and y); -- if previous is less or prev equal and present is less
    eq <= prev_eq and (y xnor x); -- if equal and present equal 
end comparator1bit_arch;