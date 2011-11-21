<?php

/**
 * Table Definition for a category to election link
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_category_election extends tablebase {
  public $__table = 'category_election';
  public $category_election_id;
  public $category_id;
  public $election_id;

  /* Static get */
  function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_category_election',$k,$v); }

	/* Definition */
  function table() {
    return array(
      'category_election_id' => DB_DATAOBJECT_INT,
      'category_id'   			 => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
      'election_id'          => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
    );
  }

	/* Links */
	public function links (){
    return array(
      "category_id" => "category:category_id",
      "election_id" => "election:election_id"
    );
	}

	/* Keys */
  function keys() {
    return array('category_election_id');
  }
}
