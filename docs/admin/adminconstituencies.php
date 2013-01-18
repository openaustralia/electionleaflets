<?php
require_once('init.php');

class admin_constituencies_page extends pagebase {

    function load(){
        $election_id = get_http_var('election_id');
        if(!isset($election_id)){
            throw_404();
        }else{
            $this->election_id = $election_id;

            $search = factory::create('search');
            $result = $search->search("election",
                array(array("election_id", "=", $this->election_id))
            );
            $election_details = null;
            if(count($result) != 1){
                throw_404();
            }else{
                $this->assign("election_details", $result[0]);
            }
        }
    }

    function bind() {
        $this->page_title = "Bulk replace constituencies";

        $search = factory::create('search');
        $results = $search->search("constituency",
            array(array("election_id", "=", $this->election_id)),
            'AND',
            array(array("constituency_election", "inner")),
            array(array('name', "ASC"))
        );

        foreach ($results as $constituency) {
            $constituencies .= $constituency->name . "\n";
        }

        $this->assign("constituencies", $constituencies);
    }

    function process() {
        // $constituency = factory::create('constituency');

        // // Start transaction
        // $constituency->query('BEGIN');

        // // Trash existing constituencies

        // // Add user supplied constituencies

        // if($this->validate()){
        //     $election = factory::create('election');
        //     $election->name = trim($this->data['txtName']);
        //     $election->vote_date = DB_DataObject_Cast::date($this->data['txtDate']);

        //     if($election->insert()){
        //         $this->bind();
        //         $this->render();
        //     }else{
        //         trigger_error("Unable to save election");
        //     }
        // }else{
        //     $this->bind();
        //     $this->render();
        // }
    }

}

//create class addelection_page
$admin_constituencies_page = new admin_constituencies_page();
?>
