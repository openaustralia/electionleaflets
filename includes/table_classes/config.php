<?php
	//define database configuration values
	$options = &PEAR::getStaticProperty('DB_DataObject','options');
	//check for sqldebug
	$debug_level = 0;
	if(DEVSITE === true){
    	$debug_level = SQL_DEBUG_LEVEL;
    	if(isset($_GET['sqldebug'])){
    		$debug_level = $_GET['sqldebug'];
    	}
    }

	//more configs
	$options = array(
	'database' => 'mysql://' . DB_USER . ':'. DB_PASS .'@' . DB_HOST . '/' . DB_NAME,
	'schema_location' => INCLUDE_DIR . '/table_classes/',
	'class_location' => INCLUDE_DIR . '/table_classes/',
	'require_prefix' => 'DataObjects/',
	'class_prefix' => 'tableclass_',
	'db_driver' => 'MDB2',
	"debug" => $debug_level
	);
?>
