{php}
	header("Content-Type: application/json");
	$leaflets_reduce = array();
    $callback = $this->_tpl_vars['callback'];

	if($this->_tpl_vars["has_leaflets"] === true) {
        foreach($this->_tpl_vars["leaflets"] as $leaflet) {
            $leaflets_reduce[] = array(
                "id" => $leaflet->leaflet_id,
                "published_by" => $leaflet->party_name,
                "title" => $leaflet->title,
                "description" => $leaflet->description,
                "date_uploaded" => date("Y-m-d", strtotime($leaflet->date_uploaded)),
                "image_url" => get_image_url(array("id" => $leaflet->leaflet_image_image_key, "size" => "t"), $this)
            );
        }
	}

    $json = json_encode($leaflets_reduce);

    if($callback) {
        echo "$callback($json)";
    }else{
        echo $json;
    }
{/php}
