<?php

/**
 * Table Definition for an constituency
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_email_alert extends tablebase {

    public $__table = 'email_alert';
    public $email_alert_id;
    public $email;
    public $frequency_hours;    
    public $last_sent;
    public $type;
    public $parent_id;
    public $activated;
    public $confirm_id;
    public $title;
    public $warning_messages = array(
            "email" => "Please enter an email address",
            "frequency_hours" => "Please choose how ofter you would like to receive alerts"            
        );
        

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_email_alert',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'email_alert_id'   	=> DB_DATAOBJECT_INT,
            'email'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'frequency_hours'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,            
            'last_sent'   			=> DB_DATAOBJECT_STR,            
            'type'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,                        
            'parent_id'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'activated'   			=> DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'confirm_id'   			=> DB_DATAOBJECT_STR,
            'title'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,                                                      
        );
    }

	/* Keys */
    function keys() {
        return array('email_alert_id');
    }

    function validate(){
     	if($this->email != '' && !valid_email($this->email)){
			$this->add_warning('Please enter a valid email address');
			$this->add_warn_field('email');
		}
		
		return parent::validate();
    }

    public function insert (){

        //create an ID for subscribing and unsubscribing
		$this->confirm_id = md5(uniqid());
		
		//set the last sent to now
		$this->last_sent = mysql_date(time());
		
		return parent::insert();

	}
	
}