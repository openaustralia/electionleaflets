<?php
require_once('init.php');
require_once('authentication.php');

class admin_postcodes_page extends pagebase {

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
        $this->page_title = "Bulk replace postcode mappings";

        $search = factory::create('search');
        $results = $search->search("australian_postcode",
            array(array("election_id", "=", $this->election_id)),
            'AND',
            null,
            array(array('postcode', "ASC"))
        );

        foreach ($results as $australian_postcode) {
            $postcode_mappings .= $australian_postcode->postcode .
                                  ", " .
                                  $australian_postcode->constituency .
                                  "\n";
        }

        $this->assign("postcode_mappings", $postcode_mappings);
    }

    function process() {
        // Start transaction
        $db = new DB_DataObject;
        $db->query('BEGIN');

        // Get existing mappings
        $search = factory::create('search');
        $results = $search->search("australian_postcode",
            array(array("election_id", "=", $this->election_id))
        );

        // Delete existing mappings
        foreach ($results as $result) {
            if($result->delete() === false) {
                $db->query('ROLLBACK');
                die("Unable to delete mapping. Transaction rolled back.");
            }
        }

        // Add user supplied mappings
        $supplied_mappings = explode("\n", $this->data['txtPostcodeMappings']);

        foreach ($supplied_mappings as $mapping) {
            $mapping = explode(',', $mapping);

            $postcode = trim($mapping[0]); // TODO: Sanity check postcode
            $constituency = trim($mapping[1]);

            if($postcode == '' && $constituency == '') {
                continue;
            }

            $australian_postcode = factory::create('australian_postcode');
            $australian_postcode->election_id = $this->election_id;
            $australian_postcode->postcode = $postcode;
            $australian_postcode->constituency = $constituency;

            if(!$australian_postcode->insert()) {
                $db->query('ROLLBACK');
                die("Unable to add mapping. Transaction rolled back.");
            }
        }

        $db->query('COMMIT');

        $this->bind();
        $this->render();
    }
}

//create class addelection_page
$admin_postcodes_page = new admin_postcodes_page();
?>
