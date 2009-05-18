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
            $this->leaflet_id = $leaflet_id;
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
		    array(array("leaflet_id", "=", $this->leaflet_id)),
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
        //

        //js
        $this->onloadscript = "showMap('" . MAP_PROVIDER . "', " . $leaflet->lng . ", " . $leaflet->lat .");";

        //assign
		$this->page_title = $leaflet->title . " ( election leaflet published by " . $leaflet->party_name . ")";
        $this->has_map = true;
	    $this->assign("leaflet", $leaflet);
	    $this->assign("leaflet_images", $leaflet_images);
	    $this->assign("leaflet_categories", $leaflet_categories);
	    $this->assign("leaflet_tags", $leaflet_tags);	
	    $this->assign("leaflet_parties_attacked", $leaflet_parties_attacked);
		
	}

}

//create class instance
$leaflet_page = new leaflet_page();

?>
