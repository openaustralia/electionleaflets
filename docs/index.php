<?php
require_once('init.php');

class index_page extends pagebase {


	//bind
	function bind() {
		$this->page_title = "Welcome";				
	}

}

//create class instance
$index_page = new index_page();

?>
