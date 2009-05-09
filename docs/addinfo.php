<?php
require_once('init.php');

class addinfo_page extends pagebase {

    private $country_id = 225;
    private $selected_party_attack_ids = array();    
    private $selected_category_ids = array();
    private $lng = null;
    private $lat = null;      

    //setup
    function setup(){
        $image_ids = session_read("image_ids");        
        if(!isset($image_ids) || count($image_ids) == 0){
            redirect("addupload.php");
        }
    }

	//bind
	function bind() {
		$this->page_title = "Add a leaflet (step 2 of 2)";	
		
		//get categories
		$search = factory::create('search');
		$categories = $search->search_cached("category", 
		    array(array(1, '=', 1)),
		    'AND',
		    null,
		    array(array('default_value', "DESC"), array('name', "ASC"))
		);

		//get parties
		$parties = $search->search_cached("party", 
		    array(array('country_id', '=', $this->country_id)),
		    'AND',
		    null,
		    array(array('major', "DESC"), array('name', "ASC"))
		);

		//assign
		$this->assign('categories', $categories);		
		$this->assign('parties', $parties);				
		$this->assign('selected_party_attack_ids', $this->selected_party_attack_ids);	
		$this->assign('selected_category_ids', $this->selected_category_ids);												
	}

	function unbind(){

        //strip out parties attacked
        foreach ($this->data as $key => $value) {
            if(strpos($key, 'chkPartyAttack_') !== false){
                array_push($this->selected_party_attack_ids, $value);
            }
        }
        
        //strip out categories
        foreach ($this->data as $key => $value) {
            if(strpos($key, 'chkCategory_') !== false){
                array_push($this->selected_category_ids, $value);
            }
        }
    }

    function validate(){
		if(!isset($this->data['txtTitle']) || $this->data['txtTitle'] ==''){
			$this->add_warning('Please add a title for this leaflet');
			$this->add_warn_control('txtTitle');
		}		
		if(!isset($this->data['ddlPartyBy']) || $this->data['ddlPartyBy'] ==''){
			$this->add_warning('Please specify the party responsible for this leaflet');
			$this->add_warn_control('ddlPartyBy');
		}
		if(!isset($this->data['txtName']) || $this->data['txtName'] ==''){
			$this->add_warning('Please add your name');
			$this->add_warn_control('txtName');
		}
		if(!isset($this->data['txtEmail']) || $this->data['txtEmail'] =='' || !valid_email($this->data['txtEmail'] )){
			$this->add_warning('Please add a valid email address');
			$this->add_warn_control('txtEmail');
		}
		//TODO: handle non-UK postcodes
		if(!isset($this->data['txtPostcode']) || $this->data['txtPostcode'] ==''){
			$this->add_warning('Please add a post code for this leaflet');
			$this->add_warn_control('txtPostcode');
		} else if(!is_postcode($this->data['txtPostcode'])){
			$this->add_warning('Please enter a valid postcode');
			$this->add_warn_control('txtPostcode');		    
	    }else{
	        $geocoder = factory::create('geocoder');
	        $success = $geocoder->set_from_postcode($this->data['txtPostcode']);
	        if(!$success){
    			$this->add_warning('Sorry, we couldn\'t locate that postcode');
    			$this->add_warn_control('txtPostcode');	            
            }else{
                $this->lng = $geocoder->lng;
                $this->lat = $geocoder->lat;
            }
        }
        return count($this->warnings) == 0;
    }

    function process(){
        
        if($this->validate()){

            //create & save leaflet
            $leaflet = factory::create('leaflet');
            $leaflet->title = $this->data['txtTitle'];
            $leaflet->description = $this->data['txtDescription'];            
            $leaflet->publisher_party_id = $this->data['ddlPartyBy'];                        
            $leaflet->postcode = $this->data['txtPostcode'];
            $leaflet->lng = $this->lng;            
            $leaflet->lat = $this->lat;
            $leaflet->name = $this->data['txtName'];
            $leaflet->email = $this->data['txtEmail'];
            
            //date delivered
            $days = $this->data['ddlDelivered'];
            if((int)$days > 30){
                $days = 30;
            }
            
            $date = mktime(0, 0, 0, date("m")  , date("d") - $days, date("Y"));
            $leaflet->date_delivered = mysql_date($date);
            

            if($leaflet->insert()){

                //save images
                $image_ids = session_read("image_ids");
 
                $sequence = 1;
                foreach ($image_ids as $image_id) {
                    $leaflet_image = factory::create("leaflet_image");
                    $leaflet_image->leaflet_id = $leaflet->leaflet_id;
                    $leaflet_image->image_key = $image_id;
                    $leaflet_image->sequence = $sequence;
                    if(!$leaflet_image->insert()){
                        trigger_error("Unable to save leaflet image");                    
                    }
                    
                    $sequence ++;
                }
                
                //TODO: move the code below into the leaflet object
                
                //save party attack
                foreach ($this->selected_party_attack_ids as $selected_party_attack_id) {
                    $leaflet_party_attack = factory::create("leaflet_party_attack");
                    $leaflet_party_attack->leaflet_id = $leaflet->leaflet_id;
                    $leaflet_party_attack->party_id = $selected_party_attack_id;
                    if(!$leaflet_party_attack->insert()){
                        trigger_error("Unable to save leaflet party attack");                    
                    }
                }

                //save categories
                foreach ($this->selected_category_ids as $selected_category_id) {
                    $leaflet_category = factory::create("leaflet_category");
                    $leaflet_category->leaflet_id = $leaflet->leaflet_id;
                    $leaflet_category->category_id = $selected_category_id;
                    if(!$leaflet_category->insert()){
                        trigger_error("Unable to save leaflet category");                    
                    }
                }

                //save tags
                $tags = split(",", $this->data['txtTags']);
                
                if(count($tags) > 0){

                    //get any matching tags
                    $where_clause = array();
                    foreach ($tags as $tag) {
                        array_push($where_clause, array("tag", "=", $tag));
                    }
                    $search = factory::create('search');
                    $existing_tags = $search->search("tag", $where_clause);

                    //insert new tags as required
                    foreach ($tags as $tag) {
                        $tag_id = null;
                        $tag = str_replace(" ", "", trim($tag))
                        
                        if(isset($tag) && $tag != ''){
                            //exists?
                            foreach ($existing_tags as $existing_tag) {
                                if($tag == $existing_tag->tag){
                                    $tag_id = $existing_tag->tag_id;
                                }
                            }
                        
                            if(!isset($tag_id)){
                                $new_tag = factory::create('tag');
                                $new_tag->tag = $tag;

                                if(!$new_tag->insert()){
                                    trigger_error("Unable to save new tag");                    
                                }
                                $tag_id = $new_tag->tag_id;
                            }
                        
                            $leaflet_tag = factory::create('leaflet_tag');
                            $leaflet_tag->leaflet_id = $leaflet->leaflet_id;
                            $leaflet_tag->tag_id = $tag_id;
                            if(!$leaflet_tag->insert()){
                                trigger_error("Unable to save leaflet/tag bridge");                    
                            }
                        }
                    }
                    
                }

            }else{
                trigger_error("Unable to save leaflet");
            }

            //clear session, enable leaflet and then redirect
            session_delete('image_ids');
            redirect("leaflet.php?q=" . $leaflet->leaflet_id . "&m=1");

        }else{
            $this->bind();
            $this->render();            
        }
    }

}

//create class addupload_page
$addinfo_page = new addinfo_page();

?>
