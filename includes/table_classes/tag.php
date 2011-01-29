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


    public function get_weighted_tags($limit = 100, $election_id = null){
        $election_id = get_election_id($election_id);
	$sql ="SELECT tag.tag, tag.tag_id, COUNT(leaflet_tag.leaflet_id) AS count FROM tag ";
	$sql.="INNER JOIN leaflet_tag ON tag.tag_id = leaflet_tag.tag_id ";
	$sql.="INNER JOIN leaflet ON leaflet_tag.leaflet_id=leaflet.leaflet_id ";
	$sql.="INNER JOIN leaflet_election ON leaflet.leaflet_id=leaflet_election.leaflet_id ";
	$sql.="WHERE leaflet.live=1 AND leaflet_election.election_id=$election_id ";
	$sql.="GROUP BY tag.tag, tag.tag_id ORDER BY COUNT(leaflet_tag.leaflet_id) DESC LIMIT " . $limit;
        return $this->execute($sql);
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
