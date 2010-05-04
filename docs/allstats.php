<?php
require_once('init.php');

class allstats_page extends pagebase {

    //properties
    private $date_since = STAT_ZERO_DATE;

	//bind
	function bind() {
	    
		$this->page_title = "Election leaflets stats by party";
	    $this->assign("date_since", $this->date_since);

	    $search = factory::create('search');
	    $parties = $search->search("party", array(array("major", "=", 1)));
	    $party_rates = array();
	    foreach ($parties as $party) {
	        $this->assign($party->url_id . "_party_rates", $party->get_rate_values($this->date_since));
	    }

	}
	
}

//create class instance
$allstats_page = new allstats_page();

?>
