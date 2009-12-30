<?php
require_once('init.php');

class confirm_page extends pagebase {

    //properties
    private $confirm_id = null;
    private $email_alert = null;

	//setup
	function setup() {
        $this->confirm_id = get_http_var('q');        
        if(!isset($this->confirm_id)){
            throw_404();
        }else{

            //make sure ID exists
            $search = factory::create('search');
            $results = $search->search("email_alert", array(array("confirm_id", "=", $this->confirm_id), array("activated", '=', 0)));

            if(count($results) != 1){
                throw_404();
            }else{
                $this->email_alert = $results[0];
            }
        }
	}

	//bind
	function bind() {
		$this->page_title = "Your alert has been confirmed";
		$this->email_alert->activated = true;
        $this->email_alert->update();
	}

}

//create class instance
$confirm_page = new confirm_page();

?>
