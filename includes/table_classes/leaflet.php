<?php

/**
 * Table Definition for an leaflet
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_leaflet extends tablebase {

    public $__table = 'leaflet';
    public $leaflet_id;
    public $title;
    public $description;
    public $publisher_party_id;
    public $postcode;
    public $lng;
    public $lat;
    public $name;
    public $email;        
    public $date_uploaded;    
    public $date_delivered;    
    public $live;
    
    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'leaflet_id'   	=> DB_DATAOBJECT_INT,
            'title'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'description'   			=> DB_DATAOBJECT_STR,
            'publisher_party_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'postcode'   			=> DB_DATAOBJECT_STR,
            'lng'   			=> DB_DATAOBJECT_INT,
            'lat'   			=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'email'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'date_uploaded'   			=> DB_DATAOBJECT_TIMESTAMP,
            'date_delivered'   			=> DB_DATAOBJECT_STR,
            'live'   			=> DB_DATAOBJECT_BOOL                        
        );
    }

	/* Links */
	public function links (){
	    return array(
			"publisher_party_id" => "party:party_id",
			);        
	}

	/* Keys */
    function keys() {
        return array('leaflet_id');
    }

    public function count_live($cache = true, $election_id=null){

	if ($election_id === null) {
		$election_id = CURRENT_ELECTION;
	} else {
		$election_id = int($election_id);
	}

        $return = array();
	$sql  = "SELECT COUNT(leaflet.leaflet_id) AS count FROM leaflet JOIN leaflet_election ON leaflet.leaflet_id = leaflet_election.leaflet_id WHERE leaflet.live = 1 AND leaflet_election.election_id = $election_id";
        if($cache){
            $return = $this->execute_cached($sql);
        }else{
            $return = $this->execute($sql);
        }
        return $return[0]->count;
    }


}
