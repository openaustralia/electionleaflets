<?php

/**
 * Table Definition for an party
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_party extends tablebase {

    public $__table = 'party';
    public $party_id;
    public $name;
    public $country_id;
    public $major;    


    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_party',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'party_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'country_id'  => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'major'  => DB_DATAOBJECT_BOOL,
        );
    }

	/* Links */
	public function links (){
	    return array(
			"country_id" => "country:country_id"
			);	    
	}

	/* Keys */
    function keys() {
        return array('party_id');
    }

}