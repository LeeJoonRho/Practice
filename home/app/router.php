<?php
$url = array("");
$page = "";
$file = "";
if(isset($_GET['url'])) {
	$url = explode("/" , $_GET['url']);
}
if( $url[0]) {
	$page = $url[0];
}
else {
	$page = "home";
}
if( $page ) {
	$file = PAGES . $page . ".php";
	if( ! file_exists($file)) {
		$file = TMPL . "404.php";
	}
}