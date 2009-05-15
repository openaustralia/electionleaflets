<?php

/**
 * Table Definition for an leaflet image
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_leaflet_image extends tablebase {

    public $__table = 'leaflet_image';
    public $leaflet_image_id;
    public $leaflet_id;
    public $image_key;
    public $sequence;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet_image',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'leaflet_image_id'   => DB_DATAOBJECT_INT,
            'leaflet_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'image_key'           => DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'sequence'           => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){
	    return array(
			"leaflet_id" => "leaflet:leaflet_id"
			);
	}

	function rotate($degrees){
	    $return = true;
	    $sizes = array("thumbnail", "medium", "large", "original");
	    foreach ($sizes as $size) {
	        $file_name = IMAGES_DIR . "/" . $size . "/" . $this->image_key . ".jpg";	        
	        if (file_exists($file_name)){
                $image = imagecreatefromjpeg($file_name);
                $image = imagerotate($image, $degrees, 0);
                imagejpeg($image, $file_name, 100);
                imagedestroy($image);                
            }else{
                $return = false;
            }
	    }
	    return $return;
    }

	/* Keys */
    function keys() {
        return array('leaflet_image_id');
    }

    public function thumbnail_url(){
        return WWW_SERVER . "/image.php?s=t&i=" . $this->image_key;
    }
    
    public function medium_url(){
        return WWW_SERVER . "/image.php?s=m&i=" . $this->image_key;
    }

    public function large_url(){
        return WWW_SERVER . "/image.php?s=l&i=" . $this->image_key;
    }
        
    public function original_url(){
        return WWW_SERVER . "/image.php?s=o&i=" . $this->image_key;
    }

}