<?php

/**
 * Table Definition for an leaflet category
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_leaflet_tag extends tablebase {

    public $__table = 'leaflet_tag';
    public $leaflet_id;
    public $tag_id;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet_tag',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'leaflet_tag_id'   => DB_DATAOBJECT_INT,
            'leaflet_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'tag_id'           => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"leaflet_id" => "leaflet:leaflet_id",
			"tag_id" => "tag:tag_id"
			);
	}

	/* Keys */
    function keys() {
        return array('leaflet_tag_id');
    }

}