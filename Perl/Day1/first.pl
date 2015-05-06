print "Enter any value : ";
$a = <>;
print "The value entered is : \"$a\"";

@ar = (1, 2, "Chachacha");
@cp = @ar;
@ar[2] = "Cha cha cha";

print "
\@ar = @ar
\$ar = $ar
\@cp = @cp
\$cp = $cp
"; 

print "\$ar[-1] = @ar[-1]";

%a = (
  'name', 'divjot',
  'age', 20 
);

print "\nName : $a{'name'} \n";

print "$a{'name'} = $a{'age'}\n";
print $a{'name'} = $a{'age'};
print $a{'name'};
print "
";
