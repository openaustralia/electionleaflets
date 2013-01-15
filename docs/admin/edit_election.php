<?php
require_once('init.php');

class edit_election_page extends pagebase {

    function setup(){
        $election_id = get_http_var('id');
        if(!isset($election_id)){
            throw_404();
        }else{
            $this->election_id = $election_id;
        }
    }

    function bind() {
        $this->page_title = "Edit";

        $search = factory::create('search');
        $result = $search->search("election",
            array(array("election_id", "=", $this->election_id))
        );
        $election_details = null;
        if(count($result) != 1){
            throw_404();
        }else{
            $election_details = $result[0];
        }

        $this->assign("election_details", $election_details);
    }
}

//create class addelection_page
$edit_election_page = new edit_election_page();
?>
