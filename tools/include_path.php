<?php
	//get config file

 	require_once(dirname(__FILE__) . "../config/general.php");

	//set include path
	$include_path = ".:";
	$include_path .= INCLUDE_DIR . ":";
	$include_path .= CONFIG_DIR . ":";
	$include_path .= INCLUDE_DIR . "/PEAR:";

	//$include_path .= get_include_path();

	set_include_path($include_path);
?>