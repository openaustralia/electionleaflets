<?php

/*
    rotate an image
*/

 	require_once(dirname(__FILE__) . "/include_path.php");
	require_once(dirname(__FILE__) . "/../includes/init.php");
	require_once(dirname(__FILE__) . "/../includes/mail_image.php");

    $mail_server = UPLOAD_MAIL_SERVER;
    $username = UPLOAD_MAIL_USER;
    $password = UPLOAD_MAIL_PASSWORD;

    $mail_image = new MailImage($mail_server, $username, $password);
    $mail_image->fetch(true);

    foreach ($mail_image->messages as $message) {

        //make a new uplaod key
        $upload_key = md5(uniqid(rand(), true));
        
        //get the various bits and bobs out of the message
        $postcode = $message['postcode'];
        $file_type = $message['file_type'];
        $images = $message['images'];
        $from_name = $message['from_name'];
        $from_email = $message['from_email'];
        
        if(count($images) <= 0){
            send_fail($from_email);
        }else{

            foreach ($images as $image) {

                //create a new item in the uplaod que
                $image_que = factory::create('image_que');
                $image_que->upload_key = $upload_key;
                $image_que->image_key = md5(uniqid(rand(), true));
                $image_que->name = $from_name;
                $image_que->email = $from_email;

                //save the images to disc in temp folder, then trigger the resize and save the image que item
                $temp_file = TEMP_DIR  . '/' .  md5(uniqid(rand(), true));
        	    if ($file_type == 'gif'){
                    imagepng($image, $temp_file, 100);            
                }else{
                    imagejpeg($image, $temp_file, 100);
                }

        	    $image_que->save_image($temp_file);
                $image_que->insert();
            }
            
            //send success
            send_success($from_email, $upload_key);            
        }
    }


function send_success($email, $upload_key){

    $smarty = new Smarty();
    $smarty->compile_dir = SMARTY_PATH;
    $smarty->compile_check = true;
    $smarty->template_dir = TEMPLATE_DIR;
    $smarty->assign('url', WWW_SERVER . '/confirm.php?q=' . $upload_key);

    $subject = 'Confirm your leaflet and add some details';
    $body = $smarty->fetch(TEMPLATE_DIR . '/emails/emailin_success.tlp');

	//send email
	print $body;
	send_text_email(trim($email), SITE_NAME, CONFIRMATION_EMAIL, $subject, $body);
}


function send_fail($email){

    $smarty = new Smarty();
    $smarty->compile_dir = SMARTY_PATH;
    $smarty->compile_check = true;
    $smarty->template_dir = TEMPLATE_DIR;

    $subject = 'Failed to upload leadflet';
    $body = $smarty->fetch(TEMPLATE_DIR . '/emails/emailin_fail.tpl');

	//send email
	send_text_email(trim($email), SITE_NAME, CONFIRMATION_EMAIL, $subject, $body);
}

?>