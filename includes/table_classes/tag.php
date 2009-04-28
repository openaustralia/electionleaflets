<?php

/**
 * Table Definition for a tag
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_tag extends tablebase {

    public $__table = 'tag';
    public $tag_id;
    public $tag;


    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_tag',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'tag_id'   	=> DB_DATAOBJECT_INT,
            'tag'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    
	}

	/* Keys */
    function keys() {
        return array('tag_id');
    }

}