<?php
require_once('init.php');

class stats_page extends pagebase {

    //properties
    private $party = null;
    private $date_since = STAT_ZERO_DATE;

    //setup
    function setup (){
        $party_id = get_http_var('p');
        if(isset($party_id) && $party_id != ''){
            $search = factory::create('search');
            $results = $search->search_cached('party', array(array('url_id', '=', $party_id)));
            if (count($results) !=1){
                throw_404();
            }
            if($results[0]->major != 1){
                throw_404();                
            }
            $this->party = $results[0];
        }
    }

	//bind
	function bind() {
	    
		$this->page_title = "Election leaflets stats by party";
	    $this->assign("party", $this->party);
	    $this->assign("date_since", $this->date_since);	    
	    $this->assign("leaflet_count", $this->get_count());	    	    
	    $this->assign("average_rates", $this->party->get_rate_values($this->date_since));	    	    	    
	    $this->assign("top_constituencies", $this->party->constituency_count($this->date_since));	    	    
	    $this->assign("top_categories", $this->party->category_count($this->date_since));	    
	    $this->assign("interesting_leaflets", $this->get_interesting_leaflets());	    
	}

	private function get_count(){
	      $leaflet = factory::create('leaflet');
	      $leaflet->publisher_party_id = $this->party->party_id;
	      return  $leaflet->count_cached();
    }
    
    private function get_interesting_leaflets(){

        $search = factory::create("search");
        $results = $search->search_cached('leaflet', 
            array(array('publisher_party_id', '=', $this->party->party_id), array('leaflet_image.sequence', '=', 1)),
            'AND', 
            array(array('rate_interesting', 'inner'), array('leaflet_image', 'inner'))
        );
        return $results;
    }
	
}

//create class instance
$stats_page = new stats_page();

?>
