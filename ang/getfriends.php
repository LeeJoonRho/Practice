<?php
$host = "mysql:host=localhost; dbname=myfriends; charset=utf8";
$db = new PDO($host, "root", "");
$sql="select * from myfriends";
$data="";
if($rs=$db->query($sql)) {
	if($rows=$rs->fetchALL(PDO::FETCH_ASSOC)) {
		$data=json_encode($rows, JSON_UNESCAPED_UNICODE);
	}
}
echo $data;