<?php
require '../php/log.php';

$nickname = $_POST['nickname'];
$mail = $_POST['mail'];
$password = $_POST['password'];

$stmt = $con->prepare("INSERT INTO user (nickname, mail, password) VALUES (?, ?, ?)");
if (!$stmt) {
    die("ERROR QUERY: ".$con->error);
}

$stmt->bind_param("sss", $nickname, $mail, $password);
$rest = $stmt->execute();
$stmt->close();

if ($rest) {
    $con->close();
    header('Location: ../html/login.html');
    exit;
} else {
    header('Location: ../html/join.html');
}

$con->close();
?>
