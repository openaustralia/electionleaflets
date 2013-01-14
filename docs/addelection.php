<?php
require_once('init.php');

class addelection_page extends pagebase {

    //bind
    function bind() {
        $this->page_title = "Add an election";

        // Get full election information since we pass election names only by default to all pages
        $search = factory::create('search');
        $election_details = $search->search("election",
            array(array("1", "=", "1")),
            "AND", null,
            array(array("vote_date", "DESC"))
        );

        $this->assign("election_details", $election_details);
    }

}

//create class addelection_page
$addelection_page = new addelection_page();
?>
