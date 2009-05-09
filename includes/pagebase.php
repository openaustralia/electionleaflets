<?php
require_once ("init.php");
require_once ("smarty/Smarty.class.php");
require_once ("application.php");

abstract class pagebase {

 	//properties
	protected $application = null;
	protected $warnings;
	protected $messages;	
	protected $onloadscript = "";
	protected $set_focus_control ="";
    protected $smarty;
    protected $page_title = "";
    protected $menu_item = "";
    protected $show_tracker = false;
    protected $tracker_location = 0;
    protected $viewstate = array();
    protected $command = "";    
    protected $argument = "";
    protected $warn_controls =  array();
    protected $post_inputs = array();
    protected $smarty_template ="";
	protected $data = null;
	protected $rss_link = '';
	protected $has_map = false;
	protected $fields_to_controls = array(); // for mapping table fields to html controls

    //Constructor
    public function __construct(){

		//setup the application class
		$this->set_application();

        //setup smarty, with default template
        $this->reset_smarty($this->get_template_name());
        
        //check for postback and grab any commands
        if (isset($_POST["_is_postback"])) {
            $this->unserialize_viewstate();
            $this->get_postback_command();
        }

		 $this->warnings = array();
		 $this->messages = array();		
		
		//load function (a way of child classes running code at the point of class construction)
		$this->load();
		//check for postback vs load
		if (isset($_POST["_is_postback"])) {
			$this->get_data();
			$this->unbind();
		    $this->process();		
		}else{
		    $this->setup();
			$this->bind();
			$this->render();			
		}

		//save the application class
        $this->save_application();

    }

	//set application
	private function set_application(){
		$application = session_read('application');

		if(!isset($application)){

			$application = factory::create('application');
		}

		$this->application = $application;
	}

	private function save_application(){
		session_write('application', $this->application);
	}

    //Display template (also assigns default properties)
    public function display_template(){

        $this->smarty->assign("site_name", SITE_NAME);                  
        $this->smarty->assign("site_tag_line", SITE_TAG_LINE);                  
        $this->smarty->assign("root_dir", ROOT_DIR);        
        $this->smarty->assign("www_server", WWW_SERVER);
        $this->smarty->assign("domain", DOMAIN);
		$this->smarty->assign("secure_server", SECURE_SERVER);
        $this->smarty->assign("form_action", htmlspecialchars($_SERVER['PHP_SELF']) . '?' . $_SERVER["QUERY_STRING"]);
        $this->smarty->assign("onloadscript", $this->onloadscript);
		if(sizeof($this->warn_controls) == 0){
        	$this->smarty->assign("set_focus_control", $this->set_focus_control);
		}else{
        	$this->smarty->assign("set_focus_control", $this->warn_controls[0]);		
		}
        $this->smarty->assign("warnings", $this->warnings);
        $this->smarty->assign("messages", $this->messages);
        $this->smarty->assign("data", $this->data);
        $this->smarty->assign("show_warnings", sizeof($this->warnings) >0);
        $this->smarty->assign("show_messages", sizeof($this->messages) >0);
        $this->smarty->assign("warn_controls", $this->warn_controls);        
		$this->smarty->assign("page_title", htmlspecialchars($this->page_title));
		$this->smarty->assign("menu_item", $this->menu_item);		
		$this->smarty->assign("tracker_location", $this->tracker_location);				
		$this->smarty->assign("show_tracker",$this->show_tracker);				
        $this->smarty->assign("viewstate", $this->serialize_viewstate());
		$this->smarty->assign("rss_link", $this->rss_link);
		$this->smarty->assign("current_url", htmlspecialchars($_SERVER['REQUEST_URI']));
		$this->smarty->assign("current_page", htmlspecialchars($_SERVER['PHP_SELF']));		
        $this->smarty->assign("has_map", $this->has_map);	
        $this->smarty->assign("google_maps_key", GOOGLE_MAPS_KEY);
        $this->smarty->assign("map_provider", MAP_PROVIDER);

		foreach($this->warn_controls  as $warn_control) {
			$this->assign('warn_' . $warn_control, true);
		}

       $this->smarty->display($this->smarty_template);
    }

	// assign smarty var
	public function assign($name, $value){
		$this->smarty->assign($name, $value);
	}

    //Reset smarty object and template path
    public function reset_smarty($template_file){

    	$template_folder = null;
        $this->smarty = new Smarty();
        $this->smarty->compile_dir = SMARTY_PATH;
        $this->smarty->compile_check = true;
        $this->smarty->force_compile = DEVSITE === true;

		//work out current dir
		$current_dir = getcwd();
		$split = split("/docs", $current_dir);
		$current_dir = $split[1];
		if (isset($current_dir) && $current_dir != ''){
			$current_dir = $current_dir . "/";
		}

		//template dir
        $this->smarty->template_dir = TEMPLATE_DIR . $current_dir;
		$this->smarty_template = $template_file;
    }
    
    //Get template name - uses reflection to try and guess the template name
    //saves having to assign it in *every* file
    public function get_template_name(){
       return str_replace("_","",str_replace("_page", "", get_class($this))) . ".tpl";
    }

    //serialise and hash data for storing between postbacks
    private function serialize_viewstate(){
        return base64_encode(serialize($this->viewstate));
    }

    private function unserialize_viewstate(){
        if (isset($_POST['_viewstate'])){
            $this->viewstate = unserialize(
            base64_decode($_POST['_viewstate']));
        }
    }

	//user warnings
	public function add_warning($warning){
		array_push($this->warnings, $warning);
	}
	
	public function add_warnings($warnings){
		foreach($warnings as $warning) {
			array_push($this->warnings, $warning);
		}
	}
	
	public function clear_warnings(){
		$this->warnings = array();
	}

	//warn controls
	public function add_warn_control($control_id){
		array_push($this->warn_controls, $control_id);
	}

	public function clear_warn_controls(){
		$this->warn_controls = array();
	}

	//messages
	public function add_message($message){
		array_push($this->messages, $message);
	}
	
	public function add_messages($emssages){
		foreach($messages as $message) {
			array_push($this->messages, $message);
		}
	}
	
	public function clear_messages(){
		$this->messages = array();
	}

	protected function get_data(){

		$this->data = $_POST;
		foreach ($this->data as $key => $value) {
			if($value == ""){
				$this->data[$key] = null;
			}
		}
	}
	
	protected function strip_tags_from_data(){

		foreach ($this->data as $key => $value) {
    		$this->data[$key] = strip_tags($value);
		}

	}

	protected function load(){
	
	}
	
	protected function setup(){
	
	}
	
	protected function bind(){

	}
	
	protected function render(){
		$this->display_template();
	}
	
	protected function unbind(){
	
	}
	
	protected function validate(){
	
	}
	
	protected function process(){
	
	}
    
    private function get_postback_command(){
        if (isset($_POST["_postback_command"])){
            $this->command = $_POST["_postback_command"];
        }
        if (isset($_POST["_postback_argument"])){
            $this->argument = $_POST["_postback_argument"];
        }
    }

	protected function field_to_control_warnings($field_warns){
		foreach($field_warns as $field_warn) {
			if(isset($this->fields_to_controls[$field_warn])){
				$this->add_warn_control($this->fields_to_controls[$field_warn]);
			}
		}
	}

}
    
?>
