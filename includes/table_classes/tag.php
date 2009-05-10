<?php

/**
 * Table Definition for a tag
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_tag extends tablebase {

    public $__table = 'tag';
    public $tag_id;
    public $tag;

    /* Static get */
    function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_tag',$k,$v); }

	/* Definition */
   function table() {
        return array(
            'tag_id'   	=> DB_DATAOBJECT_INT,
            'tag'   			=> DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL
        );
    }

	/* Links */
	public function links (){

	}

	/* Keys */
    function keys() {
        return array('tag_id');
    }

    public function get_weighted_tags($limit = 100){
        return $this->execute("select tag.tag, tag.tag_id, count(leaflet_id) as count from tag inner join leaflet_tag on tag.tag_id = leaflet_tag.tag_id group by tag.tag, tag.tag_id limit " . $limit);
    }
    
    public function insert(){
        $return = false;
        $search = factory::create('search');
        $result = $search->search("tag", array(array("tag", "=", $this->tag)));
        
        if(count($result) > 0){
            $this->tag = $result[0]->tag;
            $this->tag_id = $result[0]->tag_id;
            $return = true;
        }else{
            $return = parent::insert();
        }
        
        return $return;
    }
}