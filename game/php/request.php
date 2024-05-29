<?php
$servername = "nome_server";
$username = "nome_utente";
$password = "password";
$dbname = "nome_database";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}

$sql = "SELECT name, description FROM scenario WHERE id = 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $data = array(
        "title" => $row["name"],
        "state" => $row["description"]
    );
    echo json_encode($data);
} else {
    echo "Nessun risultato trovato";
}
$conn->close();
?>
