<?php

/**
 * Table Definition for an leaflet
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_australian_postcode extends tablebase {

    public $__table = 'australian_postcode';
    public $postcode;
    public $constituency;
    
    /* Static get */
    //function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'postcode'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'constituency'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	}

	/* Keys */
    function keys() {
        return array('postcode');
    }

}