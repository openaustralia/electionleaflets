<?php

/*
    rotate an image
*/

 	require_once(dirname(__FILE__) . "/include_path.php");
	require_once(dirname(__FILE__) . "/../includes/init.php");

    //specific user_id set?
	$swiches = getopt('i:d:l:');
	$leaflet_image_id = isset($swiches['i']) ? $swiches['i'] : null;	
	$degrees = isset($swiches['d']) ? $swiches['d'] : 0;
	$leaflet_id = isset($swiches['l']) ? $swiches['l'] : null;		
    		
	//setup search
	$search = factory::create('search');
    $leaflet_images = array();
	//all images vs 1
	if(isset($leaflet_image_id)){
    	//get a single image
    	$leaflet_images = $search->search('leaflet_image', 
    		array(array("leaflet_image_id", "=", $leaflet_image_id)));	    
    }else{
        //get all images for a leaflet
    	$leaflet_images = $search->search('leaflet_image', 
    		array(array("leaflet_id", "=", $leaflet_id)));            		
    }

	foreach ($leaflet_images as $leaflet_image) {
        if($leaflet_image->rotate($degrees)){
            print "success! \n";
        }else{
            print "failed! \n";            
        }
	}

?>