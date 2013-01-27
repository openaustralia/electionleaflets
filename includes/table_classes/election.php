<?php

/**
 * Table Definition for elections
 */

require_once('init.php');
require_once ('tablebase.php');

class tableclass_election extends tablebase {

    public $__table = 'election';
    public $election_id;
    public $name;
    public $election_type_id;
    public $vote_date;
    public $enabled;

    /* Static get */
    //function staticGet($k,$v=NULL) { return DB_DataObject::staticGet('tableclass_leaflet',$k,$v); }

    /* Definition */
    function table() {
        return array(
            'election_id'       => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'name'              => DB_DATAOBJECT_STR + DB_DATAOBJECT_NOTNULL,
            'election_type_id'  => DB_DATAOBJECT_INT + DB_DATAOBJECT_NOTNULL,
            'vote_date'         => DB_DATAOBJECT_DATE + DB_DATAOBJECT_NOTNULL,
            'enabled'           => DB_DATAOBJECT_INT
        );
    }

    /* Links */
    public function links (){
    }

    /* Keys */
    function keys() {
        return 	array('election_id');
    }

    /* Tells DB_DataObject that constituency_id is an autoincrementing key
     * and not to use those stupid sequence tables
     */
    function sequenceKey() {
        return array('election_id', TRUE);
    }
}
