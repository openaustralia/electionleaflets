<?php
require_once('init.php');

class analyze_page extends pagebase {


	//bind
	function bind() {
		$this->page_title = "Analysis";				
        $this->assign("leaflet_count", $this->get_leaflet_count());
        $rate_value = factory::create("rate_value");
        $result = $rate_value->execute_cached("Select user_name, count(leaflet_id) as count from rate_value group by user_name order by count(leaflet_id) desc limit 50");
        
        $this->assign("users", $result);
	}
	
	
	private function get_leaflet_count(){
        $return = 0;
		$cache = cache::factory();
    	$cached = $cache->get("total_leaflet_count");    	
        if($cached !== false && isset($cached)){
            $return = $cached;
        }else{
            $leaflet = factory::create('leaflet');
            $return = $leaflet->count();            
            $cache->set("total_leaflet_count", $return);
        }
        return $return;
    }
 
    //validate
    function validate(){
    	if(!isset($this->data['txtName']) || $this->data['txtName'] ==''){
			$this->add_warning('Please add your name');
			$this->add_warn_control('txtName');
		}
		if(!isset($this->data['txtEmail']) || $this->data['txtEmail'] =='' || !valid_email($this->data['txtEmail'] )){

			$this->add_warning('Please add a valid email address');
			$this->add_warn_control('txtEmail');
		}    
		
        return count($this->warnings) == 0;		
    }
    
    
    //process
    function process(){

        if($this->validate()){
            
            //add details to session
            session_write("analysis_name", $this->data['txtName']);
            session_write("analysis_email", $this->data['txtEmail']);            
            
            //redirect
            redirect(WWW_SERVER . '/ratestart.php');
        }else{
            $this->bind();
            $this->render();        
        }
    }
    

}

//create class instance
$analyze_page = new analyze_page();

?>
