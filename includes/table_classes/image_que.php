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
	    // $this->image_key = md5(uniqid(rand(), true));
	
		//use an md5 of the file as a hash to prevent reuploads of the same file
		$this->image_key = md5_file($temp_file);

	    //copy original
	    $original_file_name = IMAGES_DIR . "/original/" . $this->image_key . ".jpg";
	    $moved = rename($temp_file, $original_file_name);

        if(!$moved){
            trigger_error("Failed to move image");
        }else{
            S3::setAuth(AWS_KEY, AWS_SECRET);
            
            //save large
            $this->save_sized_image($original_file_name,$this->image_key,IMAGE_LARGE_SIZE,"large");
            
    	    //save medium
    	    $this->save_sized_image($original_file_name,$this->image_key,IMAGE_MEDIUM_SIZE,"medium");

            //save small
            $this->save_sized_image($original_file_name,$this->image_key,IMAGE_SMALL_SIZE,"small");
            
    	    //save thumbnail
    	    $this->save_sized_image($original_file_name,$this->image_key,IMAGE_THUMBNAIL_SIZE,"thumbnail");
        }

    }
    
    function save_sized_image($original,$key,$size, $folder){
        $file = $folder."/" . $key . ".jpg";
        $file_path = IMAGES_DIR ."/". $file;
        resize_image($original, $size, $file_path);    
        //$input = S3::inputFile($file_path);
        //S3::putObject($input, S3_BUCKET, $file, S3::ACL_PUBLIC_READ);
	//MJFIXME
    }

	/* Keys */
    function keys() {
        return array('image_que_id');
    }

}
