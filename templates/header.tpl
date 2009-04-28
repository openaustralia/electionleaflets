<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>{$site_name} | {$page_title}</title>	
	<link rel="stylesheet" media="all" type="text/css" href="{$www_server}/css/main.css" />
    <script src="{$www_server}/javascript/scriptaculous.js" type="text/javascript"></script>   	
    <script src="{$www_server}/javascript/functions.js" type="text/javascript"></script>      	
    <script src="{$www_server}/javascript/main.js" type="text/javascript"></script>
    <script src="{$www_server}/javascript/edit_map.js" type="text/javascript"></script>    

</head>

<body>

    <div class="hide">
        <a href="#divContent">Skip navigation</a>
    </div>

    <div id="divPage">
        <div id="divHeader">
            
            <p id="pLogo"><a href="{$www_server}"><span class="hideX">{$site_name} - {$site_tag_line}</span></a></p>
            
            <ul id="ulMenu">
  	          <li {if $menu_item == "home"}class="selected"{/if}>
  	              <a href="{$www_server}/home.php">
  	                  Home
  	              </a>
  	          </li>
	          <li {if $menu_item == "add"}class="selected"{/if}>
	              <a href="{$www_server}/addupload.php">
	                  Add a leaflet
	              </a>
	          </li>
	          <li {if $menu_item == "browse"}class="selected"{/if}>
	              <a href="{$www_server}/browse.php">
	                  Browse
	              </a>
	          </li>
	          <li {if $menu_item == "league"}class="selected"{/if}>
	              <a href="{$www_server}/leaguetable.php">
	                  League tables
	              </a>
	          </li>
	          <li {if $menu_item == "about"}class="selected"{/if}>
	              <a href="{$www_server}/about.php">
	                  About
	              </a>
	          </li>
	        </ul>
        </div>

        <div id="divContent">
   
            {* Warnings *}
			<div id="divWarning">
	            {if $show_warnings == true}
	   				<ul class="nobullets">
	                       {foreach name="warnings" from="$warnings" item="warning"}
	                           <li>{$warning}</li>
	                       {/foreach}
	                   </ul>
				{/if}
			</div>
			
			{* Messages *}
			<div id="divMessages">
	            {if $show_messages == true}
	   				<ul class="nobullets">
	                       {foreach name="messages" from="$messages" item="message"}
	                           <li>{$message}</li>
	                       {/foreach}
	                   </ul>
				{/if}
			</div>
            
