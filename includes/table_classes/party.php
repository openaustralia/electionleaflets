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
    public $logo_file;
    public $url_id;
    public $colour;    
    public $twitter_account;        

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_party',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'party_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'country_id'  => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'major'  => DB_DATAOBJECT_BOOL,
            'logo_file' => DB_DATAOBJECT_STR,
            'url_id' => DB_DATAOBJECT_STR,            
            'colour' => DB_DATAOBJECT_STR,               
            'twitter_account' => DB_DATAOBJECT_STR,                           
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

    /* Tells DB_DataObject that there is an autoincrementing key
    * and not to use those stupid sequence tables
    */
    function sequenceKey() {
        return array('party_id', TRUE);
    }

    //overrride insert to create a url id
    public function insert (){

		$this->url_id = $this->generate_url_id($this->name);

		$saved = parent::insert();

		//if url_id ended up fase, then set it to the ID
		if($this->url_id == false){
			$this->url_id = $this->id;
			$this->update();
		}

		return $saved;
	}
	
	public function get_category_count($date_since, $limit = 10, $cache = true, $election_id = null){
 	$election_id = get_election_id($election_id);
        $return = array();
	    $category = factory::create('category');
	    $sql  = "SELECT COUNT(leaflet_category.leaflet_category_id) AS count, category.name, category.category_id FROM category ";
	    $sql .= "INNER JOIN leaflet_category ON category.category_id = leaflet_category.category_id ";
	    $sql .= "INNER JOIN leaflet ON leaflet_category.leaflet_id = leaflet.leaflet_id ";
            $sql .= "INNER JOIN leaflet_election ON leaflet.leaflet_id = leaflet_election.leaflet_id ";
            $sql .= "WHERE leaflet_election.election_id = $election_id ";
	    $sql .= "GROUP BY category.name, category.category_id ORDER BY count(leaflet_category.leaflet_category_id) DESC LIMIT " . $limit;
	    
	    if($cache){
            $return = $category->execute_cached($sql);
        }else{
            $return = $category->execute($sql);            
        }
        return $return;	    
    }
	
	public function get_rate_values($date_since, $cache = true, $election_id = null){
 	$election_id = get_election_id($election_id);

	    $return = array();
        $rate_value = factory::create('rate_value');
        $sql  = "SELECT left_label, right_label, avg(value) AS average FROM rate_value ";
        $sql .= "INNER JOIN rate_type ON rate_value.rate_type_id = rate_type.rate_type_id ";
        $sql .= "INNER JOIN leaflet ON rate_value.leaflet_id = leaflet.leaflet_id ";
        $sql .= "INNER JOIN leaflet_election ON leaflet.leaflet_id = leaflet_election.leaflet_id ";
        $sql .= "WHERE date_delivered > '$date_since' AND leaflet.live=1 AND leaflet_election.election_id = $election_id ";
        $sql .= "AND publisher_party_id = $this->party_id ";
        $sql .= "GROUP BY left_label, right_label";

        if($cache){
            $return = $rate_value->execute_cached($sql);
        }else{
            $return = $rate_value->execute($sql);            
        }
        
        return $return;
    }

    public function get_constituency_count($date_since, $limit = 10, $cache = true, $election_id = null){
 	$election_id = get_election_id($election_id);
        $return = array();
	    $constituency = factory::create('constituency');
	    $sql  = "SELECT COUNT(leaflet_constituency.leaflet_constituency_id) AS count, constituency.name,constituency.url_id, constituency.constituency_id FROM constituency ";
	    $sql .= "INNER JOIN leaflet_constituency on constituency.constituency_id = leaflet_constituency.constituency_id ";
	    $sql .= "INNER JOIN leaflet ON leaflet_constituency.leaflet_id = leaflet.leaflet_id ";
            $sql .= "INNER JOIN leaflet_election ON leaflet.leaflet_id = leaflet_election.leaflet_id ";
            $sql .= "WHERE date_delivered > '$date_since' AND leaflet.live=1 AND leaflet_election.election_id = $election_id ";
	    $sql .= "AND publisher_party_id = $this->party_id ";
	    $sql .= "GROUP BY constituency.name, constituency.constituency_id ORDER BY count(leaflet_constituency.leaflet_constituency_id) desc limit " . $limit;
	    if($cache){
            $return = $constituency->execute_cached($sql);
        }else{
            $return = $constituency->execute($sql);            
        }
        return $return;
    }
	
	public function get_party_count($date_since, $limit = 10, $cache = true){
 	    $election_id = get_election_id($election_id);
	    $return = array();
	    $party = factory::create('party');
	    $sql  = "SELECT party.name, party.party_id, party.url_id, party.colour, COUNT(leaflet.leaflet_id) as count FROM leaflet ";
	    $sql .= "INNER JOIN party on leaflet.publisher_party_id = party.party_id ";
            $sql .= "INNER JOIN leaflet_election ON leaflet.leaflet_id = leaflet_election.leaflet_id ";
            $sql .= "WHERE date_uploaded > '$date_since' AND leaflet.live=1 AND leaflet_election.election_id = $election_id ";
	    $sql .= "GROUP BY party.name, party.party_id, party.colour ";
	    $sql .= "ORDER BY COUNT(leaflet.leaflet_id) DESC LIMIT " . $limit;
	    if($cache){
            $return = $party->execute_cached($sql);
        }else{
            $return = $party->execute($sql);            
        }
        
        return $return;
    }

}
