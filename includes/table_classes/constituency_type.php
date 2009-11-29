<?php

/**
 * Table Definition for an constituency type
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_constituency_type extends tablebase {

    public $__table = 'constituency_type';
    public $constituency_type_id;
    public $name;


    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_constituency',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'constituency_type_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL
        );
    }


	/* Keys */
    function keys() {
        return array('constituency_type_id');
    }

}