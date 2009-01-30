<?php

/**
 * Table Definition for an leaflet category
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_leaflet_category extends tablebase {

    public $__table = 'leaflet_category';
    public $leaflet_id;
    public $category_id;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet_category',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'leaflet_category_id'   => DB_DATAOBJECT_INT,
            'leaflet_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'category_id'           => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"leaflet_id" => "leaflet:leaflet_id",
			"category_id" => "category:category_id"			
			);
	}

	/* Keys */
    function keys() {
        return array('leaflet_category_id');
    }

}