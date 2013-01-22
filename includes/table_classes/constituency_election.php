<?php

/**
 * Table Definition for a constituency to election link
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_constituency_election extends tablebase {

    public $__table = 'constituency_election';
    public $constituency_election_id;
    public $constituency_id;
    public $election_id;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_constituency_election',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'constituency_election_id' => DB_DATAOBJECT_INT,
            'constituency_id'   			  => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'election_id'         => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"constituency_id" => "constituency:constituency_id",
			"election_id" => "election:election_id"
			);
	}

	/* Keys */
    function keys() {
        return array('constituency_election_id');
    }

    /* Tells DB_DataObject that constituency_election_id is an autoincrementing key
     * and not to use those stupid sequence tables
     */
    function sequenceKey() {
        return array('constituency_election_id', TRUE);
    }
}
