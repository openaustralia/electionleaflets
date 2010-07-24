<?php
require_once('init.php');

class browse_page extends pagebase {

	//bind
	function bind() {
		$this->page_title = "Browse election leaflets";

		$search = factory::create('search');

	//get top parties
		$parties_counts = tableclass_party::get_party_count(STAT_ZERO_DATE);
		$this->assign("parties_counts",$parties_counts);

	//get categories
		$categories_counts = tableclass_category::get_category_count(STAT_ZERO_DATE);
		$this->assign("categories_counts",$categories_counts);

	//get electorates
		$constituencies_counts = tableclass_constituency::get_constituency_count(STAT_ZERO_DATE);
		$this->assign("constituencies_counts",$constituencies_counts);

	//get top tags
		$tag = factory::create("tag");
		$weighted_tags = $tag->get_weighted_tags();
		$this->assign("weighted_tags", $weighted_tags);
	}
}

//create class instance
$browse_page = new browse_page();

?>
