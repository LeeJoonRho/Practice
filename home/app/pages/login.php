<?php
require("../../config.php");
$email="";
$pass="";
if(isset($_POST['email'])) {
	$email=$_POST['email'];
}
if(isset($_POST['pass'])) {
	$pass=$_POST['pass'];
}
$sql = "select * from users where email='{$email}' and pass=password('{$pass}')";
if($rs=$db->query($sql)) {
	if( $user = $rs->fetch() ) {
		$_SESSION['userid']=$user['email'];
		$_SESSION['username']=$user['username'];
		$_SESSION['userlogin']=true;
	}
}
header('Location:/home/');
exit;