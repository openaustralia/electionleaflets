<?php
require_once('init.php');

class edit_election_page extends pagebase {

    function load(){
        $election_id = get_http_var('id');
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
                $this->election_details = $result[0];
            }
        }
    }

    function bind() {
        $this->page_title = "Edit";

        $this->assign("election_details", $this->election_details);
    }

    function process() {
        if($this->validate()){
            $this->election_details->name = trim($this->data['txtName']);

            if($this->election_details->update()){
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

        return count($this->warnings) == 0;
    }
}

//create class addelection_page
$edit_election_page = new edit_election_page();
?>
