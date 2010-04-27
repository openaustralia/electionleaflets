<?php
require_once('init.php');
require_once('table_classes/party.php');
require_once('table_classes/constituency.php');

class index_page extends pagebase {

	//bind
	function bind() {
		$this->page_title = SITE_TAG_LINE;	
		$this->onloadscript = "$('#divScroller ul').jcarousel({wrap: 'last',initCallback: mycarousel_initCallback,buttonNextHTML: null,buttonPrevHTML: null});";

        //get count of leaflets
        $this->assign("leaflet_count", $this->get_leaflet_count());

		//get recent leaflets
		$leaflet_search = factory::create("leaflet_search");
        $leaflet_search->start = 0;
        $leaflet_search->number = 60;
        
        $leaflets = $leaflet_search->search(true);

        /*
        $leaflet_count = 0;
        $leaflets_limited = array(); // standard limit not working grrr.        
        for ($i=0; $i < 40; $i++) { 
            array_push($leaflets_limited, $leaflets[$i]);
        }
        */
        
        //constituencies
        $search = factory::create('search');         
        $constituencies = $search->search_cached("constituency", 
                array(array("1", "=", "1")),
                "AND", null,
                array(array("name", "ASC"))
            );

        //counts
        $total_counts = tableclass_party::get_party_count(STAT_ZERO_DATE);
        $not_spots = tableclass_constituency::get_not_spots();        
        $constituency_counts = tableclass_constituency::constituency_count(STAT_ZERO_DATE);                

        //assign
        $this->assign("total_counts", $total_counts);
        $this->assign("constituency_counts", $constituency_counts);        
        $this->assign("constituencies", $constituencies);        
        $this->assign("not_spots", $not_spots);        

        $this->assign("leaflets", $leaflets);			
        $this->assign("is_home", true);
	}

    private function get_leaflet_count(){
        $leaflet = factory::create('leaflet');
        return  $leaflet->count_cached();
    }
    
    
}

//create class instance
$index_page = new index_page();

?>
