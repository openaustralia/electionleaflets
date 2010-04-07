<?php

/*
    create url is'd (slugs) for tables that dont have them
*/

 	require_once(dirname(__FILE__) . "/../include_path.php");
	require_once(dirname(__FILE__) . "/../../includes/init.php");

	//setup search
	$search = factory::create('search');

    //update parties
    $parties = $search->search('party', array(array("1", "=", "1")));
    foreach ($parties as $party) {
        if (!isset($party->url_id)){
		    $party->url_id = $party->generate_url_id($party->name);		    
		    if(!$party->url_id){
		        $party->url_id = $party->party_id;
	        }
		    $party->update();
        }
    }

?>