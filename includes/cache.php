<?php

require_once('Cache_Lite/Lite.php');

// A simple wrapper class for PEAR:Cach_Lite http://pear.php.net/package/Cache_Lite/
class Cache {

	private $cache_lite = null;

	public function __construct($cache_time) {
		$options = array(
		    'cacheDir' => CACHE_DIR . "/",
		    'lifeTime' => $cache_time
		);
		$cache_lite = new Cache_Lite($options);
	
		$this->cache_lite =  $cache_lite;
	}
	
	public static function factory ($cache_time = CACHE_TIME){
		return new Cache($cache_time);
	}

	public function set_cache_time($time) {
		$this->cache_lite->setLifeTime($time);
		return true;
	}
	
	public function set($id, $data, $group = "default") {

		$success = $this->cache_lite->save(serialize($data), $id, $group);		
		return $success;
	}
	
	public function get($id, $group="default") {
	
		$return = $this->cache_lite->get($id, $group);

		return unserialize($return);	
	}

	public function delete($id) {
		$sucess = $this->cache_lite->remove($id);	
		return $sucess;
	}
	
}

?>