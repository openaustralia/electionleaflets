<?php

require_once ("init.php");

class application {

	
	public function __construct(){


	}
	
	public function save(){
		session_write('application', $this);	
	}
	
}

?>