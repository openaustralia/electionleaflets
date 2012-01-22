<?php
require_once('init.php');

class leaflet_page extends pagebase {

    private $leaflet_id = null;

    //setup
    function setup(){
        $leaflet_id = get_http_var('q');
        if(!isset($leaflet_id)){
            throw_404();                
        }else{
            if($leaflet_id == 1362){
                //redirects
                redirect(WWW_SERVER . '/leaflets/' . 1339);
            }else if($leaflet_id == 1882){
                //redirects
                redirect(WWW_SERVER . '/leaflets/' . 1842);
            }else{
                $this->leaflet_id = $leaflet_id;
            }
        }
        
        $message_id = get_http_var('m');
        if($message_id == 1){
            $this->add_message("Thank you, your leaflet has been added");
        }
    }

	//bind
	function bind() {

		//get the leaflet
		$search = factory::create("search");
		$result = $search->search("leaflet",
		    array(array("leaflet_id", "=", $this->leaflet_id), array('live', '=', 1)),
		    'AND',
		    array(array("party", "inner"))
		);
		$leaflet = null;
		if(count($result) != 1){
		    throw_404();
	    }else{
	        $leaflet = $result[0];
        }

        //get images
        $leaflet_images = $search->search("leaflet_image", 
            array(array("leaflet_id", "=", $this->leaflet_id)),
            'AND',
            null,
            array(array("sequence", "ASC"))
            );

        //get categories
        $leaflet_categories = $search->search("category", 
                array(array("leaflet_category.leaflet_id", "=", $this->leaflet_id)),
                'AND',
                array(array("leaflet_category", 'inner'))
            );

        //get tags
        $leaflet_tags = $search->search("tag", 
                array(array("leaflet_tag.leaflet_id", "=", $this->leaflet_id)),
                'AND',
                array(array("leaflet_tag", 'inner'))
            );

        //get parties attacked
        $leaflet_parties_attacked = $search->search("party", 
                array(array("leaflet_party_attack.leaflet_id", "=", $this->leaflet_id)),
                'AND',
                array(array("leaflet_party_attack", 'inner'))
            );

        //get constituencies
        $leaflet_constituencies = $search->search("constituency", 
                array(array("leaflet_constituency.leaflet_id", "=", $this->leaflet_id)),
                'AND',
                array(array("leaflet_constituency", 'inner'))
            );    
        //get election
        $leaflet_elections = $search->search("election",
                array(array("leaflet_election.leaflet_id", "=", $this->leaflet_id)),
                'AND',
                array(array("leaflet_election", 'inner'))
            );
        set_election_id($leaflet_elections[0]->election_id);

        //js
        $this->onloadscript = "showMap('" . MAP_PROVIDER . "', " . number_format($leaflet->lng, 2) . ", " . number_format($leaflet->lat, 2) .");";        

        //assign
		$this->page_title = $leaflet->title . " (an election leaflet published by " . $leaflet->party_name . ")";

        $this->has_map = true;
	    $this->assign("leaflet", $leaflet);
	    $this->assign("leaflet_images", $leaflet_images);
	    $this->assign("leaflet_categories", $leaflet_categories);
	    $this->assign("leaflet_tags", $leaflet_tags);	
	    $this->assign("constituency", $leaflet_constituencies[0]);
	    $this->assign("election", $leaflet_elections[0]);
	    $this->assign("leaflet_parties_attacked", $leaflet_parties_attacked);

	}

}

//create class instance
$leaflet_page = new leaflet_page();

?>
