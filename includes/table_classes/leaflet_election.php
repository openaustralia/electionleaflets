<?php

/**
 * Table Definition for an leaflet election
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_leaflet_election extends tablebase {

    public $__table = 'leaflet_election ';
    public $leaflet_election_id;
    public $leaflet_id;
    public $election_id;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet_election',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'leaflet_election_id'   	=> DB_DATAOBJECT_INT,
            'leaflet_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'election_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"leaflet_id" => "leaflet:leaflet_id",
			"election_id" => "election:election_id"			
			);        
	}

	/* Keys */
    function keys() {
        return array('leaflet_election_id');
    }

}