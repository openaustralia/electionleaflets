<?php
require_once('init.php');

class the404_page extends pagebase {

    function bind(){
        $this->reset_smarty(TEMPLATE_DIR . '/the404.tpl');        
        $this->assign('template_dir', TEMPLATE_DIR);
    }

    function render(){

		$this->display_template();        
    }
}

//create class instance
$the404_page = new the404_page();

?>
