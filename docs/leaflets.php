<?php
require_once('init.php');

class leaflets_page extends pagebase {

    //properties
    private $search_term = null;
    private $leaflet_search = null;
    private $user_term = null; //q

    //load
    function load(){

        //setup search object
		$this->leaflet_search = factory::create("leaflet_search");

    }

    
	//bind
	function bind() {

        //get variables
        $this->get_vars();
                
        //generic search
        if(isset($this->leaflet_search->user_term)){

            //guess search term
            $search_type = $this->leaflet_search->guess_search_type($this->leaflet_search->user_term);
            $this->assign("user_term", $search_type['display']);
            $this->assign("search_type", $search_type['type']);

            //geo vs normal
            $leaflets = array();
            if($search_type['type'] == "postcode"){
                $geocoder = factory::create('geocoder');
                $success = $geocoder->set_from_postcode($search_type['display']);
                if($success){
                    
                    $this->leaflet_search->lng = $geocoder->lng;
                    $this->leaflet_search->lat = $geocoder->lat;                    
                }else{
                    trigger_error("Error geocoding on user search");
                }

            }
        }

		//do search
        $leaflets = $this->leaflet_search->search();

		//assign vars
		$title_parts = $this->get_title($leaflets[0]);
		$this->page_title = $title_parts[0] . " " . $title_parts[1];		
        $this->assign("leaflets", $leaflets);
        $this->assign("is_search", $this->is_search());            
        $this->assign("is_browse", $this->is_browse());
        $this->assign("is_geo", $this->is_geo());
        $this->assign("has_party", isset($this->leaflet_search->publisher_party_id));
        $this->assign("has_category", isset($this->leaflet_search->category_id));
        $this->assign("has_tag", isset($this->leaflet_search->tag));
        $this->assign("has_party_attack", isset($this->leaflet_search->party_attack_id));        
        $this->assign("heading", $title_parts);
                
	}

	private function get_title($first_leaflet){
	    $return = array();
	    if(isset($this->leaflet_search->publisher_party_id)){
	        $return = array("Election leaflets published by", $first_leaflet->party_name);
        }
        if(isset($this->leaflet_search->category_id)){
	        $return = array("Election leaflets about ", $first_leaflet->category_name);
        }
        if(isset($this->leaflet_search->tag)){
	        $return = array("Election leaflets tagged ", $first_leaflet->tag_tag);
        }
        if(isset($this->leaflet_search->party_attack_id)){

            $search = factory::create("search");
            $result = $search->search("party", array(array("party_id", "=", $first_leaflet->leaflet_party_attack_party_id)));

	        $return = array("Election leaflets attacking the", $result[0]->name);
        }
        
        return $return;
    }

    //grab vars form query string
    private function get_vars(){

        $search_term = get_http_var("q");
        if(isset($search_term) && $search_term != ''){
            $this->leaflet_search->search_term = trim($search_term);
        }

        $publisher_party_id = get_http_var("p");
        if(isset($publisher_party_id) && $publisher_party_id != ''){
            
            $this->leaflet_search->publisher_party_id = trim($publisher_party_id);
        }

        $category_id = get_http_var("c");
        if(isset($category_id) && $category_id != ''){
            $this->leaflet_search->category_id = trim($category_id);
        }

        $tag = get_http_var("t");
        if(isset($tag) && $tag != ''){
            $this->leaflet_search->tag = trim($tag);
        }

        $party_attack_id = get_http_var("a");
        if(isset($party_attack_id) && $party_attack_id != ''){
            $this->leaflet_search->party_attack_id = trim($party_attack_id);
        }
        
    }
    
    //is geo
    private function is_search(){
     
        $return = false;
     
        if(isset($user_term)){
            $return = true;
        }

        return $return;
    }
    
    //is geo
    private function is_browse(){

        $return = false;

        if(isset($this->leaflet_search->publisher_party_id) || isset($this->leaflet_search->category_id) || isset($this->leaflet_search->tag) || isset($this->leaflet_search->party_attack_id)){
            $return = true;
        }

        return $return;
    }

    //is geo
    private function is_geo(){

        $return = false;
     
        if(isset($this->leaflet_search->lng) && isset($this->leaflet_search->lat)){
            $return = true;
        }

        return $return;
    }


}

//create class instance
$leaflets_page = new leaflets_page();

?>
