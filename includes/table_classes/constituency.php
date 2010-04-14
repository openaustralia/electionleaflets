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

	public static function get_not_spots($limit = 10, $cache = true){
        $return = array();
	    $constituency = factory::create('constituency');
	    $sql = "select constituency.name, constituency.constituency_id from constituency left outer join leaflet_constituency on constituency.constituency_id = leaflet_constituency.constituency_id where leaflet_constituency.constituency_id is null group by constituency.name, constituency.constituency_id limit " . $limit;
	    if($cache){
            $return = $constituency->execute_cached($sql);
        }else{
            $return = $constituency->execute($sql);            
        }
        return $return;
    }
    
    public static function constituency_count($date_since, $limit = 10, $cache = true){
        $return = array();
	    $constituency = factory::create('constituency');
	    $sql = "select count(leaflet_constituency.leaflet_constituency_id) as count, constituency.name, constituency.constituency_id from constituency inner join leaflet_constituency on constituency.constituency_id = leaflet_constituency.constituency_id inner join leaflet on leaflet_constituency.leaflet_id = leaflet.leaflet_id where date_uploaded > '$date_since' group by constituency.name, constituency.constituency_id order by count(leaflet_constituency.leaflet_constituency_id) desc limit " . $limit;
	    if($cache){
            $return = $constituency->execute_cached($sql);
        }else{
            $return = $constituency->execute($sql);            
        }
        return $return;
    }
    
    
}