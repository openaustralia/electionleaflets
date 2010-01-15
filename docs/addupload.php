<?php
require_once('init.php');

class addupload_page extends pagebase {

    private $image_ids = array();

    //setup
    function setup(){
        //clear session
        session_delete("image_ids");
        
        //store callback url in viewstate if needed
        $callback = get_http_var('callback');        
        if(isset($callback)){
            if(valid_url($callback)){
                $callback = urldecode($callback);
                $this->viewstate['callback'] = $callback;                
            }
        }
    }

	//bind
	function bind() {
		$this->page_title = "Add a leaflet (step 1 of 2)";				
	}

	function unbind(){

	    //get images
	    foreach ($_FILES as $key => $value) {
	        if(isset($_FILES[$key]) && $_FILES[$key]['name'] != ''){
                $temp_file = $this->upload_image($key);
                if($temp_file !== false){
                    $this->save_image($temp_file);
                }
            }
	    }
    }
    
    function validate(){
        return count($this->warnings) == 0;
    }
    
    function process(){
     
        if($this->validate()){

            //save IDs to session
            session_write("image_ids", $this->image_ids);

            //redirect with callback provided
            if($this->viewstate['callback']){
                redirect("addinfo.php?callback=" . urlencode($this->viewstate['callback']));
            }else{
                redirect("addinfo.php");                                
            }
            
        }else{
            $this->bind();
            $this->render();
        }

    }

    private function save_image($temp_file){

	    //generate a random ID for this image
	    $file_id = md5(uniqid(rand(), true));
	    array_push($this->image_ids, $file_id);

	    //copy original
	    $original_file_name = IMAGES_DIR . "/original/" . $file_id . ".jpg";
	    $moved = move_uploaded_file($temp_file, $original_file_name);

        if(!$moved){
            $this->add_warning("Sorry something went wrong saving your image");
        }else{

            //save large
            resize_image($original_file_name, IMAGE_LARGE_SIZE, IMAGES_DIR . "/large/" . $file_id . ".jpg");
            
    	    //save medium
            resize_image($original_file_name, IMAGE_MEDIUM_SIZE, IMAGES_DIR . "/medium/" . $file_id . ".jpg");

    	    //save thumbnail
            resize_image($original_file_name, IMAGE_THUMBNAIL_SIZE, IMAGES_DIR . "/thumbnail/" . $file_id . ".jpg");    	    
        }

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
            //check is jpeg
            if($image['type'] != "image/jpeg" && $image['type'] != "image/pjpeg"){
                $this->add_warning("Sorry, your image needs to be in jpeg/jpg format");
            }
        }
        
        //if errors return false
        if(count($this->warnings) > 0){
            $return = false;
        }else{
            $return = $image['tmp_name'];            
        }
        
        return $return;
    }

}

//create class addupload_page
$addupload_page = new addupload_page();

?>
