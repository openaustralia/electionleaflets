<?php

/**
 * Table Definition for an constituency
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_constituency extends tablebase {

    public $__table = 'constituency';
    public $category_id;
    public $name;
    public $election_type_id;


    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_constituency',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'constituency_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'election_type_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,            
        );
    }

	/* Links */
	public function links (){
	    return array(
			"election_type_id" => "election_type:election_type_id"
			);
	}

	/* Keys */
    function keys() {
        return array('constituency_id');
    }

}