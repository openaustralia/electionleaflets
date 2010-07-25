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
            if($leaflet_id == 1362){
                //redirects
                redirect(WWW_SERVER . '/full.php?q=' . 1339);
            }else if($leaflet_id == 1882){
                //redirects
                redirect(WWW_SERVER . '/full.php?q=' . 1842);
            }else{
                $this->leaflet_id = $leaflet_id;
            }
        }

    }

	//bind
	function bind() {

		//get the leaflet
		$search = factory::create("search");
		$result = $search->search("leaflet",
		    array(array("leaflet_id", "=", $this->leaflet_id), array("live", "=", 1)),
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
	    $this->assign("is_full_view", true);
		
	}

}

//create class instance
$full_page = new full_page();

?>
