<?php
require_once('init.php');
require_once ('tablebase.php');

class tableclass_rate_interesting extends tablebase {

    public $__table = 'rate_interesting';
    public $rate_interesting_id;
    public $leaflet_id;
    public $user_name;
    public $user_email;
    public $description;        

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_rate_interesting',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'rate_interesting_id'   	=> DB_DATAOBJECT_INT,
            'leaflet_id'   	=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,            
            'user_name'  => DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'user_email'  => DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,            
            'description'    	=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,                        
        );
    }

	/* Keys */
    function keys() {
        return array('rate_interesting_id');
    }
    
    /* Links */
	public function links (){
	    return array(
			"leaflet_id" => "leaflet:leaflet_id"		
			);        
	}
   
}