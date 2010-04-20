<?php
    require_once('init.php');

    //grab the ID and size
    $image_id = get_http_var('i');
    $image_size = get_http_var('s');    

    //check vars passed
    if(!isset($image_id) || ($image_size != 't' && $image_size != 'm' && $image_size != 'l' && $image_size != 'o' && $image_size != 's')){
        throw_404();
    }

    // Permanent redirection
    header("HTTP/1.1 301 Moved Permanently");
    header("Location: ".s3_url($image_size,$image_id));
    header('Content-Type: image/jpeg');

?>
