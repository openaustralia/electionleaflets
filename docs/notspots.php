<?php
require_once('init.php');
require_once('table_classes/party.php');
require_once('table_classes/constituency.php');

class notspots_page extends pagebase {

	//bind
	function bind() {
		$this->page_title = SITE_TAG_LINE;	

        $not_spots = tableclass_constituency::get_not_spots(800);        
     
        $this->assign("not_spots", $not_spots);
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
$notspots_page = new notspots_page();

?>
