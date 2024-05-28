<?php
require '../php/log.php';

$nickname = $_POST['nickname'];
$password = $_POST['password'];

$stmt = $con->prepare("SELECT COUNT(*) FROM user WHERE (nickname = ? OR mail = ?) AND password = ?");
if (!$stmt) {
    die("QUERY ERROR: " . $con->error);
}
$stmt->bind_param("sss", $nickname, $nickname, $password);

$stmt->execute();

$stmt->bind_result($count);
$stmt->fetch();
$stmt->close();

if ($count > 0) {
    $con->close();
    header('Location:/ocs/game/html/home.html');
    exit;
} else {
    header('Location: ../html/login.html');
}

$con->close();
?>
