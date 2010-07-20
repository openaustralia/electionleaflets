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

	public static function lookup_constituency_names($postcode){
	    $search = factory::create('search');
		$constituencies = $search->search("australian_postcode", 
		    array(array('postcode', '=', $postcode)),
		    'AND',
		    null,
		    array(array('constituency', "ASC"))
		);
		$result = array();
		foreach($constituencies as $c) {
		    $result[] = $c->constituency;
	    }
		return $result;
    }

	/* Links */
	public function links (){
	}

	/* Keys */
    function keys() {
        return array('postcode');
    }

}