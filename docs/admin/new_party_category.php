<?php
require_once('init.php');

class admin_party_category_page extends pagebase {

    //bind
    function bind() {
        $this->page_title = "Add a new Party or Category";
    }

    function process() {
        // TODO: Duplicate detection

        if($this->data['txtPartyName']) {
            $party = factory::create('party');
            $party->name = trim($this->data['txtPartyName']);

            if(!$party->insert()){
                trigger_error("Unable to save party");
            }
        }

        if($this->data['txtCategoryName']) {
            $category = factory::create('category');
            $category->name = $this->data['txtCategoryName'];

            if(!$category->insert()){
                trigger_error("Unable to save category");
            }
        }

        $this->bind();
        $this->render();
    }
}

//create class addelection_page
$admin_party_category_page = new admin_party_category_page();
?>
