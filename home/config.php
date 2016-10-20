<?php
session_start();
define("SITE_ROOT", "http://localhost/home");
define("PATH_ROOT", __DIR__);
define("CSS", SITE_ROOT . "/css/");
define("JS", SITE_ROOT . "/js/");
define("IMG", SITE_ROOT . "/img/");
define("APP", PATH_ROOT . "/app/");
define("TMPL", APP . "templates/");
define("PAGES", APP . "pages/");

$member = array();
$member['userid'] = "";
$member['username'] = "";
$member['userlogin'] = false;
if( isset($_SESSION['userid']) )
	$member['userid'] = $_SESSION['userid'];
if( isset($_SESSION['username']) )
	$member['username'] = $_SESSION['username'];
if( isset($_SESSION['userlogin']) )
	$member['userlogin'] = $_SESSION['userlogin'];

try {
	$db = new PDO("mysql:host=localhost; dbname=home; charset=utf8", "root", "");
}
catch(PDOException $e) {
	header('Location:/home/app/templates/404.php');
}