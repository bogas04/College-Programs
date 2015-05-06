<?php
  $var = 1;
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Let's index the DAYS!</title>
  </head>
  <body>
    <h1> Today we will index the days using PHP! </h1>
    <p>Variable value : <?=$var?></p>
    <p>Day as per the variable is 
    <?php
      switch($var) {
        case 1 :
          echo "Monday";  
        break; 
       
        case 2 :
          echo "Tuesday";
        break;
        
        case 3 :
          echo "Wednesday";
        break;
        
        case 4 :
          echo "Thursday";
        break;
        
        case 5 :
          echo "Friday";
        break;
        
        case 6 :
          echo "Saturday";
        break;
      
        case 7 : 
          echo "Sunday";
        break;
      }
    ?>
    </p>
  </body>
</html>
