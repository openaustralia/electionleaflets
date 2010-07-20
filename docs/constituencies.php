<?php
require_once('init.php');

class constituencies_page extends pagebase {
    
    private $has_search = false;

    //load
    function load(){

        $search = factory::create('search');
        $postcode = get_http_var('p');
        $constituency_url_id = get_http_var('c');
        $constituency = null;        
        
        //is postcode set?
        if(isset($postcode) && $postcode != '' && is_postcode($postcode)){
            
            $this->has_search = true;
            
            //lookup constituency and redirect
            $constituency_lookup = $this->lookup_constituency($postcode);
            if($constituency_lookup){
                $result = $search->search("constituency", array(array("name", "=", $constituency_lookup)));
                if(count($result) == 1){
                    $constituency = $result[0];
                }
            }
        }else if(isset($constituency_url_id) && $constituency_url_id != '') {
            $this->has_search = true;
            $result = $search->search("constituency", array(array("url_id", "=", $constituency_url_id)));
            if(count($result) == 1){
                $constituency = $result[0];
            }
        }
        
        //redirect
        if (isset($constituency)){
            redirect(WWW_SERVER . "/" . AREA_NAMES . "/" . $result[0]->url_id);
        }
        
    }
    
    function bind(){
        
        if($this->has_search){
            $this->add_warning("sorry, we couldn't find a constituency for you");
        }
        
        $search = factory::create('search');     
        $constituencies = $search->search_cached("constituency", 
                array(array("1", "=", "1")),
                "AND", null,
                array(array("name", "ASC"))
            );
        $this->assign("constituencies", $constituencies);
        
    }

    // Returns name of constituency for a given postcode
    private function lookup_constituency ($postcode){

        $cache = cache::factory();

		$cached = $cache->get('twfy' . $postcode);
		if (isset($cached) && $cached !== false && $cached !='') {
			return $cached;
		}else{
		    if (COUNTRY_ISO == "GB") {
                $twfy = factory::create('twfy');
		        $twfy_constituency = $twfy->query('getConstituency', array('output' => 'php', 'postcode' => $postcode, 'future' => 'yes_please'));         
                $twfy_constituency = unserialize($twfy_constituency);
		        $success = $cache->set('twfy' . $postcode, $twfy_constituency);
                $twfy_constituency = $twfy_constituency["name"];
	        }
	        else if (COUNTRY_ISO == "AU") {
	            $success = true;
	            $search = factory::create('search');
        		$constituencies = $search->search("australian_postcode", 
        		    array(array('postcode', '=', $postcode)),
        		    'AND',
        		    null,
        		    array(array('constituency', "ASC"))
        		);
        		// For the time being just return the first result
        		return $constituencies[0]->constituency;
            }
            else
                $success = false;

		    if($success && isset($twfy_constituency) && $twfy_constituency !='' && $twfy_constituency != false){
			        return $twfy_constituency;		        
	        }else{
	            return false;
            }

		}

    }

}

//create class instance
$constituencies_page = new constituencies_page();

?>
