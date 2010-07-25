<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>{$page_title|default:$site_tag_line} | {$site_name}</title>
	<link rel="stylesheet" media="all" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/themes/ui-lightness/jquery-ui.css" />
	<link rel="stylesheet" media="all" type="text/css" href="{$www_server}/css/main.css?v=7" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js" type="text/javascript"></script> 
	<script src="{$www_server}/script/jcarousel.js" type="text/javascript" charset="utf-8"></script>
	<script src="{$www_server}/script/functions.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js" type="text/javascript"></script>
	<link href='http://fonts.googleapis.com/css?family=Molengo' rel='stylesheet' type='text/css'>
	{if $has_upload}
	  <script src="{$www_server}/script/jquery.uploadify.v2.1.0.min.js" type="text/javascript"></script>
	  <script src="{$www_server}/script/jquery.json-2.2.min.js" type="text/javascript"></script>
	{/if}    
	<script src="{$www_server}/script/main.js?v=1" type="text/javascript"></script>
	{if $has_map}
	  <script src="http://maps.google.com/maps?file=api&v=2&key={$google_maps_key}" type="text/javascript"></script>
	  <script src="{$www_server}/script/mapstraction.js" type="text/javascript"></script>
	{/if}
	<link rel="Shortcut Icon" href="{$www_server}/favicon.ico" type="image/x-icon" />
	{if $rss_link != ''}
	  <link rel="alternate" type="application/rss+xml" title="{$page_title}" href="{$rss_link}">
	{/if}
</head>

<body>
    <div id="page-container" class="full-width">
    {if $hide_header == false}
        <div class="hide">
            <a href="#divContent">Skip navigation</a>
        </div>
            {* Comment this out for another day
            {if $is_home == false}
            <div id="divBanner">
                Track how your new MP is voting with
                <strong><a href="http://www.publicwhip.org.uk/">The Public Whip</a></strong>
                </div>
            {/if}
            *}
	
	  <div id="divHeader"{if $hide_logo == true} class="small"{/if}>

            {if $hide_logo == false}
	      <div id="pLogo">
		<h2><a href="{$www_server}">OpenAustralia Foundation Presents</h2>
                <h1><a href="{$www_server}">{$site_name}</a></h1>
                <h2><a href="{$www_server}">2010 FEDERAL ELECTION Live <span>|</span> election monitoring</a></h2>
	      </div>
            {/if}
        
            <ul id="ulMenu">
              <li>
                  <a href="{$www_server}">
                      Home
                  </a>
              </li>
              <li>
                  <a href="{$www_server}/addupload">
                      Add a leaflet
                  </a>
              </li>
              <li>
                  <a href="{$www_server}/leaflets/">
                      Latest
                  </a>
              </li>
              <!--
              <li>
                  <a href="{$www_server}/map/leaflets/">
                      Map
                  </a>
              </li>
              <li>
                  <a href="{$www_server}/analysis/">
                      Analysis
                  </a>
              </li>
              -->
            </ul>
        </div>
    {/if}
    <div id="divPage" {if $is_home}class="home"{/if}>
    
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
            
