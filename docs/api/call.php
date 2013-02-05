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

        //add a cache header
        //TODO: make this generic and add to config file
		$expires = 60*60*5;
        header("Pragma: public");
        header("Cache-Control: maxage=".$expires);
        header('Expires: ' . gmdate('D, d M Y H:i:s', time()+$expires) . ' GMT');

		//output
		$this->reset_smarty(TEMPLATE_DIR . "/api/" . $this->output . ".tpl");
    	$result = $this->get_data();

        // Add JSONP callback. Not sure if urlencode needed - better safe than sorry??
        $this->assign('callback', urlencode($this->all_arguments['callback']));

		if($this->method == 'constituency' || $this->method == 'party'|| $this->method == 'latest'){    	    
    	    if($this->success){
    	        $this->assign("leaflets", $result);
    	        $this->assign("method", $this->method);    	        
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
        $search = factory::create('search');
                
        //cosntituency
        if($this->method == 'constituency'){
            $constituency = null;

            // for now we are only handling the guardian
            if(isset($this->all_arguments['aristotle_id'])){
                $result = $search->search_cached("constituency", 
                        array(array("guardian_aristotle_id", "=", $this->all_arguments['aristotle_id'])));                        
                if(count($result) > 0){        
                    $constituency = $result[0];
                }
            }else{

                $result = $search->search_cached("constituency", 
                        array(array("url_id", "=", $this->all_arguments['constituency'])));
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
            
        }

        //party
        if($this->method == 'party'){

            // for now we are only handling the guardian
            if(isset($this->all_arguments['party_id'])){

                $this->leaflet_search->publisher_party_id = $this->all_arguments['party_id'];
                $this->success = true;
                $return = $this->leaflet_search->search();
                
            }
        }
        
        //latest
        if($this->method == 'latest'){
            $this->success = true;
            $return = $this->leaflet_search->search();
        }
        

        //image
        if ($this->method == 'image'){
            if(isset($this->all_arguments['leaflet_id']) && isset($this->all_arguments['size'])){
                $search = factory::create('search');                
                $result = $search->search_cached("leaflet_image", 
                        array(array("leaflet_id", "=", $this->all_arguments['leaflet_id'])));
                if (count($result) > 0){
                    return s3_url($this->all_arguments['size'],$result[0]->image_key);
					// return WWW_SERVER . '/image.php?i=' . $result[0]->image_key . '&s=' . $this->all_arguments['size'];
                }
            }                
        }

        
        return $return;
    }

}

//create class instance
$apicall_page = new apicall_page();

?>
