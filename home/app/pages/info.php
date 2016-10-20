<?php
require("../../config.php");
$email="";
$pass="";
$name="";
if(isset($_POST['username'])) {
	$name=$_POST['username'];
}
if(isset($_POST['useremail'])) {
	$email=$_POST['useremail'];
}
if(isset($_POST['userpass'])) {
	$pass=$_POST['userpass'];
}
if($email && $pass && $name ) {
	$sql = "update users set ";
	$sql .= "email='{$email}'";
	$sql .= ",username='{$name}'";
	$sql .= ",pass=password('{$pass}')";
	$sql .= ",lastlogin=now()";
	$sql .= " where email='{$member['userid']}'";
	
	if($db->query($sql)) {
		$_SESSION['userid']=$email;
		$_SESSION['username']=$name;
		$_SESSION['userlogin']=true;
	}
}
header('Location:/home/');
exit;