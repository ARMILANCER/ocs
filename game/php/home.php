<?php
// Include il file di connessione al database
include 'db_conn.php';

// Query per recuperare le informazioni dell'utente
$query_user = "SELECT * FROM `user` WHERE id = 60"; // Modifica l'id a seconda dell'utente che vuoi visualizzare
$result_user = mysqli_query($con, $query_user);

// Verifica se l'utente è stato trovato
if ($result_user && mysqli_num_rows($result_user) > 0) {
    $user = mysqli_fetch_assoc($result_user);
    // Converte le informazioni dell'utente in formato JSON e le restituisce
    echo json_encode($user);
} else {
    // Se l'utente non viene trovato, restituisce un messaggio di errore
    $error = array('error' => 'Utente non trovato');
    echo json_encode($error);
}

// Chiudi la connessione al database
mysqli_close($con);

function all(){
    return 0;
}

?>