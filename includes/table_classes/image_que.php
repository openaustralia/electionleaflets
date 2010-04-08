<?php

/**
 * Table Definition for an email que item
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_image_que extends tablebase {

    public $__table = 'image_que';
    public $image_que_id;
    public $upload_key;
    public $image_key;
    public $name;
    public $email;
    public $uploaded_date;    

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_image_que',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'image_que_id'   	=> DB_DATAOBJECT_INT,
            'upload_key'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'image_key'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,            
            'name'  => DB_DATAOBJECT_STR,
            'email'  => DB_DATAOBJECT_STR,
            'uploaded_date'  => DB_DATAOBJECT_TIMESTAMP            
        );
    }

    function save_image($temp_file){

        //generate a random ID for this image
	    $this->image_key = md5(uniqid(rand(), true));

	    //copy original
	    $original_file_name = IMAGES_DIR . "/original/" . $this->image_key . ".jpg";
	    $moved = rename($temp_file, $original_file_name);

        if(!$moved){
            trigger_error("Failed to move image");
        }else{

            //save large
            resize_image($original_file_name, IMAGE_LARGE_SIZE, IMAGES_DIR . "/large/" . $this->image_key . ".jpg");
            
    	    //save medium
            resize_image($original_file_name, IMAGE_MEDIUM_SIZE, IMAGES_DIR . "/medium/" . $this->image_key . ".jpg");

            //save small
            resize_image($original_file_name, IMAGE_SMALL_SIZE, IMAGES_DIR . "/small/" . $this->image_key . ".jpg");
            
    	    //save thumbnail
            resize_image($original_file_name, IMAGE_THUMBNAIL_SIZE, IMAGES_DIR . "/thumbnail/" . $this->image_key . ".jpg", true);    	    

        }

    }

	/* Keys */
    function keys() {
        return array('image_que_id');
    }

}