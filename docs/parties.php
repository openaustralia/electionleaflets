<?php
require_once('init.php');

class parties_page extends pagebase {

	//bind
	function bind() {
		$this->page_title = "Election leaflets by party";

		$search = factory::create('search');

		//get top parties
        $election_id = get_election_id();
	$parties = $search->search_cached("party", 
                array(array("party_election.election_id", "=", $election_id)),
                "AND",
        	array(array("party_election", "inner")),
                array(array("name", "ASC"))
            );
        $this->assign("parties", $parties);
	}
	
	
}

//create class instance
$parties_page = new parties_page();

?>
