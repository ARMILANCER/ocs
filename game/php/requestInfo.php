<?php
include 'db_conn.php';
$sql = "SELECT id, 'name', long_description,'image' FROM characters";
$result = $conn->query($sql);
$characters = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $characters[] = $row;
    }
} 
$conn->close();
header('Content-Type: application/json');
echo json_encode($characters);
?>
