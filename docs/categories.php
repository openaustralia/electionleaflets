<?php
require_once('init.php');

class categories_page extends pagebase {

	//bind
	function bind() {
		$this->page_title = "Election leaflets by category";

		$search = factory::create('search');

		//get top parties
        $categories = $search->search_cached("category", 
                array(array("1", "=", "1")),
                "AND",
                null,
                array(array("name", "ASC"))
            );
        $this->assign("categories", $categories);
	}
	
	
}

//create class instance
$categories_page = new categories_page();

?>
