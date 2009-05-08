<?php

require_once('cache.php');

//basic search wrapper for DB_DataObjects
class searcher {

	//search cached
	public function search_cached ($class_name, $where_clauses, $clause_join = 'AND', $joins = null, $order_clauses = null,
		$number=null, $start=null) {

		$return = false;

		//build up the cache key
		$key = $class_name . print_r($where_clauses, true) . $clause_join . print_r($joins, true) . 
			print_r($order_clauses, true) . $number . $start;

		//check the cache
		$cache = cache::factory();
		$cached = $cache->get($key, "search");
		//if we have something in the cache, grab that, if not do the query as normal
		if (isset($cached) && $cached !== false) {
			$return = $cached;
		}else{
			$return = $this->search($class_name, $where_clauses, $clause_join, $joins, $order_clauses, $number, $start);
		}

		//cache
		$cached = $cache->set($key, $return, "search");
		if($cached == false){
			trigger_error("Failed to cache database call");
		}

		//return
		return $return;
	}

	//Search
	public function search($class_name, $where_clauses, $clause_join = 'AND', $joins = null, $order_clauses = null,
		$number=null, $start=null) {

		//get the basic search object
		$search_object = $this->get_basic_search_object($class_name, $where_clauses, $clause_join, $joins, $order_clauses, $number, $start);
		
		return $this->handle_result($search_object);
	}

	//Proximity search (Km)
	public function search_proximity ($class_name, $where_clauses, $lng, $lat, $distance_km = null, $clause_join = 'AND', $joins = null, $order_clauses = null,
		$number=null, $start=null, $lng_field = 'lng', $lat_field = 'lat') {
			
		//create search object
		$search_object = $this->get_basic_search_object($class_name, $where_clauses, $clause_join, $joins, $order_clauses, $number, $start);

		//calculate distance field
		$search_object->selectAdd("((ACOS(SIN(" . $search_object->escape($lat) . " * PI() / 180) * SIN(" . $search_object->escape($lat_field) . " * PI() / 180) + COS(" . $lat . "  * PI() / 180) * COS(" . $search_object->escape($lat_field) . " * PI() / 180) * COS((" . $search_object->escape($lng) . "  - " . $search_object->escape($lng_field) . ") * PI() / 180)) * 180 / PI()) * 60 * 1.1515) as distance");

		//add distance having clause
		if(isset($distance_km)){
			$search_object->having("distance < " . $search_object->escape($distance_km));
		}

		return $this->handle_result($search_object);

	}

	//custom query
	public function query($class_name, $sql){
		//create search object
		$search_object = factory::create($class_name);
						
						
		$search_object->query($sql);
		return $this->handle_result($search_object);	
	}

	public function query_cached($class_name, $sql){
		
		$return = false;

		//check the cache
		$cache = cache::factory();
		$cached = $cache->get($sql, "search");
		
		//try and get from cache, if not, get from database
		if (isset($cached) && $cached !== false) {
			$return = $cached;
		}else{
			$return = $this->query($class_name, $sql);
			//cache
			$cached = $cache->set($sql, $return, "search");
			if($cached == false){
				trigger_error("Failed to cache database call");
			}
		}
	
		return $return;
	}

	//handle search results (convert into objects)
	private function handle_result($search_object){

		$return = array();
		
		//get search count
		$search_count = $search_object->find();

		//grab any objects
		$found_objects = array();
		if($search_count > 0){
			while($search_object->fetch()){
				array_push($found_objects, clone($search_object));
			}
			$return = $found_objects;
		}

		return $return;
	}

	//get the basic search object search
	private function get_basic_search_object ($class_name, $where_clauses, $clause_join = 'AND', $joins = null, $order_clauses = null,
		$number=null, $start=null) {

		//create search object
		$search_object = factory::create($class_name);

		//create where clauses
		foreach($where_clauses as $where_clause) {

			$quote = "'";
			if(is_numeric($where_clause[2])){
				$quote = "";
			}
			if(isset($where_clauses[3])){
			    $clause_join = $where_clauses[3];
		    }

			$search_object->whereAdd( $where_clause[0] . " " . $where_clause[1] . " " . $quote . 
				$search_object->escape($where_clause[2]) . $quote, $clause_join);
		}

		//joins
		if(isset($joins) && sizeof($joins) > 0){
			$search_object->selectAs();		
			foreach ($joins as $join) {
				
				//make join object
				$join_object = factory::create($join[0]);

				//check if it has any joins of its own?
				if($join[3]){
					$secondary_join_object = factory::create($join[3][0]);
				    if($join[3][3]){					
					    $tertiary_join_object = factory::create($join[3][3][0]);				        
					    $secondary_join_object->joinAdd ($tertiary_join_object, $join[3][3][1], $join[3][3][0], $join[3][3][2]);													    
					    $search_object->selectAs($tertiary_join_object, $join[3][3][0] . '_%s', $join[3][3][0]);										    
				    }
					
					$join_object->joinAdd ($secondary_join_object, $join[3][1], $join[3][0], $join[3][2]);								
					$search_object->selectAs($secondary_join_object, $join[3][0] . '_%s', $join[3][0]);					
				}

				//add to search object
				$override_link_field = isset($join[2]);
				if($override_link_field){
					$search_object->joinAdd ($join_object, $join[1], $join[0], $join[2]);
				}else{
					$search_object->joinAdd ($join_object, $join[1], $join[0]);		
				}								
				
				$search_object->selectAs($join_object, $join[0] . '_%s', $join[0]);				
			}

		}

		//create order by's
		if(isset($order_clauses)){
			foreach($order_clauses as $order_clause) {
				$search_object->orderBy($order_clause[0] . " " . $order_clause[1]);
			}		
		}

		//Limit / paging
		if (isset($number) && isset($start)) {
			$search_object->limit($start, $number);
		}elseif (isset($number)) {
			$search_object->limit($number);		
		}

		return $search_object;
	}

	//get by ID
	public function get_by_id($class_name, $id){
		$return = false;
		
		$search = factory::create('search');
		$search_object = factory::create($class_name);		
		$keys = $search_object->keys();
		
		$result = $search->search($class_name, array(array($keys[0], '=', $id)));

		if(sizeof($result) == 1){
			$return = $result[0];
		}
		
		return $return;
	}
	
}


?>