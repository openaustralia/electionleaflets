<?php

/**
 * Table Definition for an election type
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_election_type extends tablebase {

    public $__table = 'election_type';
    public $category_id;
    public $name;
    public $country_id;


    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_election_type',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'election_type_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'country_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"country_id" => "country:country_id"
			);	    
	}

	/* Keys */
    function keys() {
        return array('election_type_id');
    }

}