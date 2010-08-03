<?php

    require_once('cache.php');
	require_once ("smarty/Smarty.class.php");

    //Send a text email
    function send_text_email($to, $from_name, $from_email, $subject, $body){

    	$headers  = 'MIME-Version: 1.0' . "\r\n";
		$headers .= 'Content-type: text/plain; charset=iso-8859-1' . "\r\n";
		$headers .= 'From: ' . $from_name. ' <' . $from_email . ">\r\n";

		$success = mail($to, $subject, $body, $headers);
		if(!$success){
		    trigger_error("Failed to send email");
	    }

    }

	//Valid email address?
    function valid_email ($string) {
        $valid = false;
    	if (!ereg('^[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+'.
    		'@'.
    		'[-!#$%&\'*+\\/0-9=?A-Z^_`a-z{|}~]+\.'.
    		'[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+$', $string)) {
    		$valid = false;
    	} else {
    		$valid =  true;
    	}
    	
    	return $valid;
    }

	//Valid URL?
	function valid_url($url) {
		$return = false;
		if(preg_match("/^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?/i", $url)){
			$return = true;
		}
		return $return;
	}

	function make_guid(){
		return md5(uniqid(rand(), true));
	}

	// Regexes from ms_make_clickable mostly, adjusted
	function raw_urls_to_links($text){
		$text = " $text ";
		$text = preg_replace('#(https?://[^\s<>{}()]+[^\s.,<>{}()])#i', '<a href="$1" rel="nofollow">$1</a>', $text);
		$text = preg_replace('#(\s)([a-z0-9\-]+(?:\.[a-z0-9\-\~]+){2,}(?:/[^ <>{}()\n\r]*[^., <>{}()\n\r])?)#i', 
			'$1<a href="http://$2" rel="nofollow">$2</a>', $text);

		$text = trim($text);
		return $text;
	}
	
	function new_lines_to_paragraphs($text){
	
		$return = "";
		$lines = explode("\n", $text);
		foreach($lines as $line) {
			if(trim($line) !=''){
				$return .= "<p>" . trim($line) . "</p>";
			}
		}
	
		return $return;
	}

  function is_postcode ($postcode) {
    if (COUNTRY_ISO == "GB")
      return is_uk_postcode($postcode);
    else if (COUNTRY_ISO == "AU")
      return is_australian_postcode($postcode);
    else
      throw new Exception('Postcode support is not present for your current country');
  }
  
	//is a UK postcode?
	function is_uk_postcode ($postcode) {
		// See http://www.govtalk.gov.uk/gdsc/html/noframes/PostCode-2-1-Release.htm

		$in  = 'ABDEFGHJLNPQRSTUWXYZ';
		$fst = 'ABCDEFGHIJKLMNOPRSTUWYZ';
		$sec = 'ABCDEFGHJKLMNOPQRSTUVWXY';
		$thd = 'ABCDEFGHJKSTUW';
		$fth = 'ABEHMNPRVWXY';
		$num = '0123456789';
		$nom = '0123456789';
		$gap = '\s\.';	

		if (	preg_match("/^[$fst][$num][$gap]*[$nom][$in][$in]$/i", $postcode) ||
				preg_match("/^[$fst][$num][$num][$gap]*[$nom][$in][$in]$/i", $postcode) ||
				preg_match("/^[$fst][$sec][$num][$gap]*[$nom][$in][$in]$/i", $postcode) ||
				preg_match("/^[$fst][$sec][$num][$num][$gap]*[$nom][$in][$in]$/i", $postcode) ||
				preg_match("/^[$fst][$num][$thd][$gap]*[$nom][$in][$in]$/i", $postcode) ||
				preg_match("/^[$fst][$sec][$num][$fth][$gap]*[$nom][$in][$in]$/i", $postcode)
			) {
			return true;
		} else {
			return false;
		}
	}
	
	function is_australian_postcode($postcode) {
	  return (preg_match("/^\d{4}$/", $postcode));
  }

	//is a postcode?
	function is_partial_postcode ($postcode) {
		// See http://www.govtalk.gov.uk/gdsc/html/noframes/PostCode-2-1-Release.htm
		$fst = 'ABCDEFGHIJKLMNOPRSTUWYZ';
		$sec = 'ABCDEFGHJKLMNOPQRSTUVWXY';
		$thd = 'ABCDEFGHJKSTUW';
		$fth = 'ABEHMNPRVWXY';
		$num = '0123456789';

		if (	preg_match("/^[$fst][$num]$/i", $postcode) ||
				preg_match("/^[$fst][$num][$num]$/i", $postcode) ||
				preg_match("/^[$fst][$sec][$num]$/i", $postcode) ||
				preg_match("/^[$fst][$sec][$num][$num]$/i", $postcode) ||
				preg_match("/^[$fst][$num][$thd]$/i", $postcode) ||
				preg_match("/^[$fst][$sec][$num][$fth]$/i", $postcode)
			) {
			return true;
		} else {
			return false;
		}
	}

	function pad_partial_postcode($partial_postcode){

		$partial_postcode = strtolower($partial_postcode);
		if($partial_postcode == "sw1" || $partial_postcode == "ec1"){
			$return = $partial_postcode . "a 1aa";
		}elseif($partial_postcode == "sw9"){
			$return = $partial_postcode . "8jx";		
		}else{
			$return = $partial_postcode . " 1aa";
		}
				
		return $return;
		
	}

	//iszip code
	function is_zipcode ($zipcode) {

		if (preg_match("/[0-9]{5}/", $zipcode)) {
			return true;	
		} else {
			return false;
		}
	}
	
	//Does a stig look like a long/lat value
	function is_longlat ($longlat) {

		$return = true;
		$split = explode(",", $longlat);
		if(sizeof($split) != 2){
			$return = false;
		}else{
			if (!is_numeric(str_replace("-", "", $split[0]))){
				$return = false;
			}
			if (!is_numeric(str_replace("-", "", $split[1]))){
				$return = false;
			}
		}
		
		return $return;

	}

	//clean postcode (adds space and makes uppcase)
	function clean_postcode ($postcode) {

		$postcode = str_replace(' ','',$postcode);
		$postcode = strtoupper($postcode);
		$postcode = trim($postcode);
		$postcode = preg_replace('/(\d[A-Z]{2})/', ' $1', $postcode);
	
		return $postcode;

	}

	//clean postcode (adds space and makes uppcase)
	function postcode_to_district ($postcode) {

		$reg = array();
		$postcode = trim($postcode);
		preg_match('/^(.+?)([0-9][a-z]{2})$/',$postcode, $reg);
	
		$clean_postcode = trim($reg[1]);
		$clean_postcode = strtoupper($clean_postcode);

		return $clean_postcode;

	}

	//Get a location (uses a google maps proxy)
	function get_postcode_location($zip, $country){

		$url = "http://geo.localsearchmaps.com/?zip={zip}&country={country}";
		$url = str_replace('{zip}', urlencode($zip), $url);
		$url = str_replace('{country}', urlencode($country), $url);
		
		$data = safe_scrape_cached($url);
		
		return process_emag_geocoder($data);
	}

	//process results from http://geo.localsearchmaps.com/
	function process_emag_geocoder($data){
		if (strpos($data, 'location not found') > -1){
			$return = false;
		}else{
			$return = array();

			//very hacky this, but hay, ho im in a hurry
			$data = str_replace('map.centerAndZoom(new GPoint(', '', $data);
			$data = str_replace(')', '', $data);
			$data = str_replace(';', '', $data);
			$exploded = explode(',', $data);

			$return[0] = trim($exploded[0]) + 0; //+0 to cast as number
			$return[1] = trim($exploded[1]) + 0;			

		}		
		return $return;
	}
	
	/* Given a search string, try and coax out the country, state, etc. */
	function get_place_parts($s) {
		global $countries_name_to_code, $countries_code_to_name, $countries_name_to_statecode, $countries_statecode_to_name;
		$s = explode(',', $s);
		$parts = array();
		$last = trim(end($s));
		if (isset($countries_name_to_code[strtolower($last)])) {
			$parts['country'] = $countries_name_to_code[strtolower($last)];
			array_pop($s);
		} elseif (isset($countries_name_to_statecode['US'][strtolower($last)])) {
			$parts['state'] = $countries_name_to_statecode['US'][strtolower($last)];
			$parts['country'] = 'US';
			array_pop($s);
		} elseif (isset($countries_statecode_to_name['US'][strtoupper($last)])) {
			$parts['state'] = strtoupper($last);
			$parts['country'] = 'US';
			array_pop($s);
		} elseif (isset($countries_code_to_name[strtoupper($last)])) {
			$parts['country'] = strtoupper($last);
			array_pop($s);
		} elseif (strtoupper($last) == 'UK') {
			$parts['country'] = 'GB';
			array_pop($s);
		}

		$last = trim(end($s));
		if ($parts['country'] && isset($countries_name_to_statecode[$parts['country']][strtolower($last)])) {
			$parts['state'] = $countries_name_to_statecode[$parts['country']][strtolower($last)];
			array_pop($s);
		} elseif ($parts['country'] && isset($countries_statecode_to_name[$parts['country']][strtoupper($last)])) {
			$parts['state'] = strtoupper($last);
			array_pop($s);
		}

		if (count($s) >= 2) {
			$parts['street'] = trim($s[0]);
			$parts['place'] = trim($s[1]);
		} elseif (count($s)) {
			$parts['place'] = trim($s[0]);
		}
		return $parts;
	}

	// Get a location
	function get_place_location($parts) {

		//try the city search (for outside the us)
		$url = 'http://maps.google.com/maps/geo?key=' . GOOGLE_MAPS_KEY . '&output=csv&q=';
		$out = array();
		if (isset($parts['street'])) $out[] = urlencode($parts['street']);
		if (isset($parts['place'])) $out[] = urlencode($parts['place']);
		if (isset($parts['state'])) $out[] = urlencode($parts['state']);
		$out[] = urlencode($parts['country']);
		$url .= join(',+', $out);

		$data = safe_scrape_cached($url);
		return process_google_geocoder($data);
	}
	
	// Process results from Google Maps API geocoder
	function process_google_geocoder($data) {
		$data = explode(',', $data);
		$return[0] = $data[3] + 0;
		$return[1] = $data[2] + 0;
		return $return;
	}

	//Tiny url
    function tiny_url($url,$length=30){

    	// make nasty big url all small
    	if (strlen($url) >= $length){
    		$tinyurl = @file ("http://tinyurl.com/api-create.php?url=$url");
    		
    		if (is_array($tinyurl)){
    			$tinyurl = join ('', $tinyurl);
    		} else {
    			$tinyurl = $url;
    		}
    	} else {  
    		$tinyurl = $url; 
    	}

    	return $tinyurl;
    }

    //Google maps url
    function googlemap_url_from_postcode($postcode, $zoom = 15){
        $postcode = strtolower(str_replace(" ", "+", $postcode));
        return "http://maps.google.co.uk/maps?q=$postcode&z=$zoom";
    }

	//Scarpe a url and cache it
    function safe_scrape_cached($url){

		$cache = cache::factory();

		$cached = $cache->get($url);
		if (isset($cached) && $cached !== false) {
			return $cached;
		}else{
			$page = safe_scrape($url);
		    $cache->set($url, $page, "safe_scrape");	
			return $page;
		}
		
	}	

	//Scrape a url
    function safe_scrape($url, $remove_line_breaks = false){
        $page = "";
        for ($i=0; $i < 3; $i++){ 
            if($page == false){
                 if (SCRAPE_METHOD == "PEAR"){
                     $page = scrape_page_pear($url);
                 }else{
                     $page = scrape_page_curl($url);         
                 }
            }   
        }
		if($remove_line_breaks){
			$page = remove_line_breaks($page);
		}
        return $page;
    }
    
	//scrape by pear
    function scrape_page_pear($url){
	    require_once('HTTP/Request.php');
        $page = "";
        $request = new HTTP_Request($url, array("method" => "GET", "allowRedirects" => true));
        $request->sendRequest();
        $page = $request->getResponseBody();

        return $page;

    }

	//scrape by curl
    function scrape_page_curl($url) {
		$ch = curl_init($url);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
		curl_setopt($ch,CURLOPT_FOLLOWLOCATION,TRUE);
		return curl_exec($ch);
	}

	function safe_string($object){
		return $object . '';
	}

	//Redirect page to a URL
	function redirect ($url){
	    header("Location: $url");
		exit;
	}

	//Throw 404
	function throw_404(){
		header("HTTP/1.0 404 Not Found");
		include(DOC_DIR . "/the404.php");
		exit;
	}

	//Format a string for a url
	function format_string_for_url($string) {
		$string = str_replace(
			array('&', "'", ' ', '/'),
			array('and', '', '_', '_'),
			$string
		);
		$string = strtolower(iconv("UTF-8", "ASCII//TRANSLIT", $string));
		return $string;
	}

	///////////////////////////////
	// Cal's functions from
	// http://www.iamcal.com/publish/article.php?id=13

	// Call this with a key name to get a GET or POST variable.
	function get_http_var ($name, $sanitize=true, $default=null){
		//global $HTTP_GET_VARS, $HTTP_POST_VARS;
		if (array_key_exists($name, $_POST)) {
			return mk_utf8(clean_var($_POST[$name], $sanitize));
		}
		if (array_key_exists($name, $_GET)) {
			return mk_utf8(clean_var($_GET[$name], $sanitize));
		}
	
		return $default;
	}

	/**
	 * Take a string and make it utf8 if it isn't already (it should be though)
	 */
	function mk_utf8($string) {
		return (is_utf8($string) ? $string : utf8_encode($string));
	}

	function clean_var ($a, $sanitize=true){
		$out = (ini_get("magic_quotes_gpc") == 1) ? recursive_strip($a) : $a;
	
		if ($sanitize) {
			// We want to filter out all kinds of nasty shit that a user might
			// have thrown at us.
		
			// Filtering commented out at the moment as it seems to be causing
			// problems on the dev site.
			//return filter_var($out, FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);	
			return $out;
		}
		else {
			return $out;
		}
	}

	function recursive_strip ($a){
		if (is_array($a)) {
			while (list($key, $val) = each($a)) {
				$a[$key] = recursive_strip($val);
			}
		} else {
			$a = StripSlashes($a);
		}
		return $a;
	}

	function is_utf8($str) {
		if ($str === mb_convert_encoding(mb_convert_encoding($str, "UTF-32", "UTF-8"), "UTF-8", "UTF-32")) {
			return true;
		} else {
			return false;
		}
	}
	
	function vardump($string, $exit = true) {
		print '<pre style="text-align: left">';
		var_dump($string);
		print '</pre>';
		if($exit){
			exit;
		}
	}
	// Format a date to mysql format
	function mysql_date($date){
	    return date("Y-m-d H:i:s", $date);
	}

    //postcode to location
    function postcode_to_location($postcode){

	// We don't actually need to fetch the page, we
	// can get everything we need from the url we are
	// redirected to.
        $clean_postcode = strtolower($postcode);
        $clean_postcode = str_replace(" ","+", $clean_postcode);

        $url = "http://www.streetmap.co.uk/newsearch.srf?type=Postcode&name=" . $clean_postcode;

		$headers = get_headers($url, 1);
		$location = $headers["Location"];
		$location_regex = "/x=(\d*)&y=(\d*)&/";

		preg_match ($location_regex, $location, $matches);

		return array_slice ($matches, 1);
    }

    function alert_size_to_meters($alert_area_size){
        
        $area_size_meters = 0;
        if ($alert_area_size == "s"){
            $area_size_meters = SMALL_ZONE_SIZE;
        }elseif ($alert_area_size == "m"){
            $area_size_meters = MEDIUM_ZONE_SIZE;                
        }elseif ($alert_area_size == "l"){
            $area_size_meters = LARGE_ZONE_SIZE;                
        }   
        return $area_size_meters;
    }

	//generate a unique ID
	function get_uuid() {
		$t = explode(" ", microtime());
		return sprintf('%04x%04x-%04x-%08s-%08s-%04s',
		mt_rand(0, 0xffff), mt_rand(0, 0xffff), 
		mt_rand(1, 0xffff), mt_rand(1, 0xffff), 
		getmypid(),
		substr("00000000" . dechex($t[1]), -8), // get 8HEX of unixtime
		substr("0000" . dechex(round($t[0] * 65536)), -4) // get 4HEX of microtime
		);
	}

	//Remove Line Breaks
	function remove_line_breaks($string){
		return str_replace("\n", "", str_replace("\r\n","", $string));
	}

	// Match First - grab the first match from a regex test
	function match_first($text, $regex){
		
		$return = null;
		preg_match_all($regex, $text, $matches, PREG_PATTERN_ORDER);

		if(sizeof($matches) > 0 && isset($matches[0][0])){
			$return = $matches[0][0];
		}
		
		return $return;
	}
	
	//Safe Date - try and parse anything into a date format
	function safe_date($date_to_parse){
		
		return strtotime(trim($date_to_parse));

	}
	
	//Make into a nice sentacne case string
	function sentance_case($string){
		
		//Make standard sentance case
		$string = ucwords(strtolower($string));
		$string = trim($string);
		
		//Dates
		//TODO: find and make uppercase PM, AM

		//Random Words
		$string = str_replace("Dj", "DJ", $string);
		$string = str_replace("(dj)", "(DJ)", $string);		
		$string = str_replace("Http", "http", $string);
				
		return $string;
	}

    function intToAlpha($num){
        $anum = '';
        while( $num >= 1 ) {
            $num = $num - 1;
            $anum = chr(($num % 26)+65).$anum;
            $num = $num / 26;
        }
        return $anum;
    }

    function resize_image($file_name, $max_side, $destination, $restrict_width = false, $format = 'jpeg'){

        //grab the image
        $image = null;
        if ($format == 'gif'){
            $image = imagecreatefromgif($file_name);
        }else{
            $image = imagecreatefromjpeg($file_name);            
        }

        //get size (TODO: this reall should use the above image object rather than reopening)
        list($width, $height) = getimagesize($file_name);
        
        //work out new size
        $new_height = 0;
        $new_width = 0;
        if($height > $width || $restrict_width == true){
            $new_height = ($height / $width) * $max_side;
            $new_width = $max_side;
        }else{
            $new_width = ($width / $height) * $max_side;
            $new_height = $max_side;
        }

        //resize
        $tmp = imagecreatetruecolor($new_width, $new_height);
        imagecopyresampled($tmp, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);

        //save & destroy
        if ($format == 'gif'){        
            imagepng($tmp, $destination, 100);            
        }else{
            imagejpeg($tmp, $destination, 100);
        }
        imagedestroy($image);
        imagedestroy($tmp);        
        
    }
    
    if ( !function_exists( 'imagerotate' ) ) {
        function imagerotate( $source_image, $angle, $bgd_color ) {
            $angle = 360-$angle; // GD rotates CCW, imagick rotates CW
            $temp_src = '/tmp/temp_src.png';
            $temp_dst = '/tmp/temp_dst.png';
            if (!imagepng($source_image,$temp_src)){
                return false;
            }
            $imagick = new Imagick();
            $imagick->readImage($temp_src);
            $imagick->rotateImage(new ImagickPixel($bgd_color?$bgd_color:'black'), $angle);
            $imagick->writeImage($temp_dst);
            //trigger_error( 'imagerotate( could not write to ' . $file1 . ', original image returned', E_USER_WARNING );
            $result = imagecreatefrompng($temp_dst);
            unlink($temp_dst);
            unlink($temp_src);
            return $result;
        }
    }

	function s3_url($image_size,$image_id){
		//get file name
	    $url = "http://".S3_BUCKET.".s3.amazonaws.com/";
	    if($image_size == 't'){
	        $url .= "thumbnail/";
	    }
	    if($image_size == 's'){
	        $url .= "small/";
	    }
	    if($image_size == 'm'){
	        $url .= "medium/";
	    }
	    if($image_size == 'l'){
	        $url .= "large/";
	    }

	    $url .= $image_id . ".jpg";
	
		return $url;
	}
	
	function get_image_url($params, &$smarty){
		if (STORAGE_STRATEGY=='s3'){
			return s3_url($params['size'],$params['id']);
		}
		else{
			return WWW_SERVER.'/image.php?i='.$params['id'].'&s='.$params['size'];
		}
	}
	
?>
