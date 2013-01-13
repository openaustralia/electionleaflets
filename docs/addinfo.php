<?php
require_once('init.php');

class addinfo_page extends pagebase {

    private $country_id = COUNTRY;
    private $selected_party_attack_ids = array();    
    private $selected_category_ids = array();
    private $lng = null;
    private $lat = null;
    private $constituency_id = null;
    private $image_que_items = array();
    private $upload_key = null;

    //load
    function load(){
        $upload_key = get_http_var("key");
        if(!isset($upload_key) || $upload_key == ''){
            redirect("addupload.php");
        }else{
            $this->upload_key = $upload_key;
            $this->image_que_items = $this->get_images_from_que();   
            if(count($this->image_que_items) <= 0){
                redirect("addupload.php");                
            }
        }        
    }

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
    }

	//bind
	function bind() {
                $election_id = get_election_id();

		$this->page_title = "Add a leaflet (step 2 of 2)";	
		
		//get categories
		$search = factory::create('search');
		$categories = $search->search_cached("category", 
		    array(array("category_election.election_id", "=", $election_id)),
		    'AND',
		    array(array("category_election", "inner")),
		    array(array('name', "ASC"))
		);

		//get parties
		$parties = $search->search("party", 
		    array(array('country_id', '=', $this->country_id), 
		          array("party_election.election_id", "=", $election_id)),
		    'AND',
		    array(array("party_election", "inner")),
		    array(array('major', "DESC"), array('name', "ASC"))
		);

    //elections
    $search = factory::create('search');
    $elections = $search->search_cached("election",
        array(array("1", "=", "1")),
        "AND", null,
        array(array("name", "ASC"))
    );

        //constituencies
        $search = factory::create('search');         
        $constituencies = $search->search_cached("constituency", 
            array(array("constituency_election.election_id", "=", $election_id)),
            "AND",
            array(array("constituency_election", "inner")),
            array(array("name", "ASC"))
        );

	$australian_postcode = factory::create('australian_postcode');
	$constituencies_hints = $australian_postcode->lookup_constituency_names(trim($this->data['txtPostcode']));

    //assign
    $this->assign('categories', $categories);
    $this->assign('parties', $parties);
    $this->assign('selected_party_attack_ids', $this->selected_party_attack_ids);
    $this->assign('selected_category_ids', $this->selected_category_ids);
    $this->assign('image_que_items', $this->image_que_items);
    $this->assign("constituencies", $constituencies);
    $this->assign("constituencies_hints", $constituencies_hints);
    $this->assign("elections", $elections);
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
		$this->election_id = get_election_id(); 
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
	        $postcode = trim($this->data['txtPostcode']);
	        $success = $geocoder->set_from_postcode($postcode, COUNTRY_CODE_TLD);
	        if(!$success){
    			$this->add_warning('Sorry, we couldn\'t locate that postcode');
    			$this->add_warn_control('txtPostcode');	            
            }else{
                $this->lng = $geocoder->lng;
                $this->lat = $geocoder->lat;
            }

            if (strlen(trim($this->data['ddlConstituencyHint'])) > 0) {
                $this->data['ddlConstituency'] = $this->data['ddlConstituencyHint'];
            }
            
            //Convert postcode to electorate
            $australian_postcode = factory::create('australian_postcode');
            $names = $australian_postcode->lookup_constituency_names($postcode);
            if (isset($this->data['ddlConstituency'])) {
                if (in_array($this->data['ddlConstituency'], $names))
                    $name = $this->data['ddlConstituency'];
                else {
                    $this->add_warning("The postcode and electorate don't match up. Are you sure you got them both correct?");
                    $this->add_warn_control('txtPostcode');
                    $this->add_warn_control('ddlConstituency');
                }
            }
            else {
                if (count($names) == 0) {
                    $this->add_warning("The postcode is in not in a valid electorate.");
                    $this->add_warn_control('ddlConstituency');
                } else if (count($names) == 1) {
                    $name = $names[0];
                } else {
                    $this->add_warning("The postcode is in more than one electorate. Please an electorate below.");
                    $this->add_warn_control('ddlConstituency');
                }
            }
            if ($name) {
                $search = factory::create('search');
                $result = $search->search("constituency", 
                    array(array("name", "=", $name), array("constituency_election.election_id", "=", $this->election_id = get_election_id())), 
                    "AND",
                    array(array("constituency_election", "inner")));
                if(count($result) == 1){
                    $this->constituency_id = $result[0]->constituency_id;
                }
            }
        }

        return count($this->warnings) == 0;
    }

    function process(){
        
        if($this->validate()){

            //create & save leaflet
            $leaflet = factory::create('leaflet');
            $leaflet->title = trim($this->data['txtTitle']);
            $leaflet->description = $this->data['txtDescription'];            
            $leaflet->publisher_party_id = $this->data['ddlPartyBy'];                        
            $leaflet->postcode = trim($this->data['txtPostcode']);
            $leaflet->lng = $this->lng;            
            $leaflet->lat = $this->lat;
            $leaflet->name = trim($this->data['txtName']);
            $leaflet->email = trim($this->data['txtEmail']);
            $leaflet->live = 1;

            //date delivered
            $days = (int)$this->data['ddlDelivered'];
            if($days > 90){
                $days = 90;
            }
            
            $date = mktime(0, 0, 0, date("m")  , date("d") - $days, date("Y"));
            $leaflet->date_delivered = mysql_date($date);

            if($leaflet->insert()){
                //save images
                $images = $this->get_images_from_que();

                $sequence = 1;
                foreach ($images as $image) {
                    $leaflet_image = factory::create("leaflet_image");
                    $leaflet_image->leaflet_id = $leaflet->leaflet_id;
                    $leaflet_image->image_key = $image->image_key;
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
                $tag_string = trim($this->data['txtTags']);
                // match, all, these, and these, "and these"
		$tag_string = preg_replace("/[^a-z0-9, ]/i", '', $tag_string); // drop extended chars
		preg_match_all("/[\w ]+/i",$tag_string,$found_tags); // search for tags
		$tags=array_map('trim',$found_tags[0]); // trim found tags
		$tags=array_unique($tags); // remove dupes
                if($tag_string != '' && isset($tag_string) && count($tags) > 0){
                    foreach ($tags as $tag) {
                        $new_tag = factory::create('tag');
                        $new_tag->tag = trim($tag);

                        if(!$new_tag->insert()){
                            trigger_error("Unable to save new tag");                    
                        }
                         
                        $leaflet_tag = factory::create('leaflet_tag');
                        $leaflet_tag->leaflet_id = $leaflet->leaflet_id;
                        $leaflet_tag->tag_id = $new_tag->tag_id;
                        if(!$leaflet_tag->insert()){
                            trigger_error("Unable to save leaflet/tag bridge");                    
                        }
                    }
                }
                
                // Now save the constituency
                $leaflet_constituency = factory::create('leaflet_constituency');
                $leaflet_constituency->leaflet_id = $leaflet->leaflet_id;
                $leaflet_constituency->constituency_id = $this->constituency_id;
                if(!$leaflet_constituency->insert()){
                    trigger_error("Unable to save constituency information");                    
                }

                // Now save the election it's for
                $leaflet_election = factory::create('leaflet_election');
                $leaflet_election->leaflet_id = $leaflet->leaflet_id;
                $leaflet_election->election_id = $this->election_id;
                if(!$leaflet_election->insert()){
                    trigger_error("Unable to save election information");
                }
                    
            }else{
                trigger_error("Unable to save leaflet");
            }

            //clear session
            session_delete('image_ids');
            
            //clear the image que for this upload
            $this->clear_images_from_que();

            //redirect with callback provided
            if($this->viewstate['callback']){
                redirect($this->viewstate['callback'] . "?v1=" . WWW_SERVER . "/leaflets/" . $leaflet->leaflet_id . "/");
            }else{
                redirect("leaflets/" . $leaflet->leaflet_id . "?m=1");                
            }

        }else{
            $this->bind();
            $this->render();            
        }
    }

    private function clear_images_from_que(){
        $image_que = factory::create('image_que');
        $image_que->upload_key = $this->upload_key;
        $image_que->delete();
    }

    private function get_images_from_que(){

        $search = factory::create('search');
        $image_que_items = $search->search("image_que", 
                array(array("upload_key", "=", $this->upload_key)),
                "AND",
                null,
                array(array("uploaded_date", "ASC"))
            );
        return $image_que_items;
    }

}

//create class addupload_page
$addinfo_page = new addinfo_page();

?>
