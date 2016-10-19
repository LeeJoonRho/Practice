<?php
	require("config.php");
	print_r($member);
	require(APP . "router.php");
	require(TMPL . "header.php");
	if($file)require($file);
	require(TMPL . "footer.php");