<?php

/**
 * Table Definition for an category
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_category extends tablebase {

    public $__table = 'category';
    public $category_id;
    public $name;
    public $description;
    public $default_value;    

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_category',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'category_id'   	=> DB_DATAOBJECT_INT,
            'name'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'description'   			=> DB_DATAOBJECT_STR,
            'default_value'   			=> DB_DATAOBJECT_BOOL            
        );
    }



	/* Links */
	public function links (){
	}

	/* Keys */
    function keys() {
        return array('category_id');
    }

    /* Tells DB_DataObject that there is an autoincrementing key
    * and not to use those stupid sequence tables
    */
    function sequenceKey() {
        return array('category_id', TRUE);
    }

    public function get_category_count($date_since, $limit = 10, $cache = true, $election_id=null){
        $election_id = get_election_id($election_id);
	$return = array();
        $category = factory::create('category');
        $sql  = "SELECT COUNT(leaflet_category.leaflet_category_id) as count, category.name, category.category_id FROM category ";
        $sql .= "INNER JOIN leaflet_category ON category.category_id = leaflet_category.category_id ";
        $sql .= "INNER JOIN leaflet ON leaflet_category.leaflet_id = leaflet.leaflet_id ";
        $sql .= "INNER JOIN leaflet_election ON leaflet_election.leaflet_id = leaflet.leaflet_id ";
        $sql .= "WHERE date_delivered > '$date_since' AND leaflet.live=1 AND leaflet_election.election_id = $election_id ";
        $sql .= "GROUP BY category.name, category.category_id ORDER BY COUNT(leaflet_category.leaflet_category_id) DESC LIMIT " . $limit;

        if($cache){
            $return = $category->execute_cached($sql);
        }else{
            $return = $category->execute($sql);
        }
        return $return;
    }
}
