<?php

/**
 * Table Definition for an election
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_election extends tablebase {

    public $__table = 'election';
    public $election_id;
    public $name;
    public $election_type_id;


    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_election',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'election_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'election_type_id'  => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
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
        return array('election_id');
    }

}