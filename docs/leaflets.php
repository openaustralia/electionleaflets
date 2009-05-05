<?php
require_once('init.php');

class leaflets_page extends pagebase {

    //properties
    private $leaflet_search = null;
    private $user_term = null;


    //load
    function load(){
        
        //grab stuff form query string
        $user_term = get_http_var("q");
        if(isset($user_term) && $user_term != ''){
            $this->user_term = trim($user_term);
        }

        //setup search object
		$this->leaflet_search = factory::create("leaflet_search");        
    }

	//bind
	function bind() {

		$this->page_title = "Welcome";
        
        //generic search vs advanced
        if(isset($this->user_term)){

            //guess search term
            $search_type = $this->leaflet_search->guess_search_type($this->user_term);
            $this->assign("user_term", $search_type['display']);
            $this->assign("search_type", $search_type['type']);

            //set variables
            if($search_type['type'] == "postcode"){
                $geocoder = factory::create('geocoder');
                $geocoder->set_from_postcode($search_type['display']);
            }
                         		
    		//do search
            $leaflets = $this->leaflet_search->search();
            $this->assign("leaflets", $leaflets);
            $this->assign("mode", "basic");            

        }
        


	}

}

//create class instance
$leaflets_page = new leaflets_page();

?>
