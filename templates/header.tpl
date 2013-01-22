<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>{$page_title|default:$site_tag_line} | {$site_name}</title>
	<link rel="stylesheet" media="all" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/themes/ui-lightness/jquery-ui.css" />
	<link rel="stylesheet" media="all" type="text/css" href="{$www_server}/css/main.css?v=8" />
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

<body {if $is_full_view == true}class="full-width"{/if}>
    <div id="page-container" {if $is_full_view == true} class="full-width"{/if}>
    {if $hide_header == false}
        <div class="hide">
            <a href="#divContent">Skip navigation</a>
        </div>
        {if isset($banner)}
          <div id="divBanner">
            <form method="post" action="{$www_server}">
              {if count($elections) > 0}
                You're currently viewing leaflets for the <select name="election_id">
  	            {foreach name="elections" from="$elections" key="value" item="election"}
                  <option value="{$value}" {if $current_election == $election}selected="selected"{/if}>{$election}</option>
  	            {/foreach}</select>
                <input type="submit" value="Change"/>
              {else}
                <small>No elections are currently available to view</small>
              {/if}
            </form>
          </div>
        {/if}
	  <div id="divHeader"{if $hide_logo == true} class="small"{/if}>

            {if $hide_logo == false}
           <p class="credit">The <a href="http://www.openaustraliafoundation.org.au">OpenAustralia Foundation</a> presents:</p>
	      <div id="pLogo" onclick="window.location = '{$www_server}';">
                <h1><a href="{$www_server}">{$site_name}</a></h1>
                <h2><a href="{$www_server}">{$current_election} <span>|</span> live election monitoring</a></h2>
	      </div>
            {/if}
        	<div class="divider top-nav"><img class="left" width="110" height="42" src="/images/crease_line_left.png"/><img class="middle" width="75" height="42" src="/images/crease_line_middle.png"/><img class="right" width="75" height="42" src="/images/crease_line_right.png"/></div>
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
              <li>
                  <a href="{$www_server}/browse/">
                      Browse
                  </a>
              </li>
              {if MAP_ENABLED}
              <li>
                  <a href="{$www_server}/map/leaflets/">
                      Map
                  </a>
              </li>
              {/if}
              <!--
              <li>
                  <a href="{$www_server}/analysis/">
                      Analysis
                  </a>
              </li>
              -->
            </ul>
            <div id="header-border"><img src="/images/header_orange_line.png" /></div>
        </div>
    {/if}
    <div id="divPage" {if $is_home}class="home"{/if} {if $is_full_view == true}class="full-width"{/if}>
    
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
            
