<?php
$con = mysqli_connect("localhost","root","root","ocs");
if(!$con){
    trigger_error(mysqli_connect_error());
}
?>