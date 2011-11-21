<?php
/** @internal Set Callback for object unserialization */
ini_set('unserialize_callback_func', 'unserialize_callback_factory');

require_once('table_classes/leaflet.php');
require_once('table_classes/party.php');
require_once('table_classes/category.php');
require_once('table_classes/constituency.php');

class factory {

	public static function create ($class_name, $element_id=null, $cache=false, $require_only=false) {

		$object = null;

		switch ($class_name) {
			case 'search':
				require_once('search.php');
				if (!$require_only) {
					$object = new searcher();
				}
				break;	
			case 'leaflet_search':
				require_once('leaflet_search.php');
				if (!$require_only) {
					$object = new leaflet_search();
				}
				break;					
			case 'application':
				require_once('application.php');
				if (!$require_only) {
					$object = new application();
				}
				break;
			case 'australian_postcode':
			require_once( 'table_classes/config.php' );
			require_once('table_classes/australian_postcode.php');
    			if (!$require_only) {
    				$object = DB_DataObject::factory($class_name);
    			}
			case 'election':
        require_once( 'table_classes/config.php' );
        require_once('table_classes/election.php');
        if (!$require_only) {
              $object = DB_DataObject::factory($class_name);
        }
			case 'category':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/category.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}
      case 'category_election':
        require_once( 'table_classes/config.php' );
        require_once('table_classes/category_election.php');
        if (!$require_only) {
          $object = DB_DataObject::factory($class_name);
        }
			case 'rate_type':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/rate_type.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}
			case 'rate_value':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/rate_value.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}
			case 'rate_interesting':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/rate_interesting.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
			case 'image_que':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/image_que.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}				
			case 'email_alert':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/email_alert.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}				
				break;	
			case 'constituency':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/constituency.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}
				break;				
			case 'constituency_election':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/constituency_election.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}
				break;				
			case 'country':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/country.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}
				break;							
			case 'constituency':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/constituency.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}
				break;				
			case 'constituency_type':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/constituency_type.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}				
				break;				
			case 'leaflet':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/leaflet.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}				
			case 'leaflet_category':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/leaflet_category.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
				break;	
			case 'leaflet_image':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/leaflet_image.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
				break;
			case 'leaflet_constituency':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/leaflet_constituency.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
				break;								
			case 'leaflet_party_attack':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/leaflet_party_attack.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
				break;
			case 'leaflet_tag':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/leaflet_tag.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
				break;
			case 'leaflet_category':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/leaflet_category.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
				break;				
			case 'leaflet_election':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/leaflet_election.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}
				break;
			case 'party':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/party.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
				break;
			case 'party_election':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/party_election.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}
				break;
			case 'promise':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/promise.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
				break;
			case 'tag':
				require_once( 'table_classes/config.php' );
				require_once('table_classes/tag.php');
				if (!$require_only) {
					$object = DB_DataObject::factory($class_name);
				}									
				break;																				
			case 'json':
				require_once('json.php');
				if (!$require_only) {
					$object = new Services_JSON();
				}
			break;
			case 'geocoder':
				require_once('geocoder.php');
				if (!$require_only) {
					$object = new geocoder();
				}
			break;			
			case 'image':
				require_once('image.php');
				if (!$require_only) {
					$object = new image();
				}				
			break;
			case 'geograph':
				require_once('apis/geograph.php');
				if (!$require_only) {
					$object = new geograph();
				}	
			case 'twfy':
				require_once('apis/theyworkforyou.php');
				if (!$require_only) {
			        $object = new TWFYAPI(THEYWORKFORYOU_API_KEY);
				}							
			break;
			case 's3':
				require_once('apis/s3/S3.php');
				if (!$require_only) {
			        $object = new S3();
				}							
			break;						
			case 'pdfer':
				require_once('pdfer.php');
				if (!$require_only) {
					$object = new pdfer();
				}								
				break;							
			// Catch all
			default:
				if (!$require_only) {
					trigger_error('Unknown class: ' . $class_name, 'The class that was thrown at this factory method is unknown. Check that you\'re passing the right data or that you haven\'t forgotten to define the class here!');
				}
				else {
					// We'll mention something in the error log as this is an
					// error
					
					error_log('Could not load class ' . $class_name . ' via require_only in teh factory');
				}
				break;
		}
		
		// And if we're here, we should have an object that we can now apply
		// the loading rules to
		
		return factory::load($object, $element_id, $cache);
	}
	
	private static function load($object, $element_id, $cache=false) {
		if (isset($element_id) && ($element_id === 0 || !empty($element_id))) {
			// We need to load data for this item
			$object->element_id = $element_id;
			$object->load($cache);
		}
		
		return $object;
	}
}

/**
 * This function will be called automatically when unserialize attempts to
 * create an object that it doesn't know about. In order for it to do what it
 * needs to do, we need to require the correct file, so we're just going to pass
 * this through the factory which will require what is required (hopefully)
 */
function unserialize_callback_factory($classname) {

	factory::create($classname, null, null, true);
}

?>
