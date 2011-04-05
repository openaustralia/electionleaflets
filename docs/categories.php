<?php
require_once('init.php');

class categories_page extends pagebase {
  // Bind
  function bind() {
    $this->page_title = "Election leaflets by category";
    $search = factory::create('search');

    // Get categories
    $categories = $search->search_cached("category",
      array(array("1", "=", "1")),
      "AND",
      null,
      array(array("name", "ASC"))
    );
    $this->assign("categories", $categories);
  }
}

// Create class instance
$categories_page = new categories_page();
?>
