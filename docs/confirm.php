<?php
require_once('init.php');

class confirm_page extends pagebase {

    function load(){
        $upload_key = get_http_var('q');
        if(!isset($upload_key) || $upload_key == null){
            throw_404();
        }else{
            $search = factory::create('search');
            $image_que_items = $search->search("image_que", 
                    array(array("upload_key", "=", $upload_key)),
                    "AND",
                    null,
                    array(array("uploaded_date", "ASC"))
                );   
            if(count($image_que_items) > 0){
                redirect(WWW_SERVER . '/addinfo.php?key=' . urlencode($upload_key));
            }else{
                throw_404();
            }
        }
    }


    function render(){
        //do nothing
    }
}

//create class instance
$confirm_page = new confirm_page();

?>
