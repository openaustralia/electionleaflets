<?php

/**
 * Table Definition for an leaflet
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_leaflet extends tablebase {

    public $__table = 'leaflet';
    public $leaflet_id;
    public $title;
    public $description;
    public $pubisher_party_id;
    public $election_id;    
    public $postcode;
    public $location;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'leaflet_id'   	=> DB_DATAOBJECT_INT,
            'title'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'description'   			=> DB_DATAOBJECT_STR,
            'pubisher_party_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'election_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,            
            'postcode'   			=> DB_DATAOBJECT_STR,
            'location'   			=> DB_DATAOBJECT_POINT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"pubisher_party_id" => "party:party_id",
			"election_id" => "election:election_id"			
			);        
	}

	/* Keys */
    function keys() {
        return array('leaflet_id');
    }

}