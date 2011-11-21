<?php
require_once('init.php');

class categories_page extends pagebase {
  // Bind
  function bind() {
    $this->page_title = "Election leaflets by category";
    $search = factory::create('search');
    $election_id = get_election_id();

    // Get categories
    $categories = $search->search_cached("category",
      array(array("category_election.election_id", "=", $election_id)),
      'AND',
      array(array("category_election", "inner")),
      array(array('name', "ASC"))
		);
    $this->assign("categories", $categories);
  }
}

// Create class instance
$categories_page = new categories_page();
?>
