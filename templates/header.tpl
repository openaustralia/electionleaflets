<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>{$site_name} | {$page_title}</title>	
	<link rel="stylesheet" media="all" type="text/css" href="{$www_server}/css/main.css" />
    <script src="{$www_server}/script/functions.js" type="text/javascript"></script>
    <script src="{$www_server}/script/main.js" type="text/javascript"></script>
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

    <div class="hide">
        <a href="#divContent">Skip navigation</a>
    </div>

    <!--
    <div id="divBanner">
        <strong>The Straight Choice is currently experiencing technical difficulties because of ongoing legal action by Royal Mail</strong>.<br/> 
        Our provider of postcode data, ErnestMarples.com, has been taken offline because of legal action. Until we find an alternative source, we you are unable to upload new leaflets or search for existing leaflets near you.
        We apologise for the inconvenience. For more information, visit the <a href="http://www.ernestmarples.com/blog/">Ernest Marples Blog</a>

    </div>
    -->
    
    <div id="divPage" {if $is_home}class="home"{/if}>
        
        <div id="divHeader"{if $hide_logo == true} class="small"{/if}>
            
            {if $hide_logo == false}
                <p id="pLogo"><a href="{$www_server}"><span class="hide">{$site_name} - {$site_tag_line}</span></a></p>
            {/if}
            
            <ul id="ulMenu">
  	          <li>
  	              <a href="{$www_server}">
  	                  Home
  	              </a>
  	          </li>
	          <li>
	              <a href="{$www_server}/addupload.php">
	                  Add a leaflet
	              </a>
	          </li>
	          <li>
	              <a href="{$www_server}/browse.php">
	                  Browse
	              </a>
	          </li>
	          <li>
	              <a href="http://blog.thestraightchoice.org">
	                  Blog
	              </a>
	          </li>
	          <li>
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
            
