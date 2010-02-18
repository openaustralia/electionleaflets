<?php

/*
    Load UK constituencies, no data gets deleted, only inserted and updated
    TODO: add wards and euro areas
*/

 	require_once(dirname(__FILE__) . "/include_path.php");
	require_once(dirname(__FILE__) . "/../includes/init.php");

    $total_count = 0;
    $success_count = 0;    
    $fail_count = 0;        

    //get the constituency type for UK Parliament
    $constituency_type = get_constituency_type();

    $guardian_constituencies = get_guardian_data();

    foreach ($guardian_constituencies as $guardian_constituency) {

        //set details
        $cosntituency = get_constituency_object($guardian_constituency['name']);
        if($cosntituency){
            $cosntituency->guardian_aristotle_id = $guardian_constituency['aristotle_id'];
            $cosntituency->guardian_pa_code = $guardian_constituency['pa_code'];        
            $cosntituency->update();
            //print_message('Updated ' . $guardian_constituency['name']);
            $success_count ++;
        }else{
            print_message('Failed to find a constituency called ' . $guardian_constituency['name']);
            $fail_count ++;            
        }
        
        $total_count ++;
    }

    print_message("Updated " . $success_count . "  out of " . $total_count . " (" . $fail_count . " failures)");

    function get_guardian_data (){
        $return = array();
        
        if (($handle = fopen("./data/guardian_constituencies.csv", "r")) !== FALSE) {
            $count = 0;
            while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
                if($count > 0){
                    $item = array('aristotle_id' => $data[0], 'name' => $data[1], 'pa_code' => $data[2]);
                    array_push($return, $item);
                }
                
                $count ++;
            }
            fclose($handle);
        }
        
        return $return;
    }

    //create a new cosntituency or retrun the existing one
    function get_constituency_object($constituency_name){

        $return = false;
        $cosntituency = factory::create('constituency');
        $search = factory::create('search');
        $results = $search->search('constituency', array(array("name", "=", $constituency_name)));
        if(count($results) > 0){
            $return = $results[0];
        }else{
         
            
            
        }

        return $return;
    }
    
    function wikipedia_url_from_name($constituency_name){
     
        $constituency_name = str_replace(' ', '_', $constituency_name);
        $constituency_name = str_replace('&', 'and', $constituency_name);        
        $url = 'http://en.wikipedia.org/wiki/' . $constituency_name . '_(UK_Parliament_constituency)';

        return $url;
    }

    function get_constituency_type(){
        $return = false;
        $search = factory::create('search');
        $results = $search->search('constituency_type', array(array("name", "=", 'UK Parliament Constituency')));
        if(count($results) == 1){
            $return = $results[0];
        }
        return $return;
    }


    function print_message($message){
        print $message;
        print "\n";
    }
?>