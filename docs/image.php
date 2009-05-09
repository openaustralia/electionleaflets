<?php
    require_once('init.php');

    //grab the ID and size
    $image_id = get_http_var('i');
    $image_size = get_http_var('s');    

    //check vars passed
    if(!isset($image_id) || ($image_size != 't' && $image_size != 'm' && $image_size != 'l' && $image_size != 'o')){
        throw_404();
    }
    
    //get file name
    $file_name = IMAGES_DIR;
    if($image_size == 't'){
        $file_name .= "/thumbnail/";
    }
    if($image_size == 'm'){
        $file_name .= "/medium/";
    }
    if($image_size == 'l'){
        $file_name .= "/large/";
    }
    /*
    if($image_size == 'o'){
        $file_name .= "/original/";
    }
    */
    
    $file_name .= $image_id . ".jpg";

    //check file exists
    if (file_exists($file_name)){
        //output image
        header('Content-Type: image/jpeg');
        $image = imagecreatefromjpeg($file_name);
        imagejpeg($image);        
    }else{
        throw_404();
    }




?>
