<?php

require_once('init.php');
require_once ('tablebase.php');

class tableclass_rate_type extends tablebase {

    public $__table = 'rate_type';
    public $rate_type_id;
    public $left_label;
    public $right_label;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_rate_type',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'rate_type_id'   	=> DB_DATAOBJECT_INT,
            'left_label'  => DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'right_label'  => DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,            
        );
    }

	/* Keys */
    function keys() {
        return array('rate_type_id');
    }

}