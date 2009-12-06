<?php

class leaflet_search {

    //properties
    public $search_term = null;
    public $lng = null;
    public $lat = null;
    public $publisher_party_id = null;
    public $party_attack_id = null;
    public $category_id = null;
    public $country_id = 225;
    public $constituency_id = null;
    public $tag = null;    
    
    public $number = null;
    public $start = null;    

    private $search = null;
    private $results = array();

    public function __construct(){
        $this->search = factory::create('search');
    }

    //search
    public function search($cache = false){

        //is geo search?
        if(isset($this->lng) && isset($this->lat)){
            $this->search_geo($cache);
        }else{
            $this->search_standard($cache);            
        }

        return $this->results;

    }
    
    private function search_geo($cache){

        if(!$cache){
            $this->results = $this->search->search_proximity("leaflet",
                $this->get_where_clauses(), 
                $this->lng,
                $this->lat,
                MAX_DISTANCE_SEARCH,
                'AND',
                $this->get_joins(),
                array(array("distance", "ASC")),
                $this->number,
                $this->start
            );
        }else{
            $this->results = $this->search->search_cached("leaflet",
                $this->get_where_clauses(), 
                'AND', 
                $this->get_joins(),
                array(array("distance", "ASC")),
                $this->number,
                $this->start
            );        
        }
        
    }
    
    private function search_standard($cache){
        if(!$cache){
            $this->results = $this->search->search("leaflet",
                $this->get_where_clauses(), 
                'AND', 
                $this->get_joins(),
                array(array("date_uploaded", "DESC")),
                $this->number,
                $this->start
            );
        }else{
            $this->results = $this->search->search_cached("leaflet",
                $this->get_where_clauses(), 
                'AND', 
                $this->get_joins(),
                array(array("date_uploaded", "DESC")),
                $this->number,
                $this->start
            );        
        }

    }
    
    private function get_joins(){

        $joins = array();

        //required
        array_push($joins, array("leaflet_image", "inner"));
        array_push($joins, array("party", "inner"));        
            
        //optional
        if(isset($this->party_attack_id) && $this->party_attack_id != '' && $this->party_attack_id != 0){
            array_push($joins, array("leaflet_party_attack", "inner"));
        }

        if(isset($this->category_id) && $this->category_id != '' && $this->category_id != 0){
            array_push($joins, array("leaflet_category", "inner", null, array("category", "inner", "category_id")));
        }

        if(isset($this->constituency_id) && $this->constituency_id != '' && $this->constituency_id != 0){
            array_push($joins, array("leaflet_constituency", "inner", null, array("constituency", "inner", "constituency_id")));
        }
        
        if(isset($this->tag) && $this->tag != ''){
            array_push($joins, array("leaflet_tag", "inner", null,array("tag", "inner", "tag_id")));
        }

        return $joins;

    }

    private function get_where_clauses(){

        $where_clauses = array();

        //required
        array_push($where_clauses, array("leaflet_image.sequence", "=", 1));        

        //optional
        if(isset($this->publisher_party_id) && $this->publisher_party_id != '' && $this->publisher_party_id != 0){
            array_push($where_clauses, array("publisher_party_id", "=", $this->publisher_party_id));
        }

        if(isset($this->party_attack_id) && $this->party_attack_id != '' && $this->party_attack_id != 0){
            array_push($where_clauses, array("leaflet_party_attack.party_id", "=", $this->party_attack_id));
        }
        
        if(isset($this->category_id) && $this->category_id != '' && $this->category_id != 0){
            array_push($where_clauses, array("leaflet_category.category_id", "=", $this->category_id));
        }
        
        if(isset($this->constituency_id) && $this->constituency_id != '' && $this->constituency_id != 0){
            array_push($where_clauses, array("leaflet_constituency.constituency_id", "=", $this->constituency_id));
        }

        if(isset($this->tag) && $this->tag != ''){
            array_push($where_clauses, array("tag.tag", "=", $this->tag));
        }
                    
        return $where_clauses;
    }


    //guess search type
    public function guess_search_type($query){
        
        $return_type = "text";
        $return_value = null;
        $return_display = null;
        
        if(is_postcode($query)){
            $return_type = "postcode";
            $return_display = clean_postcode($query);
        }else if (is_partial_postcode($query)){
            $return_type = "partial postcode";       
            $return_display = strtoupper($query);
        }else{

            //party name
            $search = factory::create("search");
            $result = $search->search("party", array(array("name", "=", $query), array("country_id", "=",  $this->country_id)));
            if(count($result) == 1){

                $return_type = "party";
                $return_value = $result[0]->party_id;
                $return_display = $result[0]->name;                
            }else{
             
             //TODO: match a place name        
            
            }
        }
        
        
        return array(
                    "type" => $return_type,
                    "value" => $return_value,
                    "display" => $return_display
                );
    }
    

    //reset
    public function reset(){
        $this->search_term = null;
        $this->lng = null;
        $this->lat = null;
        $this->party_id = null;
        $this->party_attacked_id = null;
        $this->category_id = null;        
    }


}

?>