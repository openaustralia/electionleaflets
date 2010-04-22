<?php
require_once('init.php');
require_once('table_classes/rate_value.php');

class random_page extends pagebase {


	//bind
	function bind() {
        
		//get the leaflet
		$search = factory::create("search");
		$result = $search->search("leaflet",
		    array(array("live", "=", 1)),
		    'AND',
		    null,
		    array(array('RAND()', 'DESC')),
		    1
		);

		$leaflet = null;
		if(count($result) != 1){
		    throw_404();
	    }else{
	        $leaflet = $result[0];
        }

        //get images
        $leaflet_images = $search->search("leaflet_image", 
            array(array("leaflet_id", "=", $leaflet->leaflet_id)),
            'AND',
            null,
            array(array("sequence", "ASC"))
            );

        //assign
		$this->page_title = $leaflet->title;
	    $this->assign("leaflet", $leaflet);
	    $this->assign("leaflet_images", $leaflet_images);
        $this->assign("leaflet_id", $leaflet->leaflet_id);
        $this->assign("rate_types", $rate_types);
        
		
	}	
	
}

//create class instance
$random_page = new random_page();

?>
