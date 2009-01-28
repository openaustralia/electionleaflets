<?php
function exception_handler($exception) {
	return error_handler(E_USER_ERROR, $exception->getMessage(), $exception->getFile(), $exception->getLine(), array());
}

function error_handler($errno, $errmsg, $filename, $linenum, $vars) {

	$errortype = array (
		E_ERROR				=> "Error",
		E_WARNING			=> "Warning",
		E_PARSE				=> "Parsing Error",
		E_NOTICE			=> "Notice",
		E_CORE_ERROR		=> "Core Error",
		E_CORE_WARNING		=> "Core Warning",
		E_COMPILE_ERROR		=> "Compile Error",
		E_COMPILE_WARNING	=> "Compile Warning",
		E_USER_ERROR		=> "User Error",
		E_USER_WARNING		=> "User Warning",
		E_USER_NOTICE		=> "User Notice",
		// PHP 5 only
		E_STRICT			=> "PHP 5 Strict Notice",
		// PHP 5.2 only
		E_RECOVERABLE_ERROR	=> 'PHP 5.2 Recoverable Error'
	);		

	//check error is of an appropriate level
	$errors_to_report = bit_compactor(ini_get('error_reporting'));	
	if (!in_array($errno, $errors_to_report)) {
		// There's nothing to report here
		
		return;
	}
	
	//get the back trace
	$backtrace = debug_backtrace();
	$backtrace = array_slice($backtrace, 1);

	//make the message
	$fatal_errors = array(
		E_ERROR, E_CORE_ERROR, E_COMPILE_ERROR, E_USER_ERROR, E_RECOVERABLE_ERROR
	);
	
	$err = '';
	if (isset($_SERVER['REQUEST_URI'])) {
		$err .= "URL:\t\thttp://" . $_SERVER['SERVER_NAME']. $_SERVER['REQUEST_URI'] . "\n";
	}
	else {
		$err .= "URL:\t\tNone - running from command line?\n";
	}
	if (isset($_SERVER['HTTP_REFERER'])) {
		$err .= "Referer:\t" . $_SERVER['HTTP_REFERER'] . "\n";
	}
	else {
		$err .= "Referer:\tNone\n";
	}
    if (isset($_SERVER['REMOTE_ADDR'])) {
    	$err .= "REMOTE IP:\t" . $_SERVER['REMOTE_ADDR'] . "\n";
    }
    else {
    	$err .= "REMOTE IP:\tNone\n";
    }
	if (isset($_SERVER['SERVER_ADDR'])) {
		$err .= "SERVER ADDR:\t" . $_SERVER['SERVER_ADDR'] . "\n";
	}
	else {
		$err .= "SERVER_ADDR:\tNone\n";
	}
	if (isset($_SERVER['REQUEST_METHOD'])) {
		$err .= "REQUEST METHOD:\t" . $_SERVER['REQUEST_METHOD'] . "\n";
	}
	else {
		$err .= "REQUEST METHOD:\tNone\n";
	}
	if (isset($_SERVER['HTTP_USER_AGENT'])) {
		$err .= "User-Agent:\t" . $_SERVER['HTTP_USER_AGENT'] . "\n";
	}
	else {
		$err .= "User-Agent:\tNone\n";
	}
	$err .= "Number:\t\t$errno\n";
	$err .= "Type:\t\t" . $errortype[$errno] . "\n";
	$err .= "Message:\t$errmsg\n";
	$err .= "File:\t\t$filename\n";
	$err .= "Line:\t\t$linenum\n";
	
	// Add in the suplimentry data 
	if (isset($GLOBALS['_REPORT_ERROR_MESSAGE']) && !empty($GLOBALS['_REPORT_ERROR_MESSAGE'])) {
		$err .= "Info:\t\t" . $GLOBALS['_REPORT_ERROR_MESSAGE'] . "\n";
		unset($GLOBALS['_REPORT_ERROR_MESSAGE']);
	}

	// get the details of where the error is
	if (is_readable($filename)) {
		$source = file($filename);
		$err .= "\nSource:\n\n";
		// show the line, plus prev and next, with line numbers.
		$err .= $linenum-2 . " " . $source[$linenum-3];
		$err .= $linenum-1 . " " . $source[$linenum-2];
		$err .= "<b>". $linenum . " " . $source[$linenum-1]."</b>";
		$err .= $linenum+1 . " " . $source[$linenum];
		$err .= $linenum+2 . " " . $source[$linenum+1];
	}
	
	// add in the back trace
	$err .= "\nBacktrace:\n ". adodb_backtrace(false, $backtrace);

	
	// Now we want to add in the session, request and suplimentry data
	if (isset($_REQUEST) && is_array($_REQUEST) && count($_REQUEST) > 0) {
		$err .= "\nREQUEST Data:\n\n";
		$err .= print_r($_REQUEST, true);
	}

	if (isset($GLOBALS['_REPORT_ERROR_DATA'])) {
		$err .= "\nADDITIONAL Data:\n\n";
		$err .= print_r($GLOBALS['_REPORT_ERROR_DATA'], true);
		unset($GLOBALS['_REPORT_ERROR_DATA']);
	}

	//anything useful in the session
	if (isset($_SESSION) && is_array($_SESSION) && count($_SESSION) > 0) {
		$session = $_SESSION;
		$err .= "\nSESSION Data:\n\n";
		$err .= print_r($session, true);
	}

	//either display the message on screen or email it (if on the live site)
	$fatal = false;

    if (DEVSITE){
		print '<pre>' . $err . '</pre>';
    }else{
		//send the email
		$subject = BUG_EMAIL_PREFIX . ' ' . ($errno != E_USER_WARNING ? 'FATAL ' : 'WARNING ') . 
			(defined('APP_NAME') ?  '(' . APP_NAME . ') ' : '') . $errmsg;

		send_text_email(BUG_TO_EMAIL, BUG_EMAIL_PREFIX, BUG_FROM_EMAIL, $subject, $err);
		
		if ($errno != E_USER_WARNING) {
			
			//tell people something bad happened
			print '<div style="text-align:center;">';
			print '<h1>Sorry, something went wrong</h1>';
			print '<h3>An email has been sent to the geeks!</h3>';
			print '<p>In the mean time <a href="http://www.flickr.com/photos/tags/babypanda/">here\'s some baby pandas</a></p>';
			print '</div>';
			
			$fatal = true;
		}

    }
	
	//Copy error to the error log
	error_log($errortype[$errno] . ' : ' . $errmsg . ' ( ' . $filename . ' [' . $linenum . '] )');
	
	//if fatal then die()
	if ($fatal || in_array($errno, $fatal_errors)) {
		die();
	}	
}

function bit_compactor($bit) {
	$out = array();
	while ($bit > 0) {
	   for($i = 0, $n = 0; $i <= $bit; $i = 1 * pow(2, $n), $n++) {
	       $end = $i;
	   }
	   $out[] = $end;
	   $bit = $bit - $end;
	}
	
	return $out;
}

// pretty prints the backtrace, copied from http://uk.php.net/manual/en/function.debug-backtrace.php
function adodb_backtrace($print=true, $backtrace=array()){
  $s = "Stack Trace:\n";
  if (PHPVERSION() >= 4.3) {
      
    $MAXSTRLEN = 64;
        $s = '<pre align=left>';
    if (count($backtrace) == 0) {
    	// Fetch the backtrace
	    $traceArr = debug_backtrace();
    }
    else {
    	$traceArr = $backtrace;
    }
    $tabs = sizeof($traceArr)-1;
    foreach ($traceArr as $arr) {    	
      for ($i=0; $i < $tabs; $i++) $s .= '  ';
      $tabs -= 1;
      if (isset($arr['class'])) $s .= $arr['class'].'.';
      $args = array();
      if (isset($arr['args'])) foreach($arr['args'] as $v) {
	if (is_null($v)) $args[] = 'null';
	else if (is_array($v)) $args[] = 'Array['.sizeof($v).']';
	else if (is_object($v)) $args[] = 'Object:'.get_class($v);
	else if (is_bool($v)) $args[] = $v ? 'true' : 'false';
	else {
	  $v = (string) @$v;
	  $str = htmlspecialchars(substr($v,0,$MAXSTRLEN));
	  if (strlen($v) > $MAXSTRLEN) $str .= '...';
	  $args[] = $str;
	}
      }
      
      $reg = array();
      if (ereg('/([0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]+)/(.+)$', $arr['file'], $reg)) {
      	$href = SVN_REPOSITORY . '/releases/' . $reg[1] . '/' . $reg[2];
      }
      else {
      	$href = 'file://' . $arr['file'];
      }
      
      $s .= $arr['function'].'('.implode(', ',$args).')';
      $s .= sprintf("</font><font color=#808080 size=-1> # line %4d,".
    		    " file: <a href=\"%s\">%s</a></font>",
      	     $arr['line'],$href,$arr['file']);
      $s .= "\n";
    }   
         $s .= '</pre>';
    if ($print) print $s ;
  }
  return $s;
}

// Set the error and exception handlers to the custom ones
$old_error_handler = set_error_handler('error_handler');
$old_exception_handler = set_exception_handler('exception_handler');
?>
