<?php

    require_once(dirname(__FILE__) . "/include_path.php");
	require_once(dirname(__FILE__) . "/../includes/init.php");

	$swiches = getopt('i:s');
	$leaflet_id = isset($swiches['i']) ? $swiches['i'] : null;	
	$show = isset($swiches['s']) ? 1 : 0;

    if(!isset($leaflet_id)){
        print "help: php hide.php -i[LEALFET ID] -s[show] \n";
    }else{
     	$search = factory::create('search');
     	$leaflets = $search->search('leaflet', 
    		array(array("leaflet_id", "=", $leaflet_id)));   
    	if(count($leaflets) == 1){
    	    $leaflets->live = $show;
    	    print $leaflets->live;
    	    $leaflets->update();
	    }else{
            print "cant find a leaflet for that id";	        
        }
    }
    
?>