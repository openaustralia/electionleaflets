<?php
$page = file_get_contents('http://aec.gov.au/profiles/index.htm');
$pattern='/<tbody>(.*)?<\/tbody>/isxmU';
preg_match_all($pattern,$page,$matches1);

$pattern='/<tr>(.*)?<\/tr>/isxmU';
preg_match_all($pattern,$matches1[0][0],$matches2);

$baseurl="http://www.aec.gov.au/Elections/federal_elections/2007/profiles/";

$pattern='/<td>(.*)?<\/td>/isxmU';
foreach($matches2[0] as $row)
{
    preg_match_all($pattern,$row,$matches3);
    $name=trim($matches3[1][0]);
    $state=trim($matches3[1][1]);
    $wiki="http://en.wikipedia.org/wiki/Division_of_$name";
    print "INSERT INTO constituency (name,constituency_type_id,area_code,wikipedia_url) VALUES ('$name',4,'$state','$wiki');\n";
}
?>
