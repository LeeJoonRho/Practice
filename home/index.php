<?php
	require("config.php");
	require(APP . "router.php");
	require(TMPL . "header.php");
	if($file)require($file);
	require(TMPL . "footer.php");