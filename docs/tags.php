<?php
require_once('init.php');

class tags_page extends pagebase {

	//bind
	function bind() {
		$this->page_title = "Election leaflets by tag";

		$search = factory::create('search');

        $tag = factory::create("tag");
        $tag_count = 250;
        $weighted_tags = $tag->get_weighted_tags($tag_count);
        $this->assign("weighted_tags", $weighted_tags);
	}
	
	
}

//create class instance
$tags_page = new tags_page();

?>
