<?php

/*
    Load UK constituencies, no data gets deleted, only inserted and updated
    TODO: add wards and euro areas
*/

 	require_once(dirname(__FILE__) . "/include_path.php");
	require_once(dirname(__FILE__) . "/../includes/init.php");
	
	//get constituency list from theyworkforyou.com
    $date = date("Y");
    $date = $date + 1; // grab cosntituencies for next year
    $twfy = factory::create('twfy');
    $twfy_constituencies = $twfy->query('getConstituencies', array('output' => 'php', 'date' => $date)); 
    $twfy_constituencies = unserialize($twfy_constituencies);
    
    //get the constituency type for UK Parliament
    $constituency_type = get_constituency_type();
    
    foreach ($twfy_constituencies as $twfy_constituency) {

        #print_message("Name: " . $twfy_constituency['name']);
        #print_message("Wikipedia: " . wikipedia_url_from_name($twfy_constituency['name']));

        //set details
        $cosntituency = get_constituency_object($twfy_constituency['name']);
        $cosntituency->name = $twfy_constituency['name'];
        $cosntituency->wikipedia_url = wikipedia_url_from_name($twfy_constituency['name']);        
        $cosntituency->constituency_type_id = $constituency_type->constituency_type_id;

        if (isset($cosntituency->constituency_id)){
            $cosntituency->update();
        }else{
            $cosntituency->insert();            
        }
    }

    //create a new cosntituency or retrun the existing one
    function get_constituency_object($constituency_name){

        $cosntituency = factory::create('constituency');
        $search = factory::create('search');
        $results = $search->search('constituency', array(array("name", "=", $constituency_name)));
        print_message($constituency_name);
        if(count($results) == 1){
            $cosntituency = $results[0];
        }        
        
        return $cosntituency;
    }
    
    function wikipedia_url_from_name($constituency_name){
     
        $constituency_name = str_replace(' ', '_', $constituency_name);
        $constituency_name = str_replace('&', 'and', $constituency_name);        
        $url = 'http://en.wikipedia.org/wiki/' . $constituency_name . '_(UK_Parliament_constituency)';

        return $url;
    }

    function get_constituency_type(){
        $search = factory::create('search');
        $results = $search->search('constituency_type', array(array("name", "=", 'UK Parliament Constituency')));
        return $results[0];
    }


    function print_message($message){
        print $message;
        print "\n";
    }
?>