<?php
require_once('init.php');

class manage_page extends pagebase {

    //properties
    private $confirm_id = null;
    private $email_alert = null;

    //setup
    function setup(){
        $this->viewstate['state'] = "view";
    }

	//load
	function load() {
        $this->confirm_id = get_http_var('q');        
        if(!isset($this->confirm_id)){
            throw_404();
        }else{
            if($this->viewstate['state'] != 'deleted'){
                //make sure ID exists
                $search = factory::create('search');
                $results = $search->search("email_alert", array(array("confirm_id", "=", $this->confirm_id)));

                if(count($results) != 1){
                    throw_404();
                }else{
                    $this->email_alert = $results[0];
                }
            }
        }
	}

	//bind
	function bind() {
		$this->page_title = "Manage Alerts";
		$this->assign('email_alert', $this->email_alert);
		$this->assign('state', $this->viewstate['state']);
	}

    function process(){
        if($this->data['action'] == 'delete'){
            $this->email_alert->delete();
            $this->viewstate['state'] = "deleted";
        }
        if($this->data['action'] == 'edit'){
            $frequency_hours = null;
            if($this->data['ddlFrequency'] == 1){
    	        $frequency_hours = 1;
            }else if ($this->data['ddlFrequency'] == 2){
    	        $frequency_hours = 24;            
            }else if ($this->data['ddlFrequency'] == 3){
    	        $frequency_hours = 72;            
            }else if ($this->data['ddlFrequency'] == 4){
    	        $frequency_hours = 168;
            }            
            $this->email_alert->frequency_hours = $frequency_hours;
            $this->email_alert->update();
            $this->viewstate['state'] = "updated";            
        }
        
        $this->bind();
        $this->render();        
    }
}

//create class instance
$manage_page = new manage_page();

?>
