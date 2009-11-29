<?php

require_once('init.php');

class geocoder{

	//properties
	public $lng = null;
	public $lat = null;	

	//set from postcode / zip code
	function set_from_postcode($zip, $country = 'UK'){

		//reset
		$this->reset();
		$success = false;

		$latlong = null;							
		$country = strtolower($country);
		if($country = 'uk'){			
			$lnglat = $this->get_uk_postcode($zip);
		}else{
			//for outside UK, use google maps
			$lnglat = $this->call_google_geocoder(array($zip, $country));
	 		$lnglat = process_google_geocoder($data);
		}

		//set lat / long
		if(isset($lnglat) && $lnglat[0] != 0 && $lnglat[1] != 0){
			$success = true;
			$this->lng = $lnglat[0];
			$this->lat = $lnglat[1];			
		}

		return $success;
	}

	function set_from_lnglat($lnglat_csv){
		$split = split(",", $lnglat_csv);
		$sucess = false;
		if(sizeof($split) == 2){
			$this->lng = $split[0];
			$this->lat = $split[1];
			$sucess = true;	
		}

		return $success;
	}
	
	//tries to set lat long by geocoding an address or place name
	function set_from_address($address){

		$return = false;
					
		//reset lat long
		$this->reset();
		
		//split the address into an array
		$split = split(",", $address);
	
		//if more than 3 lines and one of them is a partial postcode, remove the postcode (it confuses the geocoder)
		if(sizeof($split) >2){
			for ($i=0; $i < sizeof($split); $i++) { 
				if(is_partial_postcode(trim($split[$i]))){
					$split[$i] = '';
				}
			}
		}

		//is there a UK postcode in this address?
		$postcode = false;
		for ($i=0; $i < sizeof($split); $i++) { 
			if(is_postcode(trim($split[$i]))){
				$postcode = trim($split[$i]);
			}
		}
		
		
		//get the lat/long
		$latlong = null;
		if($postcode){
			$latlong = $this->get_uk_postcode($postcode);	
			if(isset($latlong) && $latlong[0] != 0 && $latlong[1] != 0){
    			$success = true;			
    			$this->lng = $latlong[0];						
    			$this->lat = $latlong[1];
    		}
		}else{
			$latlong = $this->call_google_geocoder($split);
			if(isset($latlong) && $latlong[0] != 0 && $latlong[1] != 0){
    			$success = true;			
    			$this->lng = $latlong[1];						
    			$this->lat = $latlong[0];
    		}
		}
	
		return $success;
	}

	//make google call
	private static function call_google_geocoder($query_parts){
		$return = false;

		//encode the query
		$query = "";
		for ($i=0; $i < sizeof($query_parts); $i++) { 
			if($i > 0){
				$query .= ",+";
			}
			$query .= urlencode($query_parts[$i]);
		}

		$url = "http://maps.google.com/maps/geo?key={key}&output=csv&q={query}";
		$url = str_replace('{key}', GOOGLE_MAPS_KEY, $url);
		$url = str_replace('{query}', $query, $url);
		
		$data = safe_scrape_cached($url, CACHE_TIME_LONG);
		$data = explode(',', $data);
		
		if(($data[0] + 0)  != 602){
			$return[0] = $data[2] + 0;
			$return[1] = $data[3] + 0;			
		}
		return $return;
	}

    //UK postcode (scrapes google maps)
    private function get_uk_postcode($postcode){
            $return = false;
            $html = safe_scrape_cached("http://maps.google.com/maps?f=q&hl=en&geocode=&q=" . urlencode($postcode), CACHE_TIME_LONG);

            if($html){
                    //$regex = '/geocode:\"(.*?),(.*?),(.*?)\"/';
                    $regex = '/viewport:{center:{lat:(.*?),lng:(.*?)}/';
                    
                    preg_match_all($regex, $html, $matches, PREG_PATTERN_ORDER);

                    if(isset($matches[2][0]) && isset($matches[1][0])){
                            $return = array($matches[2][0], $matches[1][0]);
                    }
            }

            return $return;
    
    }
	
	public static function extract_postcode($text){

		$postcode = null;

		if (preg_match("/[A-Z][A-Z]?[0-9][A-Z0-9]? ?[0-9][ABDEFGHJLNPQRSTUWXYZ]{2}/i", $text, $match)){
			$postcode = $match[0];
		}

		return $postcode;
	}
	
	//get location type - postcode, zip, place etc
	public static function get_location_type($search_term){
	
		$search_type = "placename";
		
		//check if is postcode
		if(is_postcode($search_term)){
			$search_type = "postcode";
		}
		
		//check if partial postcode
		if(is_partial_postcode($search_term)){
			$search_type = "partialpostcode";
		}
		
		//check if is zipcode
		if(is_zipcode($search_term)){
			$search_type = "zipcode";
		}
		
		//check if long lat
		if(is_longlat($search_term)){
			$search_type = "longlat";
		}

		return $search_type;
	
	}


    //reset
	private function reset(){
		$this->lat = null;
		$this->lng = null;
	}
		
}

//support classes
class location {
	public $lng = null;
	public $lat = null;
	public $street = null;
	public $address = null;
	public $area = null;
	public $postal_code = null;
	public $country_code = null;
}
?>