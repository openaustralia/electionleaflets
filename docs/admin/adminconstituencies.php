<?php
require_once('init.php');
require_once('authentication.php');

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
        // Start transaction
        $db = new DB_DataObject;
        $db->query('BEGIN');

        // Get existing constituencies
        $search = factory::create('search');
        $results = $search->search("constituency",
            array(array("election_id", "=", $this->election_id)),
            'AND',
            array(array("constituency_election", "inner")),
            array(array('name', "ASC"))
        );

        // Delete existing constituencies
        foreach ($results as $result) {
            if(!$result->delete()) {
                $db->query('ROLLBACK');
                die("Unable to delete constituency. Transaction rolled back.");
            }
        }

        // Delete many-to-many joins
        $query_string = 'DELETE FROM `constituency_election`
                         WHERE `election_id`=' . $this->election_id;
        if($db->query($query_string) === false) {
            $db->query('ROLLBACK');
            die("Unable to delete constituency links. Transaction rolled back.");
        }

        // Add user supplied constituencies
        $supplied_constituencies = explode("\n", $this->data['txtConstituencies']);

        foreach ($supplied_constituencies as $constituency_name) {
            $constituency_name = trim($constituency_name);
            if($constituency_name == '') { continue; }

            // Check for an existing constituency (from another election)
            $existing_constituency = $search->search("constituency",
                array(array("name", "=", $constituency_name))
            );

            if(count($existing_constituency) == 1) {
                $constituency = $existing_constituency[0];
            }else{
                // Create constituency
                $constituency = factory::create('constituency');
                $constituency->name = $constituency_name;
                if(!$constituency->insert()) {
                    $db->query('ROLLBACK');
                    die("Unable to add constituency. Transaction rolled back.");
                }
            }

            // Create join
            $constituency_election = factory::create('constituency_election');
            $constituency_election->constituency_id = $constituency->constituency_id;
            $constituency_election->election_id = $this->election_id;
            if(!$constituency_election->insert()) {
                $db->query('ROLLBACK');
                die("Unable to add constituency. Transaction rolled back.");
            }
        }

        $db->query('COMMIT');

        $this->bind();
        $this->render();
    }
}

//create class addelection_page
$admin_constituencies_page = new admin_constituencies_page();
?>
