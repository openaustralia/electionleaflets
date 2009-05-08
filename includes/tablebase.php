<?php
/**
 * Wrapper class for Pear data objects
 */
require_once('init.php');
require_once ('DB/DataObject.php');

abstract class tablebase extends DB_DataObject {

	//properties
	protected $warnings;
	protected $warning_codes;
	protected $warn_fields;
	protected $warning_messages = array();

    public function __construct(){

		$this->warnings = array();
		$this->warn_fields = array();		
		$this->warning_codes = array();

		//add default selects (so we can handle geo data types)
		$this->selectAdd();	
	}

	public function selectAdd($k = null){
        if(!isset($k)){
    	    parent::selectAdd();
    		$fields = $this->table();
    		foreach ($fields as $field => $data_type) {
    			if(($data_type & DB_DATAOBJECT_POINT) || ($data_type & DB_DATAOBJECT_LINE_STRING)){
    				parent::selectAdd("AsText(" . $field . ") as " . $field);
    			}else{
    				parent::selectAdd($this->tableName() . "." . $field) . "as " .$field;
    			}
    		}
        }else{
            parent::selectAdd($k);
        }
    }

	public function add_warning($warning, $code = null){
		array_push($this->warnings, $warning);
		if(isset($code)){
			array_push($this->warning_codes, $code);			
		}
	}

	public function clear_warnings(){
		$this->warnings = array();
		$this->warning_codes = array();		
	}
	
	public function get_warnings(){
		return $this->warnings;
	}
	
	public function get_warning_codes(){
		return $this->warning_codes;
	}
	
	public function add_warn_field($name){
		array_push($this->warn_fields, $name);
	}

	public function clear_warn_fields(){
		$this->warn_fields = array();
	}

	public function get_warn_fields(){
		return $this->warn_fields;
	}

	public function search_warnings($search_term){
		$success = false;
		foreach ($this->warnings as $warning) {
			if(strpos($warning, $search_term)){
				$success = true;
			}
		}
		return $success;
	}
	
	public function search_warning_codes($search_term){
		$success = false;
		foreach ($this->warning_codes as $warning_code) {
			if(strpos($warning_code, $search_term) > -1){
				$success = true;
			}
		}
		return $success;
	}
	
	//generate a unique url from any given field
	public function generate_url_id($generate_from, $contraint_field = null, $contraint_value = null, $field = 'url_id'){
	
		$return = false;
	
		//set the default (remove spaces and dodgy chars)
		$url_id = format_string_for_url($generate_from);

		//check if its been taken
		$url_id_taken = true;
		$loop_count = 0; //we only want to loop 15 times. more than than its gone pear shaped
		while($url_id_taken == true && $loop_count <=15) {

            //generate url id
			$test_url_id = $url_id . ($loop_count ? "_$loop_count" : '');
			
    		//build up where clause
    		$where_clause = array(array($field, '=', $test_url_id));
    		if(isset($contraint_field) && isset($contraint_value)){
    			array_push($where_clause, array($contraint_field, '=', $constraint_value));
    		}

            //search for dupes
			$search = factory::create('search');
			$search_result = $search->search($this->tableName(), $where_clause);
			if(count($search_result) == 0){
				$url_id_taken = false;
			}
			
			$loop_count ++;

		}

		if($url_id_taken == true){
			trigger_error("Unable to create a unique url id for group: " . $this->name);
		}else{
			$return = $test_url_id;
		}

		return $return;
		
	}

	//validate
	public function validate(){
		$field_errors = parent::validate();
		if($field_errors !== true){
			foreach ($field_errors as $field_error => $valid) {
				if($valid == false){
					$this->add_warn_field($field_error);
					//add default waning
					if(isset($this->warning_messages[$field_error])){
						$this->add_warning($this->warning_messages[$field_error]);
					}
				}
			}
		}
		
	 	return $field_errors === true;
	}

	public function execute($sql){
	    $this->query($sql);
        $return = array();
    	while ($this->fetch()) {
          array_push($return, clone($this));
        }
        return $return;
    }


	public function execute_cached($sql){
	    $return = null;
	    $cache = cache::factory();
		$cached = $cache->get($key, "execute");
		
		//if we have something in the cache, grab that, if not do the query as normal
		if (isset($cached) && $cached !== false) {
			$return = $cached;
		}else{
	        $return = $this->execute($sql);
		    $cached = $cache->set($key, $return, "execute");		    
		}
		
		return $return;
    }
}

?>