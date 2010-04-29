<?php
require_once('init.php');

class upload_page extends pagebase {    

    //setup
    function setup(){
        //store callback url in viewstate if needed
        $callback = get_http_var('callback');        
        if(isset($callback)){
            if(valid_url($callback)){
                $callback = urldecode($callback);
                $this->viewstate['callback'] = $callback;                
            }
        }

        //create a new upload id and add to viewstate
        $this->viewstate['upload_key'] = md5(uniqid(rand(), true));
    }

	//bind
	function bind() {
		$this->page_title = "Add a leaflet";
		$this->has_upload = true;
		$this->onloadscript = 'setupUploader();';
	}
    
    function handle_upload(){

        //get image
        $upload_key = $this->viewstate['upload_key'];
        $image_que = factory::create('image_que');
        if(isset($_FILES['Filedata']) && $_FILES['Filedata']['name'] != '' && isset($upload_key) &&  $upload_key != ''){
               $temp_file = $this->upload_image('Filedata');
               if($temp_file !== false){                   
           	    $image_que->upload_key =  $upload_key;
           	    $image_que->save_image($temp_file);
           	    $image_que->insert();
               }
           }
		header("Content-type: application/json; charset=utf-8");
		if ($this->validate()){
			print json_encode(array(
					"success" 	=> true,
					"image_key" => $image_que->image_key,
					"image_url"	=> s3_url('s',$image_que->image_key)
				));
		}
		else{
			print json_encode(array(
					"success" 	=> false,
					"warnings"	=> $this->warnings
				));
		}
    }
    
    function validate(){
        return count($this->warnings) == 0;
    }
    
    function process(){
	    if($this->data['_is_uploadify'] == "1"){
	        $this->handle_upload();
        }else{
            redirect(WWW_SERVER . "/addinfo.php?key=" . $this->viewstate['upload_key']);
        }
    }

    private function upload_image($upload_control){
        $return = false;
        $image = $_FILES[$upload_control];
        //not uploaded file?
        if(!is_uploaded_file($image["tmp_name"])){
            $this->add_warning("Sorry, An error occurred uploading your image");
			error_log('error');
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
			error_log($image_type);
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

        return $return;
    }

}

//create class addupload_page
$upload_page = new upload_page();

?>
