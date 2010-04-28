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

	function unbind(){
	    //get image
        $upload_key = $this->viewstate['upload_key'];    
        $images = array();
        $image_que = factory::create('image_que');
        if(isset($_FILES['Filedata']) && $_FILES['Filedata']['name'] != '' && isset($upload_key) &&  $upload_key != ''){
               $temp_files = $this->upload_image('Filedata');
               if($temp_files !== false){
                    foreach ($temp_files as $filename) {
                        $image_que->upload_key =  $upload_key;
                        $image_que->save_image($filename);
                        $image_que->insert();
                        array_push($images, s3_url('s',$image_que->image_key));
                    }
               }
           }
           
        header("Content-type: application/json; charset=utf-8");
        if ($this->validate()){
                print json_encode(array(
                                "success" 	=> true,
                                "images"        => $images
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

    }

    private function upload_image($upload_control){
        $return = false;
        $file = $_FILES[$upload_control]['tmp_name'];
        $image = new Imagick($file);
        $identity = $image->identifyImage(TRUE);
        $random_name = md5(uniqid(rand(), true));
        $temp_file_name = TEMP_DIR . '/' .$random_name.'.jpg';
        $image->writeImages($temp_file_name,false);
        return glob(TEMP_DIR . '/' .$random_name.'*.jpg');
    }
}

//create class addupload_page
$upload_page = new upload_page();

?>
