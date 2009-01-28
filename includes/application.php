<?php

require_once ("init.php");

class application {

	private $user_id = null;
	private $has_entered_password = false;
	
	public function __construct(){

		//login if we've got a cookie
		$this->handle_login_cookie();
		
		//work out where to send people
		if($_SERVER['REQUEST_URI'] == "/" || $_SERVER['REQUEST_URI'] == ""){
			if($this->is_signed_in()){		
				$last_viewed_user_place = $this->get_user()->get_last_viewed_user_place();							
				if($last_viewed_user_place){
					$this->save();
					redirect(WWW_SERVER . "/spots.php?b=" . urlencode($last_viewed_user_place->url_id));
				}
			}
		}

	}

	//signin user
	public function sign_in_user($signin, $password, $remember){
		
		$success = false;
		
		//work out if they are loggin in via email of username
		$signin_type = "username";
		if(valid_email($signin)){
			$signin_type = "email";
		}

		//crypt the password
		$encrypted_password = crypt($password, USER_SALT);

		//find the user
		$search = factory::create('search');		
		$result = $search->search('user', array(array($signin_type, '=', $signin), array('confirmed', '=', true), array('password', "=", $encrypted_password)));		

		if(sizeof($result) == 1){
			$this->set_user($result[0]);
			$success = true;			
			$this->has_entered_password = true; //(as opposed to getting in via a cookie)

			//set the cookie
			if($remember){
				$result[0]->set_login_cookie();
			}else{
				$result[0]->clear_login_cookie();
			}
		}

		return $success;		
	}

	//sign out
	public function sign_out(){
		$this->get_user()->clear_login_cookie();
		$this->user_id = null;
		$this->has_entered_password = false;
	}

	//check password
	public function check_password($password){
		$success = $this->get_user()->check_password($password);
		if($success){
			$this->has_entered_password = true;
		}
		
		return $success;
	}

	//set user
	public function set_user($user, $has_entered_password = false){
		//set the user object
		$this->user_id = $user->user_id;	
		if($has_entered_password){
			$this->has_entered_password = true;
		}
	}

	public function get_user(){
		$search = factory::create('search');		
		$result = $search->search('user', array(array('user_id', '=', $this->user_id), array('confirmed', '=', true)));
		if(sizeof($result) == 1){
			return $result[0];
		}else{
			return 	null;
		}
	}

	
	public function get_user_id(){
		return $this->user_id;
	}
	
	//signout user
	public function clear_user(){
		$this->user_id = null;
	}
	
	// is a user signed in?
	public function is_signed_in(){
		return isset($this->user_id);
	}
	
	//has enetred password this session?
	public function has_entered_password(){
		return $this->has_entered_password;
	}

	//handle cookie
	private function handle_login_cookie(){
		//got a cookie? (works as per http://jaspan.com/improved_persistent_login_cookie_best_practice)
		if(!$this->is_signed_in()){
			
			//get cookie
			$login_cookie = $_COOKIE[LOGIN_COOKIE_NAME];
			$split = explode("|", $login_cookie);

			//setup search
			$search = factory::create('search');
			
			//if cookie looks ok ...	
			if(count($split) == 3){

				//get user logins for this seris / user_id
				$user_logins = $search->search('user_login', 
						array(array('user.username', "=", $split[0]), array("seris", "=", $split[1]), array("user.confirmed", "=", true), array("user.live", "=", true)),
						"AND",
						array(array('user', 'inner'))
					);

				//if guid + seris matches then log them in. If just seris matches, someone has been trying to hack so wipe all sessions
				if(count($user_logins) == 1 && $user_logins[0]->guid == $split[2]){					
					$this->user_id = $user_logins[0]->user_id;
					$this->get_user()->set_login_cookie($split[1]);
				}else if(count($user_logins) == 1 && $user_logins[0]->guid != $split[2]){
					$users = $search->search('user', array(array('user.username', "=", $split[0])));
					$users[0]->clear_login_cookie();
					trigger_error("someone messing about with cookies for user: " . $user_logins[0]->user_username, E_USER_WARNING);
				}else if(count($user_logins) > 1){
					trigger_error("More than one user login present for a user");	
				}
				
			}
			
		}		
	}
	
	public function save(){
		session_write('application', $this);	
	}
	
}

?>