<?php

/*
    send email alerts
    select * from email_alert where hour(timediff(now(), last_sent)) >= frequency_hours
*/

 	require_once(dirname(__FILE__) . "/include_path.php");
	require_once(dirname(__FILE__) . "/../includes/init.php");

    $email_alert = factory::create('leaflet');
    $email_alerts = $email_alert->execute("
        Select * from email_alert 
        where hour(timediff(now(), last_sent)) >= frequency_hours and activated = 1
    ");            

	foreach ($email_alerts as $email_alert) {
        
        //send email
        $leaflets = get_leaflets($email_alert);

        if(count($leaflets) > 0){
            send_alert($email_alert);
        }

        //update last_sent
        $email_alert->last_sent = $this->last_sent = mysql_date(time());
        $email_alert->update();
	}

	function get_leaflets($email_alert){
	    $results = array();
        $search = factory::create('search');
        $time = time() - (60 * 60 * $email_alert->frequency_hours);
        $time = mysql_date($time);
        
        //do we have any matching leaflets?
        if($email_alert->type = 'attack'){
            $search->search('leaflet', 
                array(
                    array('leaflet_party_attack.party_id', '=', $email_alert->parent_id),
                    array('leaflet.date_uploaded', '>=', $time)
                ),
                'AND',
    			array(array('leaflet_party_attack', 'inner'))
            );
        }else if($email_alert->type = 'party'){
            $search->search('leaflet', 
                array(
                    array('leaflet.party_id', '=', $email_alert->parent_id),
                    array('leaflet.date_uploaded', '>=', $time)                    
                )
            );
        }else if($email_alert->type = 'constituency'){
            $search->search('leaflet', 
                array(
                    array('leaflet_constituency.constituency_id', '=', $email_alert->parent_id),
                    array('leaflet.date_uploaded', '>=', $time)                    
                ),
                'AND',
    			array(array('leaflet_constituency', 'inner'))
            );

        }else if($email_alert->type = 'category'){
            $search->search('leaflet', 
                array(
                    array('leaflet_category.category_id', '=', $email_alert->parent_id),
                    array('leaflet.date_uploaded', '>=', $time)                    
                ),
                'AND',
    			array(array('leaflet_category', 'inner'))
            );

        }
    }

    function send_alert($email_alert, $leaflets){

		$smarty = new Smarty();
        $smarty->compile_dir = SMARTY_PATH;
        $smarty->compile_check = true;
        $smarty->template_dir = TEMPLATE_DIR;
        $smarty->assign('leaflets', $leaflets);
        $smarty->assign('leaflet_count', $leaflets);  
        $smarty->assign('url', get_url($email_alert));

        $subject = 'New ' . $email_alert->title;
        $body = $smarty->fetch(TEMPLATE_DIR . '/emails/send_alert.tpl');

		//send email
		send_text_email($email_alert->email, SITE_NAME, CONFIRMATION_EMAIL, $subject, $body);

    }

    function get_url($email_alert){
        $return = WWW_SERVER . 'leaflets.php?';
        
        //do we have any matching leaflets?
        if($email_alert->type = 'attack'){
            $return = $return . 'a=' . $email_alert->parent_id;
        }else if($email_alert->type = 'party'){
            $return = $return . 'p=' . $email_alert->parent_id;
        }else if($email_alert->type = 'constituency'){
            $search = factory::create('search');
            $results = $search->search('constituency', array('constituency_id', '=', $email_alert->parent_id));
            $return = $return . 'n=' . $results[0]->url_id;
        }else if($email_alert->type = 'category'){
            $return = $return . 'c=' . $email_alert->parent_id;
        }
        
        return $return;
    }
?>