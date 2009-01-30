<?php

/**
 * Table Definition for an category
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_category extends tablebase {

    public $__table = 'category';
    public $category_id;
    public $name;
    public $description;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_category',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'category_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'description'   			=> DB_DATAOBJECT_STR            
        );
    }

	/* Links */
	public function links (){
	}

	/* Keys */
    function keys() {
        return array('category_id');
    }

}