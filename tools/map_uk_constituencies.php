<?php

/*
    Map leaflets to UK parliamentry constituencies
*/

 	require_once(dirname(__FILE__) . "/include_path.php");
	require_once(dirname(__FILE__) . "/../includes/init.php");

    //get all constituencies
    $constituencies = get_constituencies();

    //get the constituency type for UK Parliament
    $leaflets = get_leaflets();

    //for each leaflet, try to map it to a consituency
    foreach ($leaflets as $leaflet) {
        try{
            $twfy_constituency = lookup_constituency($leaflet->postcode);
            $constituency = match_constituency($twfy_constituency['name'], $constituencies);
            if($constituency != false){
                $leaflet_constituency = factory::create('leaflet_constituency');
                $leaflet_constituency->leaflet_id = $leaflet->leaflet_id;
                $leaflet_constituency->constituency_id = $constituency->constituency_id;            
                $leaflet_constituency->insert();
                print_message($twfy_constituency['name'] . ' - ' . $leaflet->title);
            }else{
                print_message("skipped " .  $leaflet->postcode);                
            }
        } catch (Exception $e){
            print_message("skipped " .  $leaflet->postcode);
        }
        
        //sleep
        sleep(1);
    }

    function match_constituency($constituency_name, $constituencies){
        $return = false;
        $constituency_name = str_replace(',', '', $constituency_name);
        $constituency_name = str_replace('&', 'and', $constituency_name);        
        foreach ($constituencies as $constituency) {
            if($constituency->name == $constituency_name){
                $return = $constituency;
                break;
            }
        }

        return $return;
    }
    
    function get_leaflets(){

        $leaflet = factory::create('leaflet');
        return $leaflet->execute("
            Select leaflet.* from leaflet 
                left outer join leaflet_constituency on leaflet.leaflet_id = leaflet_constituency.leaflet_id
            where leaflet_constituency.leaflet_constituency_id is null
        ");            

    }

    function get_constituencies (){

        $constituency = factory::create('constituency');
        return $constituency->execute("
            Select constituency.* from constituency
                inner join constituency_type on constituency.constituency_type_id = constituency_type.constituency_type_id
            Where country_id = 225 and retired = 0
        ");

    }

    function lookup_constituency ($postcode){
        
        $cache = cache::factory();

		$cached = $cache->get('twfy' . $postcode);
		if (isset($cached) && $cached !== false && $cached !='') {
			return $cached;
		}else{
            $twfy = factory::create('twfy');
		    $twfy_constituency = $twfy->query('getConstituency', array('output' => 'php', 'postcode' => $postcode, 'future' => 'yes_please'));         
            $twfy_constituency = unserialize($twfy_constituency);
		    $success = $cache->set('twfy' . $postcode, $twfy_constituency);
		    if($success && isset($twfy_constituency) && $twfy_constituency !='' && $twfy_constituency != false){
			        return $twfy_constituency;		        
	        }else{
	            return false;
            }

		}

    }

    function print_message($message){
        print $message;
        print "\n";
    }
?>