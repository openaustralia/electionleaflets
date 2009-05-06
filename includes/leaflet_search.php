<?php

class leaflet_search {

    //properties
    public $search_term = null;
    public $lng = null;
    public $lat = null;
    public $publisher_party_id = null;
    public $party_attack_id = null;
    public $election_id = null;
    public $category_id = null;
    public $current_elections_only = true;
    public $country_id = 225;
    
    private $number = null;
    private $start = null;    

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
        array_push($joins, array("leaflet_election", "inner", null, 
                array("election", "inner", "election_id", array("election_type", "inner", "election_type_id"))
            )
        );             
            
        //optional
        if(isset($this->party_attack_id) && $this->party_attack_id != '' && $this->party_attack_id != 0){
            array_push($joins, array("party_attack", "inner", "party_id"));
        }
        
        if(isset($this->party_attack_id) && $this->party_attack_id != '' && $this->party_attack_id != 0){
            array_push($joins, array("party_attack", "inner", "party_id"));
        }
        
        if(isset($this->category_id) && $this->category_id != '' && $this->category_id != 0){
            array_push($joins, array("category", "inner", "category_id"));
        }

        return $joins;

    }

    private function get_where_clauses(){
        
        $where_clauses = array();

        //required
        array_push($where_clauses, array("leaflet_image.sequence", "=", 1));        
        array_push($where_clauses, array("election_type.country_id", "=", $this->country_id));                

        //optional
        if($this->current_elections_only === true){   
            array_push($where_clauses, array("election.vote_date", ">", date(DATETIMEFORMAT_SQL, time())));            
        }
        
        if(isset($this->publisher_party_id) && $this->publisher_party_id != '' && $this->publisher_party_id != 0){
            array_push($where_clauses, array("publisher_party_id", "=", $this->publisher_party_id));
        }

        if(isset($this->party_attack_id) && $this->party_attack_id != '' && $this->party_attack_id != 0){
            array_push($where_clauses, array("party_attack_id.party_id", "=", $this->party_attack_id));
        }

        if(isset($this->election_id) && $this->election_id != '' && $this->election_id != 0){
            array_push($where_clauses, array("leaflet_election.election_id", "=", $this->election_id));
        }

        if(isset($this->party_attack_id) && $this->party_attack_id != '' && $this->party_attack_id != 0){
            array_push($where_clauses, array("party_attack.party_id", "=", $this->party_attack_id));
        }
        
        if(isset($this->category_id) && $this->category_id != '' && $this->category_id != 0){
            array_push($where_clauses, array("category.category_id", "=", $this->category_id));
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
        $this->election_id = null;
        $this->category_id = null;        
    }


}

?>