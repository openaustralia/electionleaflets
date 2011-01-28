<?php
require_once('init.php');

class constituencies_page extends pagebase {
    
    private $has_search = false;
    private $constituencies = false;
    private $postcode = false;
    
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
                $constituencies = array();
                foreach($constituency_lookup as $name) {
                    $result = $search->search("constituency",
                         array(array("name", "=", $name),array("constituency_election.election_id", "=", $election_id)),
                         "AND",
                         array(array("constituency_election", "inner")),
                         array(array("name", "ASC"))
                         );
                    if(count($result) == 1){
                        $constituencies[] = $result[0];
                    }
                }
                // Loop through the names and assign 
                if (count($constituencies) == 1) {
                    $constituency = $constituencies[0];
                }
                else if (count($constituencies) > 1) {
                    $this->constituencies = $constituencies;
                    $this->postcode = $postcode;
                }
            }
        }else if(isset($constituency_url_id) && $constituency_url_id != '') {
            $this->has_search = true;
            $result = $search->search("constituency",
                 array(array("url_id", "=", $constituency_url_id),array("constituency_election.election_id", "=", $election_id)),
                 "AND",
                 array(array("constituency_election", "inner")),
                 null);
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
        
        if($this->constituencies) {
            $s = "";
            foreach($this->constituencies as $c) {
                $s = $s . '<li><a href="' . $c->url_id . '">' . $c->name . '</a></li>';
            }
            $this->add_warning("There are several electorates within postcode " . $this->postcode. ". Choose from one of the following: <ul>". $s . "</ul>");
        }
        else if($this->has_search){
            $this->add_warning("sorry, we couldn't find a constituency for you");
        }
        
        $search = factory::create('search');     
        $constituencies = $search->search_cached("constituency", 
                array(array("constituency_election.election_id", "=", $election_id)),
                "AND",
                array(array("constituency_election", "inner")),
                array(array("name", "ASC"))
            );
        $this->assign("constituencies", $constituencies);
        
    }

    // Returns array of names of constituency for a given postcode
    private function lookup_constituency ($postcode){

        $cache = cache::factory();

		$cached = $cache->get('twfy' . $postcode);
		if (isset($cached) && $cached !== false && $cached !='') {
			return $cached;
		}else{
		    if (COUNTRY_CODE_TLD == "uk") {
                $twfy = factory::create('twfy');
		        $twfy_constituency = $twfy->query('getConstituency', array('output' => 'php', 'postcode' => $postcode, 'future' => 'yes_please'));         
                $twfy_constituency = unserialize($twfy_constituency);
		        $success = $cache->set('twfy' . $postcode, $twfy_constituency);
                $twfy_constituency = array($twfy_constituency["name"]);
	        }
	        else if (COUNTRY_CODE_TLD == "au") {
	            $australian_postcode = factory::create("australian_postcode");
	            return $australian_postcode->lookup_constituency_names($postcode);
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
