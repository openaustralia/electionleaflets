<?php

/* Fix tags with spaces / duplicates */

require_once(dirname(__FILE__) . "/include_path.php");
require_once(dirname(__FILE__) . "/../includes/init.php");

$tag = factory::create('tag');

$sql = "select count(tag_id) as count, trim(tag) as clean_tag, min(tag_id) as min, max(tag_id) as max from tag group by trim(tag) having count(tag_id) > 1";

$tags = $tag->execute($sql);
/*
foreach ($tags as $tag) {
    $search = factory::create('search');
    $leaflet_tags = $search->search('leaflet_tag', array(array("tag_id", "=", $tag->max)));
    foreach ($leaflet_tags as $leaflet_tag) {
        $leaflet_tag->tag_id = $tag->min;
        $leaflet_tag->update();
    }
}
*/

foreach ($tags as $tag) {
    $search = factory::create('search');
    $delete_tags = $search->search('tag', array(array("tag_id", "=", $tag->max)));
    foreach ($delete_tags as $delete_tag) {
        $delete_tag->delete();
    }
}

?>