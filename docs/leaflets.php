<?php
require_once('init.php');

class leaflets_page extends pagebase {

    //properties
    private $search_term = null;
    private $leaflet_search = null;
    private $user_term = null; //q
    private $is_rss = false; //q    

    //load
    function load(){

        //setup search object
		$this->leaflet_search = factory::create("leaflet_search");

    }

    
	//bind
	function bind() {
        
        //get variables
        $this->get_vars();

		//if rss requested, change template
	    if($this->is_rss){
	        $this->reset_smarty("rss.tpl");
        }
                    
        //generic search
        if(isset($this->search_term)){

            //guess search term
            $search_type = $this->leaflet_search->guess_search_type($this->search_term);
            $this->assign("user_term", $search_type['display']);
            $this->assign("search_type", $search_type['type']);

            //geo vs normal
            $leaflets = array();
            if($search_type['type'] == "postcode" || $search_type['type'] = 'partial postcode'){
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
		if($this->has_vars_set()){
            $leaflets = $this->leaflet_search->search();
        }

		//assign vars
		$title_parts = $this->get_title();
        $this->rss_link = htmlspecialchars($_SERVER['REQUEST_URI']) . "&rss=1";
		$this->page_title = $title_parts[0] . " " . $title_parts[1];		
        $this->assign("leaflets", $leaflets);
        $this->assign("has_leaflets", count($leaflets) > 0);        
        $this->assign("is_search", $this->is_search());            
        $this->assign("is_browse", $this->is_browse());
        $this->assign("is_geo", $this->is_geo());
        $this->assign("has_party", isset($this->leaflet_search->publisher_party_id));
        $this->assign("has_category", isset($this->leaflet_search->category_id));
        $this->assign("has_constituency", isset($this->leaflet_search->constituency_id));        
        $this->assign("has_tag", isset($this->leaflet_search->tag));
        $this->assign("has_party_attack", isset($this->leaflet_search->party_attack_id));        
        $this->assign("heading", $title_parts);
        $this->assign("alert_link", $this->get_alert_link());

	}
	
	function unbind(){
	    $this->strip_tags_from_data();
    }
    
    
    private function has_vars_set(){
        $return = false;
        if(isset($this->leaflet_search->constituency_id) || isset($this->leaflet_search->search_term) || isset($this->leaflet_search->publisher_party_id) || isset($this->leaflet_search->party_attack_id) || isset($this->leaflet_search->category_id) || isset($this->leaflet_search->tag) || (isset($this->leaflet_search->lng) && isset($this->leaflet_search->lat))){
            $return = true;
        }
        
        return $return;
    }

	private function get_title(){

	    $return = array();
        $search = factory::create("search");	    
        //party
	    if(isset($this->leaflet_search->publisher_party_id)){
	        $result = $search->search("party", array(array("party_id", "=", $this->leaflet_search->publisher_party_id)));
	        $return = array("Election leaflets published by", $result[0]->name);
        }
        
        //category
        if(isset($this->leaflet_search->category_id)){
            $result = $search->search("category", array(array("category_id", "=", $this->leaflet_search->category_id)));
	        $return = array("Election leaflets about ", $result[0]->name);
        }
        
        //tag
        if(isset($this->leaflet_search->tag)){
            $result = $search->search("tag", array(array("tag", "=", $this->leaflet_search->tag)));
	        $return = array("Election leaflets tagged ", $result[0]->tag);
        }
        
        //party attack
        if(isset($this->leaflet_search->party_attack_id)){
            $result = $search->search("party", array(array("party_id", "=", $this->leaflet_search->party_attack_id)));
	        $return = array("Election leaflets attacking the", $result[0]->name);
        }
        
        //constituency

        if(isset($this->leaflet_search->constituency_id)){
            $result = $search->search_cached("constituency", array(array("constituency_id", "=", $this->leaflet_search->constituency_id)));
	        $return = array("Election leaflets delivered in ", $result[0]->name);
        }
        return $return;
    }

    private function get_alert_link(){

	    $return = null;

        //party
	    if(isset($this->leaflet_search->publisher_party_id)){
	        $return = WWW_SERVER . "/alerts/create.php?p=" . $this->leaflet_search->publisher_party_id;
        }
        
        //category
        if(isset($this->leaflet_search->category_id)){
	        $return = WWW_SERVER . "/alerts/create.php?c=" . $this->leaflet_search->category_id;
        }
        
        //party attack
        if(isset($this->leaflet_search->party_attack_id)){
	        $return = WWW_SERVER . "/alerts/create.php?a=" . $this->leaflet_search->party_attack_id;
        }
        
        //constituency

        if(isset($this->leaflet_search->constituency_id)){
        	$return = WWW_SERVER . "/alerts/create.php?n=" . $this->leaflet_search->constituency_id;    
        }
        return $return;
    }

    //grab vars form query string
    private function get_vars(){

        $search_term = get_http_var("q");        
        if(isset($search_term) && $search_term != ''){
            $this->search_term = trim($search_term);
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
        
        $constituency_url_id = trim(get_http_var("n"));
        if(isset($constituency_url_id) && $constituency_url_id != ''){

            $search = factory::create('search');
            $results = $search->search_cached('constituency', array(array('url_id', '=', $constituency_url_id)));
            if (count($results) !=1){
                throw_404();
            }
            $this->leaflet_search->constituency_id = $results[0]->constituency_id;
        }
        
        $is_rss = get_http_var("rss");
        if(isset($is_rss) && $is_rss != ''){
            $this->is_rss = true;
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
