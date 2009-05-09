<?php
require_once('init.php');

class parties_page extends pagebase {

	//bind
	function bind() {
		$this->page_title = "Election leaflets by party";

		$search = factory::create('search');

		//get top parties
        $parties = $search->search_cached("party", 
                array(array("1", "=", "1")),
                "AND",
                null,
                array(array("name", "ASC"))
            );
        $this->assign("parties", $parties);
	}
	
	
}

//create class instance
$parties_page = new parties_page();

?>
