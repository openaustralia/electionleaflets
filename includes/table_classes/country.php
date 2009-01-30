<?php

/**
 * Table Definition for an country
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_country extends tablebase {

    public $__table = 'country';
    public $country_id;
    public $name;
    public $iso;
    public $iso3;    


    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_country',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'country_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'iso'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'iso3'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL                        
        );
    }

	/* Links */
	public function links (){
	}

	/* Keys */
    function keys() {
        return array('country_id');
    }

}