<?php

/**
 * Table Definition for an party
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_party extends tablebase {

    public $__table = 'party';
    public $party_id;
    public $name;
    public $country_id;
    public $major;
    public $logo_file;
    public $url_id;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_party',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'party_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'country_id'  => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'major'  => DB_DATAOBJECT_BOOL,
            'logo_file' => DB_DATAOBJECT_STR,
            'url_id' => DB_DATAOBJECT_STR,            
        );
    }

	/* Links */
	public function links (){
	    return array(
			"country_id" => "country:country_id"
			);	    
	}

	/* Keys */
    function keys() {
        return array('party_id');
    }

    //overrride insert to create a url id
    public function insert (){

		$this->url_id = $this->generate_url_id($this->name);

		$saved = parent::insert();

		//if url_id ended up fase, then set it to the ID
		if($this->url_id == false){
			$this->url_id = $this->id;
			$this->update();
		}
		
		return $saved;
	}
	
}