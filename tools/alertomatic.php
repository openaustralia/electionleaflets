<?php
/*
    send email alerts
    select * from email_alert where hour(timediff(now(), last_sent)) >= frequency_hours
*/

define(ALERT_DEBUG,0);
//define(ALERT_DEBUG_RECIPIENT,'foo@foo.com');

require_once (dirname(__FILE__) . "/include_path.php");
require_once (dirname(__FILE__) . "/../includes/init.php");
$email_alert = factory::create('email_alert');
$sql="SELECT * FROM email_alert 
        WHERE HOUR(TIMEDIFF(NOW(), last_sent)) >= frequency_hours AND activated = 1 ";
$email_alerts = $email_alert->execute($sql);

if(ALERT_DEBUG>0) {
    print "$sql \n";
    print count($email_alerts) . " alerts to process\n";
}


foreach ($email_alerts as $email_alert) {
    //send email
    $leaflets = get_leaflets($email_alert);
    if(ALERT_DEBUG>0) print count($leaflets) . " leaflets\n";
    if (count($leaflets) > 0) {
        send_alert($email_alert, $leaflets);
    }
    //update last_sent
    $email_alert->last_sent = mysql_date(time());
    $email_alert->update();
}


// retrieve array of leaflets which match the alert type and time period
function get_leaflets($email_alert) {
    if(ALERT_DEBUG>0){
        print $email_alert->type . "\n";
	print "frequency : " .$email_alert->frequency_hours . "\n";
    }

    $results = array();
    $search = factory::create('search');
    $time = time() - (60 * 60 * $email_alert->frequency_hours);
    $time = mysql_date($time);

    //do we have any matching leaflets?
    if ($email_alert->type == 'attack') {
        $results = $search->search('leaflet', 
    	    array(array('leaflet_party_attack.party_id', '=', $email_alert->parent_id), 
    	    array('leaflet.date_uploaded', '>=', $time)),
    	    'AND', array(array('leaflet_party_attack', 'inner')));

    } else if ($email_alert->type == 'party') {
        $results = $search->search('leaflet', 
	    array(array('leaflet.publisher_party_id', '=', $email_alert->parent_id), 
	    array('leaflet.date_uploaded', '>=', $time)));

    } else if ($email_alert->type == 'constituency') {
        $results = $search->search('leaflet', 
    	    array(array('leaflet_constituency.constituency_id', '=', $email_alert->parent_id), 
    	    array('leaflet.date_uploaded', '>=', $time)), 
    	    'AND', array(array('leaflet_constituency', 'inner')));
    	    
    } else if ($email_alert->type == 'category') {
        $results = $search->search('leaflet', 
    	    array(array('leaflet_category.category_id', '=', $email_alert->parent_id), 
    	    array('leaflet.date_uploaded', '>=', $time)), 
    	    'AND', array(array('leaflet_category', 'inner')));
    }
    return $results;


}
function send_alert($email_alert, $leaflets) {
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
    if(ALERT_DEBUG_RECIPIENT){
        send_text_email(ALERT_DEBUG_RECIPIENT, SITE_NAME, CONFIRMATION_EMAIL, $subject, $body);
    } else {
        send_text_email($email_alert->email, SITE_NAME, CONFIRMATION_EMAIL, $subject, $body);
    }
}


function get_url($email_alert) {
    //do we have any matching leaflets?
    if ($email_alert->type == 'attack') {
        $return = WWW_SERVER . '/leaflets.php?a=' . $email_alert->parent_id;
    } else if ($email_alert->type == 'party') {
        $search = factory::create('search');
        $results = $search->search('party', array(array('party_id', '=', $email_alert->parent_id)));
	$return = WWW_SERVER . '/parties/' . $results[0]->url_id;
    } else if ($email_alert->type == 'constituency') {
        $search = factory::create('search');
        $results = $search->search('constituency', array(array('constituency_id', '=', $email_alert->parent_id)));
        $return = WWW_SERVER . '/' . AREA_NAMES . '/' . $results[0]->url_id;
    } else if ($email_alert->type == 'category') {
        $return = WWW_SERVER . '/categories/' . $email_alert->parent_id;
    }
    if (ALERT_DEBUG>0) {
	print "ID=" . $email_alert->parent_id ."\n";
	print $return . "\n\n";
    }
    return $return;
}
?>