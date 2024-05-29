<?php
include 'db_conn.php';
$sql = "SELECT * FROM scenario";
$result = $con->query($sql);

if ($result->num_rows > 0) {
    $scenarios = array();
    while($row = $result->fetch_assoc()) {
        $scenario = array(
            "id" => $row["id"],
            "name" => $row["name"],
            "image" => $row["image"],
            "description" => $row["description"]
        );
        $scenarios[] = $scenario;
    }
    echo json_encode($scenarios);
} else {
    echo "Nessun risultato trovato";
}


$con->close();
?>
