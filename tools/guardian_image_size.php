<?php

    //get all leaflets
    $leaflet_images = $search->search_cached("leaflet_image", array(array("1", "=", "1")));
    
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