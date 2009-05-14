<?php
require_once('init.php');

class index_page extends pagebase {

	//bind
	function bind() {
		$this->page_title = SITE_TAG_LINE;	

        //get count of leaflets
        $this->assign("leaflet_count", $this->get_leaflet_count());

		//get recent leaflets
		$leaflet_search = factory::create("leaflet_search");
        $leaflet_search->start = 0;
        $leaflet_search->number = 20;
        
        $leaflets = $leaflet_search->search(true);
        
        /*
        $leaflet_count = 0;
        $leaflets_limited = array(); // standard limit not working grrr.        
        for ($i=0; $i < 40; $i++) { 
            array_push($leaflets_limited, $leaflets[$i]);
        }
        */
        
        $this->assign("leaflets", $leaflets);			
        $this->assign("hide_logo", true);
        $this->assign("is_home", true);
	}

    private function get_leaflet_count(){
        $return = 0;
		$cache = cache::factory();
    	$cached = $cache->get("total_leaflet_count");    	
        if($cached !== false && isset($cached)){
            $return = $cached;
        }else{
            $leaflet = factory::create('leaflet');
            $return = $leaflet->count();            
            $cache->set("total_leaflet_count", $return);
        }
        return $return;
    }
    
}

//create class instance
$index_page = new index_page();

?>
