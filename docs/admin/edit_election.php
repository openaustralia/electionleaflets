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

        //get all categories
        $search = factory::create('search');
        $all_categories = $search->search_cached("category",
            array(array("1", "=", "1")),
            'AND',
            null,
            array(array('name', "ASC"))
        );

        //get this election's categories
        $election_categories = $search->search_cached("category",
            array(array("category_election.election_id", "=", $this->election_details->election_id)),
            'AND',
            array(array("category_election", "inner")),
            array(array('name', "ASC"))
        );

        $this->assign("election_details", $this->election_details);
        $this->assign("categories", $all_categories);
        $this->assign("selected_category_ids", $election_categories);
    }

    function process() {
        if($this->validate()){
            $this->election_details->name = trim($this->data['txtName']);
            $this->election_details->vote_date = DB_DataObject_Cast::date($this->data['txtDate']);

            if($this->election_details->update() !== false){
                $this->load(); // Reload so we get the date back as a string
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

    function validate() {
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
$edit_election_page = new edit_election_page();
?>
