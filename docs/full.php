<?php
require_once('init.php');

class full_page extends pagebase {

    private $leaflet_id = null;

    //setup
    function setup(){
        $leaflet_id = get_http_var('q');
        if(!isset($leaflet_id)){
            throw_404();
        }else{
            $this->leaflet_id = $leaflet_id;
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

        //assign
		$this->page_title = "Full image of " . $leaflet->title . " ( election leaflet published by " . $leaflet->party_name . ")";
	    $this->assign("leaflet", $leaflet);
	    $this->assign("leaflet_images", $leaflet_images);
		
	}

}

//create class instance
$full_page = new full_page();

?>
