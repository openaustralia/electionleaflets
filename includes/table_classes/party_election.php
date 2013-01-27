<?php

/**
 * Table Definition for a party to election link
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_party_election extends tablebase {

    public $__table = 'party_election';
    public $party_election_id;
    public $party_id;
    public $election_id;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_party_election',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'party_election_id' => DB_DATAOBJECT_INT,
            'party_id'   			  => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'election_id'         => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"party_id" => "party:party_id",
			"election_id" => "election:election_id"
			);
	}

	/* Keys */
    function keys() {
        return array('party_election_id');
    }

    /* Tells DB_DataObject that there is an autoincrementing key
    * and not to use those stupid sequence tables
    */
    function sequenceKey() {
        return array('party_election_id', TRUE);
    }
}
