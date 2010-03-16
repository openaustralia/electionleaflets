<?php

    require_once(dirname(__FILE__) . "/include_path.php");
    require_once(dirname(__FILE__) . "/../includes/init.php");

    //get all parties
    $search = factory::create('search');
    $parties = $search->search("party", array(array("1", "=", "1")));

    foreach ($parties as $party) {
        $logo_file = find_logo($party->name);
        if($logo_file){

            //new file name
            $file_name = str_replace(' ', '_', $party->name . '.png');

            //resize
            resize_image($logo_file, LOGO_LARGE_SIZE, LOGOS_DIR . "/large/" . $file_name);
            resize_image($logo_file, LOGO_MEDIUM_SIZE, LOGOS_DIR . "/medium/" . $file_name);
            resize_image($logo_file, LOGO_SMALL_SIZE, LOGOS_DIR . "/small/" . $file_name);
            resize_image($logo_file, LOGO_THUMBNAIL_SIZE, LOGOS_DIR . "/thumbnail/" . $file_name, true);

            $party->logo_file = $file_name;
            $party->save();
        }
    }

    //try and find a logo (images are in the data directory)
    function find_logo($party_name){
        $return = false;
        $logos_dir = dirname(__FILE__) . "/data/party_logos/";
        for ($i=1; $i < 4; $i++) { 
            $test_file = $logos_dir . $party_name . '_' . $i . '.gif';
            if (file_exists($test_file)){
                $return = $test_file;
                break;
            }
        }
        return $return;
    }

?>