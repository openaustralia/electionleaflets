<?php
require_once('init.php');

class leaflet_page extends pagebase {


	//bind
	function bind() {
		$this->page_title = "Welcome";				
	}

}

//create class instance
$leaflet_page = new leaflet_page();

?>
