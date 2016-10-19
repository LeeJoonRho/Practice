<?php
session_start();
$_SESSION['userid']="test@test.com";
$_SESSION['username']="홍길동";
$_SESSION['userlogin']=true;
header('Location:/home/');
exit;