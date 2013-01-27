<?php
require_once('init.php');
require_once('authentication.php');

class admin_category_page extends pagebase {

    //bind
    function bind() {
        $this->page_title = "Add a new Category";

        $search = factory::create('search');
        $categories = $search->search("category",
            array(array("1", "=", "1")),
            'AND',
            null,
            array(array('name', "ASC"))
        );

        $this->assign("categories", $categories);
    }

    function process() {
        // TODO: Duplicate detection
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
$admin_category_page = new admin_category_page();
?>
