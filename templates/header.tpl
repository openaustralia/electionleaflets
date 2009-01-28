<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>{$site_name} | {$page_title}</title>
	<link rel="stylesheet" media="all" type="text/css" href="{$www_server}/css/memespring.css" />		
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

        {* Header *}
        <div id="divHeader">
            <p id="pLogo"><a href="{$www_server}"><span class="hide">{$site_name} - {$site_tag_line}</span></a></p>
		    {* Menu *}
		    <div id="divMenu">
		        <ul id="ulMainMenu" class="collapse">
		          <li {if $menu_item == "search"}class="selected"{/if}>
		              <a href="{$www_server}">
		                  Find a walk
		              </a>
		          </li>
		          <li {if $menu_item == "edit"}class="selected"{/if}>
		              <a href="{$www_server}/edit.php">
		                  Submit a walk
		              </a>
		          </li>
		          <li {if $menu_item == "my"}class="selected"{/if}>
		              <a href="{$www_server}/mywalks.php">
		                  Your walks
		              </a>
		          </li>
		        </ul>
		        <ul id="ulUserMenu" class="inline">
					{if $is_signed_in == false}
		            	<li {if $menu_item =="signup"}class="selected"{/if}><a href="{$www_server}/signin.php">Sign in or create an account</a></li>            
					{else}
						<li>
							Signed in as {$signed_in_user->username}
						</li>
		                <li><a href="{$www_server}/account.php">Settings</a></li>                                     						
					{/if}
					<li>
						{if $is_signed_in == true}
						 	<a href="{$www_server}/signout.php">Sign out</a>
						{/if}
					</li>
		        </ul>
		    </div>
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
            
