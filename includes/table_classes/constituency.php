<?php

/**
 * Table Definition for an constituency
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_constituency extends tablebase {

    public $__table = 'constituency';
    public $constituency_id;
    public $name;
    public $alternative_name;    
    public $constituency_type_id;
    public $retired;
    public $area_code; //national area code (where such a system is present)
    public $area_uri; //a URI describing the cosntituency (where present)
    public $wikipedia_url; //link to teh wikipedia page describing the constituency
    public $url_id;
    public $guardian_aristotle_id;
    public $guardian_pa_code;
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
            'area_code'   			=> DB_DATAOBJECT_STR,                     
            'area_uri'   			=> DB_DATAOBJECT_STR,                                 
            'wikipedia_url'   			=> DB_DATAOBJECT_STR,                                             
            'url_id'   			=> DB_DATAOBJECT_STR,                     
            'guardian_aristotle_id'   			=> DB_DATAOBJECT_INT,                     
            'guardian_pa_code'   			=> DB_DATAOBJECT_INT,                                             
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

    /* Tells DB_DataObject that constituency_id is an autoincrementing key
     * and not to use those stupid sequence tables
     */
    function sequenceKey() {
        return array('constituency_id', TRUE);
    }

    //overrride insert to create a url id
    public function insert(){

		$this->url_id = $this->generate_url_id($this->name);
		
		$saved = parent::insert();
			
		//if url_id ended up fase, then set it to the ID
		if($this->url_id == false){
			$this->url_id = $this->id;
			$this->update();
		}
		
		return $saved;
	}

	public static function get_not_spots($limit = 10, $cache = true, $election_id = null){
	$election_id = get_election_id($election_id);

        $return = array();
	    $constituency = factory::create('constituency');
	    $sql = "SELECT constituency.name, constituency.url_id, constituency.constituency_id FROM constituency LEFT OUTER JOIN leaflet_constituency ON constituency.constituency_id = leaflet_constituency.constituency_id INNER JOIN constituency_election ON constituency.constituency_id = constituency_election.constituency_id WHERE leaflet_constituency.constituency_id IS null AND constituency_election.election_id = $election_id GROUP BY constituency.name, constituency.constituency_id, constituency.url_id LIMIT " . $limit;

	    if($cache){
            $return = $constituency->execute_cached($sql);
        }else{
            $return = $constituency->execute($sql);            
        }
        return $return;
    }

    public static function get_constituency_count($date_since, $limit = 10, $cache = true, $election_id = null){
	$election_id = get_election_id($election_id);

        $return = array();
	    $constituency = factory::create('constituency');
	    $sql  = "SELECT COUNT(leaflet_constituency.leaflet_constituency_id) AS count, constituency.name, constituency.url_id, constituency.constituency_id FROM constituency ";
	    $sql .= "INNER JOIN leaflet_constituency ON constituency.constituency_id = leaflet_constituency.constituency_id ";
	    $sql .= "INNER JOIN leaflet ON leaflet_constituency.leaflet_id = leaflet.leaflet_id ";
	    $sql .= "INNER JOIN leaflet_election ON leaflet_election.leaflet_id = leaflet.leaflet_id ";
	    $sql .= "WHERE date_delivered > '$date_since' AND leaflet.live=1 AND leaflet_election.election_id = $election_id ";
	    $sql .= "GROUP By constituency.name, constituency.constituency_id ";
	    $sql .= "ORDER BY count(leaflet_constituency.leaflet_constituency_id) desc limit " . $limit;
	    if($cache){
            $return = $constituency->execute_cached($sql);
        }else{
            $return = $constituency->execute($sql);            
        }
        return $return;
    }
    
    
}
