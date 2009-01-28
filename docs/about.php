<?php
require_once('init.php');

class about_page extends pagebase {


	//bind
	function bind() {
		$this->page_title = "About";				
	}

}

//create class instance
$about_page = new about_page();

?>
