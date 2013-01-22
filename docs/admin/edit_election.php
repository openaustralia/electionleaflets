<?php
require_once('init.php');
require_once('authentication.php');

class edit_election_page extends pagebase {

    private $selected_category_ids = array();
    private $selected_party_ids = array();

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
        $all_categories = $search->search("category",
            array(array("1", "=", "1")),
            'AND',
            null,
            array(array('name', "ASC"))
        );

        //get this election's categories
        $election_categories = $search->search("category",
            array(array("category_election.election_id", "=", $this->election_details->election_id)),
            'AND',
            array(array("category_election", "inner")),
            array(array('name', "ASC"))
        );

        // Get all parties
        $all_parties = $search->search("party",
            array(array("1", "=", "1")),
            'AND',
            null,
            array(array('name', "ASC"))
        );

        // Get this election's parties
        $election_parties = $search->search("party",
            array(array("party_election.election_id", "=", $this->election_details->election_id)),
            'AND',
            array(array("party_election", "inner")),
            array(array('name', "ASC"))
        );

        $this->assign("election_details", $this->election_details);
        $this->assign("categories", $all_categories);
        $this->assign("parties", $all_parties);
        $this->assign("selected_category_ids", $election_categories);
        $this->assign("selected_party_ids", $election_parties);
    }

    function unbind(){
        //strip out categories
        foreach ($this->data as $key => $value) {
            if(strpos($key, 'chkCategory_') !== false){
                array_push($this->selected_category_ids, $value);
            }
        }

        //strip out parties
        foreach ($this->data as $key => $value) {
            if(strpos($key, 'chkParty_') !== false){
                array_push($this->selected_party_ids, $value);
            }
        }

    }

    function process() {
        if($this->validate()){
            $this->election_details->name = trim($this->data['txtName']);
            $this->election_details->vote_date = DB_DataObject_Cast::date($this->data['txtDate']);

            if($this->data['chkEnabled']) {
                $this->election_details->enabled = 1;
            }else{
                $this->election_details->enabled = 0;
            }

            $this->process_removed_categories();
            $this->process_selected_categories();

            $this->process_removed_parties();
            $this->process_selected_parties();

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

    // Deletes categories the user has unselected
    private function process_removed_categories() {
        $search = factory::create('search');
        // Get existing categories in the DB linked to this election
        $category_election_category_ids = array();
        $results = $search->search("category_election",
            array(array("election_id", "=", $this->election_details->election_id))
        );
        foreach ($results as $result) {
            $category_election_category_ids[] = $result->category_id;
        }

        // Delete categories the user has unselected
        $deleted_categories = array_diff($category_election_category_ids, $this->selected_category_ids);
        foreach ($deleted_categories as $category_id) {
            $result = $search->search("category_election",
                array(
                    array("election_id", "=", $this->election_details->election_id),
                    array("category_id", "=", $category_id)
                ),
                'AND'
            );

            if(!$result[0]->delete()) {
                trigger_error("Unable to remove election category");
            }
        }
    }

    // Insert/updates selected categories
    private function process_selected_categories() {
        $search = factory::create('search');

        foreach ($this->selected_category_ids as $category_id) {
            // See if we already have this category
            // TODO: Replace with comparison from category_election_ids
            $result = $search->search("category_election",
                array(
                    array("election_id", "=", $this->election_details->election_id),
                    array("category_id", "=", $category_id)
                ),
                'AND'
            );

            if(!$result) {
                $category_election = factory::create('category_election');
                $category_election->election_id = $this->election_details->election_id;
                $category_election->category_id = $category_id;

                if(!$category_election->insert()){
                    trigger_error("Unable to save election category");
                }
            }
        }
    }

    // Deletes parties the user has unselected
    private function process_removed_parties() {
        $search = factory::create('search');
        // Get existing categories in the DB linked to this election
        $party_election_party_ids = array();
        $results = $search->search("party_election",
            array(array("election_id", "=", $this->election_details->election_id))
        );
        foreach ($results as $result) {
            $party_election_party_ids[] = $result->party_id;
        }

        // Delete categories the user has unselected
        $deleted_categories = array_diff($party_election_party_ids, $this->selected_party_ids);
        foreach ($deleted_categories as $party_id) {
            $result = $search->search("party_election",
                array(
                    array("election_id", "=", $this->election_details->election_id),
                    array("party_id", "=", $party_id)
                ),
                'AND'
            );

            if(!$result[0]->delete()) {
                trigger_error("Unable to remove election party");
            }
        }
    }


    // Insert/updates selected parties
    private function process_selected_parties() {
        $search = factory::create('search');

        foreach ($this->selected_party_ids as $party_id) {
            // See if we already have this party
            // TODO: Replace with comparison from party_election_ids
            $result = $search->search("party_election",
                array(
                    array("election_id", "=", $this->election_details->election_id),
                    array("party_id", "=", $party_id)
                ),
                'AND'
            );

            if(!$result) {
                $party_election = factory::create('party_election');
                $party_election->election_id = $this->election_details->election_id;
                $party_election->party_id = $party_id;

                if(!$party_election->insert()){
                    trigger_error("Unable to save election party");
                }
            }
        }
    }
}

//create class addelection_page
$edit_election_page = new edit_election_page();
?>
