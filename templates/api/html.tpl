<head>
    <base href="{$www_server}" />
    <base target="_blank" />
</head>

<body>
{literal}
    <style>

    	#straightchoice {
    		width:140px;
    		padding-bottom: 15px;
    		padding-top: 4px;
    		font-size:12px;
    		font-family:arial, sans-serif;
    	}

    	#straightchoice ul {
    	    padding:0; margin:0;
	    }

    	#straightchoice li {
    	    padding:0 0 10px 0; margin-left:0;
    	    list-style-type:none;
	    }

	
    	#straightchoice .straightchoice_section {
		
    		border-top-width: 1px;
    		padding: 3px 0px 6px 0px;
    		border-top-color: rgb(153, 153, 153);
		
    	}

    </style>
{/literal}
<div id="straightchoice">
    <ul class="results">
        {if $has_leaflets}
            {foreach from="$leaflets" item="leaflet"}
                <li {if $is_geo}class="has_distance"{/if} class="straightchoice_section">
                    <a class="leaflet" href="{$www_server}/leaflets/{$leaflet->leaflet_id}/" target="_top">
						<img src="{image_url id=$leaflet->leaflet_image_image_key size=t}">
                        <!-- <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/> -->
                    </a>
                    <p>
                        {if $method != 'party'}
                            <a href="{$www_server}/parties/{$leaflet->party_url_id}/" target="_top"><strong>{$leaflet->party_name}</strong>
                            </a>
                            uploaded {$leaflet->date_uploaded|date_format:"%A %e %B %Y"}
                        {else}
                            Uploaded {$leaflet->date_uploaded|date_format:"%A %e %B %Y"}
                        {/if}

                    </p>
                </li>
            {/foreach}
        {else}
            <li>
                <a class="leaflet" href="{$www_server}" target="_top">
                    <img src="{$www_server}/images/country.jpg"/>
                </a>
            </li>
        {/if}
    </ul>
    <p class="straightchoice_section">
        <a href="{$www_server}/upload.php" target="_top">Help The Straight Choice monitor the campaign by uploading material you receive</a>
    </p>
    {if $has_leaflets}
        <p class="straightchoice_section">
            {if $method == 'constituency'}
                <a href="{$www_server}/{$area_names}/{$leaflets[0]->constituency_url_id}/" target="_top">More campaign material from this area</a>
            {/if}
            {if $method == 'party'}
                <a href="{$www_server}/parties/{$leaflets[0]->party_url_id}/" target="_top">More campaign material for the party</a>
            {/if}
            {if $method == 'latest'}
                <a href="{$www_server}/leaflets/" target="_top">More latest campaign material</a>
            {/if}
        </p>
    {/if}
</div>
</body>
