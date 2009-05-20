<?php
require_once('init.php');

class report_page extends pagebase {

    private $leaflet_id = null;

    //setup
    function setup(){
        $leaflet_id = get_http_var('q');
        if(!isset($leaflet_id)){
            throw_404();
        }else{
        $this->viewstate['leaflet_id'] = $leaflet_id;	   
        }
        
        $this->viewstate['message_sent'] = false;
    }

	//bind
	function bind() {

		//get the leaflet
		$search = factory::create("search");
		$result = $search->search("leaflet",
		    array(array("leaflet_id", "=", $this->viewstate['leaflet_id'])));
		
		$leaflet = null;
		if(count($result) != 1){
		    throw_404();
	    }else{
	        $leaflet = $result[0];
        }
        
	    $this->assign("leaflet", $leaflet);
	    $this->assign("message_sent", $this->viewstate['message_sent']); 
		
	}

	function validate (){

		if($this->data['txtEmail'] =='' || !valid_email(trim($this->data['txtEmail']))){
			$this->add_warn_control("txtEmail");
			$this->add_warning("Please enter a valid email address");
		}
		if($this->data['txtName'] ==''){
			$this->add_warn_control("txtName");
			$this->add_warning("Please enter your name");
		}
		if($this->data['txtDetails'] ==''){
			$this->add_warn_control("txtDetails");
			$this->add_warning("Please enter some details of the report");
		}

	    return sizeof($this->warnings) == 0;

	}

	function process (){
		if ($this->validate()){
			if($this->viewstate['sent'] == false){

				//send email
				$email = $this->data['txtEmail'];
				$name = $this->data['txtName'];
				$message = "Leaflet link: " . WWW_SERVER . "/leaflet.php?q=" . $this->viewstate['leaflet_id']  . "\n";
				$message .= "Name: " . $this->data['txtName'] . "\n";
				$message .= ("Email: " . $this->data['txtEmail'] . "\n");
				$message .= ("Details: " . $this->data['txtDetails'] . "\n");															

				send_text_email(CONTACT_EMAIL, $name, $this->data['txtEmail'], "[" . SITE_NAME . "ABUSE REPORT]", $message);
			}
			$this->viewstate['message_sent'] = true;
		}

		$this->bind();
		$this->render();
	}
	
}

//create class instance
$report_page = new report_page();

?>
