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
	
	public function category_count($date_since, $limit = 10, $cache = true){
        $return = array();
	    $category = factory::create('category');
	    $sql = "select count(leaflet_category.leaflet_category_id) as count, category.name, category.category_id from category inner join leaflet_category on category.category_id = leaflet_category.category_id inner join leaflet on leaflet_category.leaflet_id = leaflet.leaflet_id where date_delivered > '$date_since' and publisher_party_id = $this->party_id group by category.name, category.category_id order by count(leaflet_category.leaflet_category_id) desc limit " . $limit;
	    
	    if($cache){
            $return = $category->execute_cached($sql);
        }else{
            $return = $category->execute($sql);            
        }
        return $return;	    
    }
	
	public function get_rate_values($date_since, $cache = true){

	    $return = array();
        $rate_value = factory::create('rate_value');
        $sql = "
        select left_label, right_label, avg(value) as average
        from rate_value
            inner join rate_type on rate_value.rate_type_id = rate_type.rate_type_id
            inner join leaflet on rate_value.leaflet_id = leaflet.leaflet_id
        where publisher_party_id = $this->party_id and date_delivered > '$date_since'
        group by left_label, right_label
        ";

        if($cache){
            $return = $rate_value->execute_cached($sql);
        }else{
            $return = $rate_value->execute($sql);            
        }
        
        return $return;
    }

    public function constituency_count($date_since, $limit = 10, $cache = true){
        $return = array();
	    $constituency = factory::create('constituency');
	    $sql = "select count(leaflet_constituency.leaflet_constituency_id) as count, constituency.name,constituency.url_id, constituency.constituency_id from constituency inner join leaflet_constituency on constituency.constituency_id = leaflet_constituency.constituency_id inner join leaflet on leaflet_constituency.leaflet_id = leaflet.leaflet_id where date_delivered > '$date_since' and publisher_party_id = $this->party_id group by constituency.name, constituency.constituency_id order by count(leaflet_constituency.leaflet_constituency_id) desc limit " . $limit;
	    if($cache){
            $return = $constituency->execute_cached($sql);
        }else{
            $return = $constituency->execute($sql);            
        }
        return $return;
    }
	
	public static function get_party_count($date_since, $limit = 10, $cache = true){
	    $return = array();
	    $party = factory::create('party');
	    $sql = "select party.name, party.party_id, party.url_id, party.colour, count(leaflet_id) as count from leaflet inner join party on leaflet.publisher_party_id = party.party_id where date_uploaded > '$date_since' group by party.name, party.party_id, party.colour order by count(leaflet_id)  desc limit " . $limit;
	    if($cache){
            $return = $party->execute_cached($sql);
        }else{
            $return = $party->execute($sql);            
        }
        
        return $return;
    }
	
}