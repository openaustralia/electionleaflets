<?php
require_once('init.php');

class browse_page extends pagebase {

	//bind
	function bind() {
		$this->page_title = "Browse election leaflets";

		$search = factory::create('search');

		//get top parties
        $parties = $search->search_cached("party", 
                array(array("major", "=", true)),
                "AND",
                null,
                array(array("name", "ASC"))
            );
        $this->assign("parties", $parties);
        
		//get categories

        $categories = $search->search_cached("category", array(array("1", "=", "1")));
        $this->assign("categories", $categories);

        $constituencies = $search->search_cached("constituency", array(array("1", "=", "1")));
        $this->assign("constituencies", $constituencies);

		//get top tags
        $tag = factory::create("tag");
        $weighted_tags = $tag->get_weighted_tags();
        $this->assign("weighted_tags", $weighted_tags);

		//get attack leaflets
		
		
		//
		
	}
	
	
}

//create class instance
$browse_page = new browse_page();

?>
