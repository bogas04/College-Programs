<?php
$i = 0;
$file_handler = fopen("test.txt", "r");
while($str = fgets($file_handler, 2)) {
  echo "\nIteration : $i\n";
  echo "Str is : $str";
  $i++;
}
fclose($file_handler);  

