<?php
require_once('init.php');

class uploadv2_page extends pagebase {    

    //setup
    function setup(){
    }

	//bind
	function bind() {
		$this->page_title = "Add a leaflet";
		$upload_key = md5(uniqid(rand(), true));
		$this->upload_key = $upload_key;
		session_delete("upload_key");
		session_write("upload_key", $upload_key);
		error_log("upload_key set to:".$upload_key);
	}

	function unbind(){
	    //get image		
        $upload_key = get_http_var('upload_key');        
		error_log("upload_key set to:".$upload_key);
        $image_que = factory::create('image_que');
        if(isset($_FILES['Filedata']) && $_FILES['Filedata']['name'] != '' && isset($upload_key) &&  $upload_key != ''){
               $temp_file = $this->upload_image('Filedata');
               if($temp_file !== false){
           	    $image_que->upload_key =  $upload_key;
           	    $image_que->save_image($temp_file);
           	    $image_que->insert();
               }
           }
		else{
			error_log("File not uploaded");
		}
    }
    
    function validate(){
        return count($this->warnings) == 0;
    }
    
    function process(){

    }

    private function upload_image($upload_control){
        $return = false;
        $image = $_FILES[$upload_control];

        //not uploaded file?
        if(!is_uploaded_file($image["tmp_name"])){
            $this->add_warning("Sorry, An error occurred uploading your image");
        }else{
            //has errors?
            if($image['error'] != 0){
                $this->add_warning("Please select an image to upload");
            }else{   
                // not an image?
                if(!getimagesize($image['tmp_name'])){
                     $this->add_warning("Sorry, that doesn't seem to be an image file");                                    
                 }
            }
            //check is jpeg-Uploadify does not send mime-type, so use a PHP function instead
			$finfo = finfo_open(FILEINFO_MIME_TYPE);
			$image_type = finfo_file($finfo, $image['tmp_name']);
			finfo_close($finfo);
            if($image_type != "image/jpeg" && $image_type != "image/pjpeg"){
                 $this->add_warning("Sorry, your image needs to be in jpeg/jpg format");
            }
        }   
        //if errors return false
        if(count($this->warnings) == 0){
            //save it to disk in a temp location
            $temp_file_name = TEMP_DIR . '/' . md5(uniqid(rand(), true));
    	    $moved = move_uploaded_file($image['tmp_name'], $temp_file_name);
    	    if($moved){
    	        $return = $temp_file_name;
	        }
        }
		error_log("Problems with image");
        return $return;
    }

}

//create class addupload_page
$uploadv2_page = new uploadv2_page();

?>
