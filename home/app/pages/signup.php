<?php
require("../../config.php");
$email = "";
$pass = "";
$name = "";
if( isset($_POST['useremail']) ) {
	$email = $_POST['useremail'];
}
if( isset($_POST['userpass']) ) {
	$pass = $_POST['userpass'];
}
if( isset($_POST['username']) ) {
	$name = $_POST['username'];
}
if( $email && $pass && $name ) {
	$sql = "insert into users set ";
	$sql .= "email='{$email}'";
	$sql .= ",username='{$name}'";
	$sql .= ",pass=password('{$pass}')";
	$sql .= ",lastlogin=now()";
	$db->query($sql);

	header('Location: /home/app/pages/login.php');
}
exit;