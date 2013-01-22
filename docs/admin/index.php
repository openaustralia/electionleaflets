<?php
require_once('init.php');
require_once('authentication.php');

class admin_index_page extends pagebase {

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

    function process() {
        if($this->validate()){
            $election = factory::create('election');
            $election->name = trim($this->data['txtName']);
            $election->vote_date = DB_DataObject_Cast::date($this->data['txtDate']);

            if($election->insert()){
                $this->bind();
                $this->render();
            }else{
                trigger_error("Unable to save election");
            }
        }else{
            $this->bind();
            $this->render();
        }
    }

    function validate()
    {
        if(!isset($this->data['txtName']) || $this->data['txtName'] ==''){
            $this->add_warning('Please add a name for this election');
            $this->add_warn_control('txtName');
        }
        if(!isset($this->data['txtDate']) || $this->data['txtDate'] ==''){
            $this->add_warning('Please add a voting date for this election');
            $this->add_warn_control('txtDate');
        }

        return count($this->warnings) == 0;
    }

}

//create class addelection_page
$admin_index_page = new admin_index_page();
?>
