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
            'election_id' 			=> DB_DATAOBJECT_INT,
            'postcode'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'constituency'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL
        );
    }

	public static function lookup_constituency_names($postcode, $election_id = null){
            $election_id = get_election_id($election_id);
	    $search = factory::create('search');
		$constituencies = $search->search("australian_postcode", 
		    array(array('postcode', '=', $postcode),
                          array('election_id', '=', $election_id)),
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

  # Returns an example postcode for the current election so we can provide a
  # suggestion to the user
  public static function example_postcode(){
    $election_id = get_election_id($election_id);
    $search = factory::create('search');
    $result = $search->search("australian_postcode",
      array(array('election_id', '=', $election_id)),
      null,
      null,
      null,
      1
    );
    return $result[0]->postcode;
  }

	/* Links */
	public function links (){
	    return array(
			"election_id" => "election:election_id"
			);
	}

	/* Keys */
    function keys() {
        return array('postcode');
    }

}
