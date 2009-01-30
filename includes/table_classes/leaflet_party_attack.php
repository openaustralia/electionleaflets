<?php

/**
 * Table Definition for a leaflet party attack
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_leaflet_party_attack extends tablebase {

    public $__table = 'leaflet_party_attack';
    public $leaflet_id;
    public $party_id;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet_party_attack',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'leaflet_party_attack_id'   => DB_DATAOBJECT_INT,
            'leaflet_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'party_id'           => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"leaflet_id" => "leaflet:leaflet_id",
			"party_id" => "party:party_id"			
			);
	}

	/* Keys */
    function keys() {
        return array('leaflet_party_attack_id');
    }

}