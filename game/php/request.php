<?php
include 'db_conn.php';

$querySC = "SELECT * FROM scenario";
$queryCH = "SELECT * FROM choice";

$resultSC = $con->query($querySC);
$resultCH = $con->query($queryCH);

if ($resultSC->num_rows > 0 && $resultCH->num_rows > 0) {
    $scenarios = array();
    $choices = array();
    
    while($row = $resultCH->fetch_assoc()) {
        $choice = array(
            "id" => $row["id"],
            "scenario" => $row["id_scenario"],
            "description" => $row["description"]
        );
        $choices[] = $choice;
    }
    while($row = $resultSC->fetch_assoc()) {
        $scenario = array(
            "id" => $row["id"],
            "name" => $row["name"],
            "image" => $row["image"],
            "description" => $row["description"]
        );
        $i = 1;
        foreach ($choices as $choice) {
            if ($choice["scenario"] == $scenario['id']) {
                $scenario["choice".$i] = $choice['description'];
                $i++;
            }
        }
        
        $scenarios[] = $scenario;
    }
} else {
    echo "Nessun risultato trovato";
}

echo json_encode($scenarios);
$con->close();
?>
