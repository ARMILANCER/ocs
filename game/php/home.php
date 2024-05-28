<?php
include 'db_conn.php';

$query_user = "SELECT * FROM `user` WHERE id = 1 || id = 60";
$result_user = mysqli_query($con, $query_user);
if ($result_user && mysqli_num_rows($result_user) > 0) {
    $user = mysqli_fetch_assoc($result_user);
    echo json_encode($user);
} else {
    $error = array('error' => 'Utente non trovato');
    echo json_encode($error);
}


mysqli_close($con);

function all(){
    return 0;
}
?>