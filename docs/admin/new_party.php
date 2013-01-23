<?php
require_once('init.php');
require_once('authentication.php');

class admin_party_page extends pagebase {

    //bind
    function bind() {
        $this->page_title = "Add a new Party";

        $search = factory::create('search');
        $parties = $search->search("party",
            array(array("1", "=", "1")),
            'AND',
            null,
            array(array('name', "ASC"))
        );

        $this->assign("parties", $parties);
    }

    function process() {
        // TODO: Duplicate detection
        if($this->data['txtPartyName']) {
            $party = factory::create('party');
            $party->name = trim($this->data['txtPartyName']);
            $party->country_id = COUNTRY;

            if(!$party->insert()){
                trigger_error("Unable to save party");
            }
        }

        $this->bind();
        $this->render();
    }
}

//create class addelection_page
$admin_party_page = new admin_party_page();
?>
