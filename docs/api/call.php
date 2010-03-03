<?php
require_once('init.php');

class apicall_page extends pagebase {

    private $method = null;
    private $output = null;
    private $all_arguments = array();    
	private $leaflet_search = null;
	private $success = false;
	private $count = 5;
	private $max_count = 30;

    //setup
    function setup(){
        
        //get vars
        $method = get_http_var('method');
        if($method){
            $this->method = $method;
        }
        
        $count = get_http_var('count');
        if($count){
            if($count < $this->max_count){
                $this->count = $count;
            }else{
                $this->count = $this->max_count;
            }
        }
        
        $output = get_http_var('output');
        if($output){
            $this->output = $output;
        }
        
        $this->all_arguments = $_GET;
        
        
        //setup search
		$this->leaflet_search = factory::create("leaflet_search");
		
    }
        
    
	//bind
	function bind() {
		
		$this->reset_smarty(TEMPLATE_DIR . "/api/" . $this->output . ".tpl");
    	$result = $this->get_data();
    	    		
		if($this->method == 'constituency'){    	    
    	    if($this->success){
    	        $this->assign("leaflets", $result);
    	        $this->assign("has_leaflets", count($result) > 0);	        
    		}else{
    		    throw_404();
    	    }
        }else{
    	    $this->assign("result", $result);            
        }
	}

    function get_data(){
        $return = null;
        $this->leaflet_search->number = $this->count;
        
        if($this->method == 'constituency'){
            $constituency = null;
            
            // for now we are only handling the guardian
            if(isset($this->all_arguments['aristotle_id'])){
                $search = factory::create('search');
                $result = $search->search_cached("constituency", 
                        array(array("guardian_aristotle_id", "=", $this->all_arguments['aristotle_id'])));                        
                if(count($result) > 0){        
                    $constituency = $result[0];
                }
            }

            //if constituency, proceed
            if(isset($constituency)){
                $this->leaflet_search->constituency_id = $constituency->constituency_id;
                $this->success = true;
                $return = $this->leaflet_search->search();
            }
            
        }else if ($this->method == 'image'){
            if(isset($this->all_arguments['leaflet_id']) && isset($this->all_arguments['size'])){
                $search = factory::create('search');                
                $result = $search->search_cached("leaflet_image", 
                        array(array("leaflet_id", "=", $this->all_arguments['leaflet_id'])));
                if (count($result) > 0){
                    return WWW_SERVER . '/image.php?i=' . $result[0]->image_key . '&s=' . $this->all_arguments['size'];
                }
            }                
        }
        
        return $return;
    }

}

//create class instance
$apicall_page = new apicall_page();

?>
