<?php
$page = file_get_contents('http://aec.gov.au/Parties_and_Representatives/Party_Registration/Registered_parties/index.htm');
$pattern='/[START PH ID:Content1 RTB:MarkUp] -->(.*)?<!-- [END PH ID:Content1]/isxmU';
preg_match_all($pattern,$page,$matches1);

//print $matches1[0][5];

$pattern='/<strong><a href=\"(.*)\">(.*)<\/a><\/strong>/iU';
preg_match_all($pattern,$matches1[0][5],$matches2);

//print_r($matches2);



$baseurl="/Parties_and_Representatives/Party_Registration/Registered_parties/";
for($i=0;$i<count($matches2[2]);$i++){
    $party=$matches2[2][$i];
    $url=$matches2[1][$i];
    if(!stripos($url,"Parties_and_Representatives")) $url=$baseurl.$url;
    $url="http://aec.gov.au$url";
    print "INSERT INTO party (name,country_id,url_id) VALUES ('$party',13,'$url');\n";
}
?>
