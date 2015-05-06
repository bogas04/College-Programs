<?php
  $data = [
   ["name" => "Divjot Singh", "marks" => 90],
   ["name" => "Agastya Angiras", "marks" => 20],
   ["name" => "Ayush Sharma", "marks" => 30],
   ["name" => "Akanshi Gupta", "marks" => 10],
   ["name" => "Param", "marks" => 5],
   ["name" => "Harsh", "marks" => 60]
  ];
  $grades = [ "90" => "A+", "80" => "A", "70" => "B", 
              "60" => "B", "50" => "C", "40" => "D", 
              "30" => "D", "20" => "D", "10" => "D",
               "0" => "D" ];
?>
<!DOCTYPE html>
<html>
<body>
  <h2> NSIT - Results </h2>
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Marks</th>
        <th>Grade</th>
      </tr>
    </thead>
    <tbody>
    <?php 
      foreach($data as $d) {
        echo 
          "<tr>\n".
          "<td>".$d['name']."</td>\n".
          "<td>".$d['marks']."</td>\n".
          "<td>".$grades[10*($d['marks']/10)]."</td>\n";
          "</tr>\n";
      }
    ?>
    </tbody>
  </table>
</body>
</html>
