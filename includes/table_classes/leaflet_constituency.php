<?php

/**
 * Table Definition for a leaflet to constituency link
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_leaflet_constituency extends tablebase {

    public $__table = 'leaflet_constituency';
    public $leaflet_constituency_id;
    public $leaflet_id;
    public $constituency_id;    

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet_constituency',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'leaflet_constituency_id'   => DB_DATAOBJECT_INT,
            'leaflet_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'constituency_id'           => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"leaflet_id" => "leaflet:leaflet_id",
			"constituency_id" => "constituency:constituency_id"			
			);
	}

	/* Keys */
    function keys() {
        return array('leaflet_constituency_id');
    }

}