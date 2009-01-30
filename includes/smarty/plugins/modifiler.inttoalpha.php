<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty lower modifier plugin
 *
 * Type:     modifier<br>
 * Name:     inttoalpha<br>
 * Purpose:  convert an int to the correct lett
 * @link http://smarty.php.net/manual/en/language.modifier.lower.php
 *          lower (Smarty online manual)
 * @author   Monte Ohrt <monte at ohrt dot com>
 * @param string
 * @return string
 */
function smarty_modifier_inttoalpha($num)
{
    $anum = '';
    while( $num >= 1 ) {
        $num = $num - 1;
        $anum = chr(($num % 26)+65).$anum;
        $num = $num / 26;
    }
    return $anum;
}

?>
