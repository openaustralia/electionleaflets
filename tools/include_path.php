<?php
	//get config file

 	require_once("/data/vhost/thestraightchoice.org/config/general.php");//TODO this is hardcodes, bad!
    //require_once("/data/vhost/electionleaflet/config/general.php");//TODO this is hardcodes, bad!
    
	//set include path
	$include_path = ".:";
	$include_path .= INCLUDE_DIR . ":";
	$include_path .= CONFIG_DIR . ":";
	$include_path .= INCLUDE_DIR . "/PEAR:";

	//$include_path .= get_include_path();

	set_include_path($include_path);
?>