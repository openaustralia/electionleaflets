<?php

/*
    rotate an image
*/

 	require_once(dirname(__FILE__) . "/include_path.php");
	require_once(dirname(__FILE__) . "/../includes/init.php");
	require_once(dirname(__FILE__) . "/../includes/mail_image.php");

    $mail_server = 'imap.gmail.com';
    $username = 'straighttest@googlemail.com';
    $password = 'straighttest1';

    $mail_image = new MailImage($mail_server, $username, $password);
    $messages = $mail_image->fetch();

    foreach ($messages as $message) {
        $postcode = $message['postcode'];
        $file_type = $message['file_type'];
        $images = $message['images'];
        $from_address = $message['from_address'];
        $image_ids = array();

        foreach ($images as $image) {

            //generate a random ID for this image
    	    $file_id = md5(uniqid(rand(), true));
    	    $original_file_name = IMAGES_DIR . "/original/" . $file_id . ".jpg";
    	    array_push($image_ids, $file_id);

    	    if ($file_type == 'gif'){
                imagepng($tmp, $original_file_name, 100);            
            }else{
                imagejpeg($tmp, $original_file_name, 100);
            }

        }

    }

?>