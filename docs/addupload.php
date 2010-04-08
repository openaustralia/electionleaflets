<?php
require_once('init.php');

class addupload_page extends pagebase {    

    //setup
    function setup(){

        //clear session
        session_delete("upload_key");

        //store callback url in viewstate if needed
        $callback = get_http_var('callback');        
        if(isset($callback)){
            if(valid_url($callback)){
                $callback = urldecode($callback);
                $this->viewstate['callback'] = $callback;                
            }
        }
        
        //create a new upload id and add to viewstate
        session_write("upload_key", md5(uniqid(rand(), true))); 
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
            	    $image_que = factory::create('image_que');
            	    $image_que->upload_key =  session_read("upload_key");
            	    $this->viewstate['upload_key'];
            	    $image_que->save_image($temp_file);
            	    $image_que->insert();
                }
            }
	    }
    }
    
    function validate(){
        return count($this->warnings) == 0;
    }
    
    function process(){
     
        if($this->validate()){

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
        if(count($this->warnings) == 0){
            
            //save it to disk in a temp location
            $temp_file_name = TEMP_DIR . '/' . md5(uniqid(rand(), true));
    	    $moved = move_uploaded_file($image['tmp_name'], $temp_file_name);
    	    if($moved){
    	        $return = $temp_file_name;
	        }
        }

        return $return;
    }

}

//create class addupload_page
$addupload_page = new addupload_page();

?>
