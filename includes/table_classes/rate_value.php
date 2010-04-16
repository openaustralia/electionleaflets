<?php
require_once('init.php');
require_once ('tablebase.php');

class tableclass_rate_value extends tablebase {

    public $__table = 'rate_value';
    public $rate_value_id;
    public $leaflet_id;
    public $user_name;
    public $user_email;
    public $rate_type_id;        
    public $value;    

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_rate_value',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'rate_value_id'   	=> DB_DATAOBJECT_INT,
            'leaflet_id'   	=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,            
            'user_name'  => DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'user_email'  => DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,            
            'rate_type_id'    	=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,            
            'value'    	=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,                        
        );
    }

	/* Keys */
    function keys() {
        return array('rate_value_id');
    }

}