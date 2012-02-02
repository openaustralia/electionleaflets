<?php
require_once('init.php');

class create_page extends pagebase {
	
	//properties
	private $email_alert = null;
	private $title_parts = array();
	protected $fields_to_controls = array(
		"email" => "txtEmail",
		"frequency_hours" => "txtFrequency",		
		);

    //setup
    function setup(){
        $this->viewstate['done'] = 'no';
    }

    //load
    function load(){

        //setup search object
		$this->email_alert = factory::create("email_alert");
		$this->get_vars();
		
		//get the tile
		$this->title_parts = $this->get_title();		

    }

	//bind
	function bind() {

	    //assign
		$this->page_title = "Create an alert";
        $this->assign("heading", $this->title_parts);
        $this->assign("email_alert", $this->email_alert);        
        $this->assign("done", $this->viewstate['done']);
	}


	//unbind
	function unbind(){
	    $this->email_alert->email = $this->data['txtEmail'];
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
	    $this->email_alert->title = $this->title_parts[0] . ' ' . $this->title_parts[1];
        
    }

    //validate
    function validate(){
        $return = $this->email_alert->validate();
		$this->add_warnings($this->email_alert->get_warnings());
		$this->field_to_control_warnings($this->email_alert->get_warn_fields());		
        return sizeof($this->warnings) == 0;        
    }

    //process
    function process(){

        //if valid, save and show success message
        if($this->validate()){
            $success = $this->email_alert->insert();
            if($success){

                //send email
                $this->send_confirmation();
                
                //show message
                $this->viewstate['done'] = 'yes';
            }
        }

        $this->bind();
        $this->render();
    }

    //send email
    public function send_confirmation(){

		//Setup email text
		$smarty = new Smarty();
        $smarty->compile_dir = SMARTY_PATH;
        $smarty->compile_check = true;
        $smarty->template_dir = TEMPLATE_DIR;
        $smarty->assign('heading', $this->title_parts);
        $smarty->assign('url', WWW_SERVER . '/alerts/confirm.php?q=' . $this->email_alert->confirm_id);
        
        $subject = 'confirm your email alert';
        $body = $smarty->fetch(TEMPLATE_DIR . '/emails/confirm_alert.tpl');

		//send email
		send_text_email(trim($this->data['txtEmail']), SITE_NAME, CONFIRMATION_EMAIL, $subject, $body);
		
	}

    //grab vars form query string
    private function get_vars(){

        $publisher_party_id = get_http_var("p");
        if(isset($publisher_party_id) && $publisher_party_id != ''){
            
            $this->email_alert->parent_id = trim($publisher_party_id);
            $this->email_alert->type = 'party';
        }

        $category_id = get_http_var("c");
        if(isset($category_id) && $category_id != ''){
            $this->email_alert->parent_id = trim($category_id);
            $this->email_alert->type = 'category';
        }

        $party_attack_id = get_http_var("a");
        if(isset($party_attack_id) && $party_attack_id != ''){
            $this->email_alert->parent_id = trim($party_attack_id);
            $this->email_alert->type = 'attack';
        }

        $constituency_id = trim(get_http_var("n"));
        if(isset($constituency_id) && $constituency_id != ''){
            $this->email_alert->parent_id = $constituency_id;
            $this->email_alert->type = 'constituency';
        }

    }

    //get the alert title
	private function get_title(){

	    $return = array();
        $search = factory::create("search");

        //party
	    if($this->email_alert->type == 'party'){
	        $result = $search->search("party", array(array("party_id", "=", $this->email_alert->parent_id)));
	        $return = array("election leaflets published by the", $result[0]->name);
        }

        //category
        if($this->email_alert->type == 'category'){
            $result = $search->search("category", array(array("category_id", "=", $this->email_alert->parent_id)));
	        $return = array("election leaflets about ", $result[0]->name);
        }

        //party attack
        if($this->email_alert->type == 'attack'){
            $result = $search->search("party", array(array("party_id", "=", $this->email_alert->parent_id)));
	        $return = array("election leaflets attacking the", $result[0]->name);
        }
        
        //constituency
        if($this->email_alert->type == 'constituency'){
            $result = $search->search_cached("constituency", array(array("constituency_id", "=", $this->email_alert->parent_id)));
	        $return = array("election leaflets delivered in ", $result[0]->name);
        }
        return $return;
    }
        
}

//create class instance
$create_page = new create_page();

?>
