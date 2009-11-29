<?php

/**
 * Table Definition for an constituency
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_constituency extends tablebase {

    public $__table = 'constituency';
    public $category_id;
    public $name;
    public $alternative_name;    
    public $constituency_type_id;
    public $retired;
    public $area_code; //national area code (where such a system is present)
    public $area_uri; //a URI describing the cosntituency (where present)
    public $wikipedia_url; //link to teh wikipedia page describing the constituency



    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_constituency',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'constituency_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'alternative_name'   			=> DB_DATAOBJECT_STR,            
            'constituency_type_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,            
            'retired'   			=> DB_DATAOBJECT_BOOL,                        
        );
    }

	/* Links */
	public function links (){
	    return array(
			"constituency_type_id" => "constituency_type:constituency_type_id"
			);
	}

	/* Keys */
    function keys() {
        return array('constituency_id');
    }

}