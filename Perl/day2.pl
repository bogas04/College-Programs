print "=======TESTING HERE DOCUMENT=========\n";
$a = 10;
my $var  = << "END";
YOLO
ABABB
hadipa
a = $a
END

printf("$var");


print "===========TESTING .... OPERATOR============\n";
@arr = ('a','c'...'z');
print(@arr,"\n");
print "size : ", scalar@arr, "\n";


print "=========TESTING scalar \@ array and \$ \# array=================\n";
@ar = (1, 2, 3, 4);
$ar[50] = 4;
print @ar, "\n";
print scalar@ar , " is different from " , $#ar, " \n";

print "=============TESTING push pop shift unshift================\n";

@array =  ('a', 1, 2, 3);
print "\ arrayelements = @array\n";
push ( @array , 'b');
print "\ after pushing elements = @array\n";
unshift(@array , 'e');
print "\ after unshift = @array\n";
$var = pop(@array);
print "\ Popped element : $var\n";
shift(@array);
print("\ @array \n");


print "===========TESTING slicing===========\n";

@days = ('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun');
@weekdays = @days[0, 2, 4, 6];
print "\ @weekdays\n";

print "=========TESTING splicing============\n";

@numbers = (1 ... 20);
print "\ Before : @numbers\n";
splice(@numbers,  5, 5, 21 ... 25);
print "\ After : @numbers\n";

print "=========TESTING spliting===========\n";
$var_string = "Rain_drops_on_roses";
print "\ $var_string is being split by _ \n";
@string = split('_', $var_string);
print "\ 4th element of splitted : $string[3] \n";

print "=========TESTING joinning=========\n";
print "Joining the array with spaces this time \n";
print join(" ", @string) , " \n";

print "=======TESTING sorting==========\n";
@foods = qw(pizza burger kachodi dosa);
print "Before : @foods \n";
@foods = sort(@foods);
print "After : @foods \n";

print "======TESTING concatenation of arrays======\n";
@foods = qw(pizza burger kachodi dosa);
print "Foods : @foods \n";
@beverages = qw(lassi coffee tea "cold drink");
print "Beverages : @beverages \n";
@food_and_beverages = (@foods, @beverages);
print "Food and beverages : @food_and_beverages\n";
  
print "==========TESTING multiple selection========\n";
@some_array = (5, 4, 3, 2, 1);
print "Array : @some_array \n";
$variable = (5, 4, 3, 2, 1)[4];
print "value of variable = $variable \n";
@list = @some_array[1 ... 3];
print "1…3 elements are : @list \n";
  

