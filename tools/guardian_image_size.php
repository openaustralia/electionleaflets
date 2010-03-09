<?php

    //get all leaflets
    $search = factory::create('search');
    $leaflet_images = $search->search("leaflet_image", array(array("1", "=", "1")));
    
    foreach ($leaflet_images as $leaflet_image) {
        $file_name = IMAGES_DIR . "/original/" . $leaflet_image->image_key . ".jpg";	        
        if (file_exists($file_name)){
            resize_image($file_name, IMAGE_SMALL_SIZE, IMAGES_DIR . "/small/" . $file_id . ".jpg");
            resize_image($file_name, IMAGE_THUMBNAIL_SIZE, IMAGES_DIR . "/thumbnail/" . $file_id . ".jpg", true);
        }else{
            $return = false;
        }
    }

    // create new image

?>