<?php

/**
 * Table Definition for a promise
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_promise extends tablebase {

    public $__table = 'promise';
    public $promise_id;
    public $leaflet_id;
    public $detail;


    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_promise',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'promise_id'   	=> DB_DATAOBJECT_INT,
            'leaflet_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'detail'  => DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"leaflet_id" => "leaflet:leaflet_id"
			);	    
	}

	/* Keys */
    function keys() {
        return array('promise_id');
    }

}