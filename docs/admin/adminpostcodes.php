<?php
require_once('init.php');

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
        // TODO
    }
}

//create class addelection_page
$admin_postcodes_page = new admin_postcodes_page();
?>
