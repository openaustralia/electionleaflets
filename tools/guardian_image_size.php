<?php

    require_once(dirname(__FILE__) . "/include_path.php");
    require_once(dirname(__FILE__) . "/../includes/init.php");

    //get all leaflets
    $search = factory::create('search');
    $leaflet_images = $search->search("leaflet_image", array(array("1", "=", "1")));
    
    foreach ($leaflet_images as $leaflet_image) {
        print "resizing" . "\n";
        $file_name = IMAGES_DIR . "/original/" . $leaflet_image->image_key . ".jpg";	        
        if (file_exists($file_name)){
            print "new image " . IMAGES_DIR . "/small/" . $leaflet_image->image_key . ".jpg \n";
            print IMAGE_SMALL_SIZE . '\n';
            resize_image($file_name, IMAGE_SMALL_SIZE, IMAGES_DIR . "/small/" . $leaflet_image->image_key . ".jpg");
            resize_image($file_name, IMAGE_THUMBNAIL_SIZE, IMAGES_DIR . "/thumbnail/" . $leaflet_image->image_key . ".jpg", true);
            print "resized" . "\n";            
        }else{
            print "failed" . "\n";
        }
    }

    // create new image

?>