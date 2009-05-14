<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty plugin
 *
 * Type:     modifier<p>
 * Name:     nl2p<p>
 * Date:     Feb 26, 2003
 * Purpose:  convert \r\n, \r or \n to <<p>>
 * Input:<p>
 *         - contents = contents to replace
 *         - preceed_test = if true, includes preceeding break tags
 *           in replacement
 * Example:  {$text|nl2p}
 * @link 
 * @version  1.0
 * @author   Richard Pope
 * @param string
 * @return string
 */
function smarty_modifier_nl2p($string)
{
    $return = "";
    $lines = split('\n',$string);

    foreach ($lines as $line) {
        if(isset($line) && $line != ''){
            $return .= "<p>" . $line . "</p>";
        }
    }    
    return $return;
}

/* vim: set expandtab: */

?>
