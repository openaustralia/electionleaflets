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
    public $default_value;    

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_category',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'category_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'description'   			=> DB_DATAOBJECT_STR,
            'default_value'   			=> DB_DATAOBJECT_BOOL            
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