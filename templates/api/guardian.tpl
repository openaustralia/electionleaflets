{literal}
    <style>

    	#straightchoice {
    		width:140px;
    		border-top: 10px solid;
    		padding-bottom: 15px;
    		padding-top: 4px;
    		border-top-color: rgb(214, 29, 0);
    		background:white;
    		font-size:12px;
    	}
    	
    	#straightchoice li {
    	    padding-left:0; margin-left:0;
    	    list-style-type:none;
	    }

	
    	#straightchoice .straightchoice_section {
		
    		border-top-style: dotted;
    		border-top-width: 1px;
    		padding: 3px 0px 6px 0px;
    		border-top-color: rgb(153, 153, 153);
		
    	}

    </style>
{/literal}
<div id="straightchoice">
    <h2>Latest campaign material near here</h2>
    <p>
        from
        <br/>
        <a href="http://www.thestraightchoice.org">thestraightchoice.org</a>
    </p>
    <ul class="results">

        {foreach from="$leaflets" item="leaflet"}
            <li {if $is_geo}class="has_distance"{/if} class="straightchoice_section">
                <a class="leaflet" href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">
                    <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/>
                </a>
                <p>
                    <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}"><strong>{$leaflet->party_name}</strong> uploaded {$leaflet->date_uploaded}</a>
                </p>
            </li>
        {/foreach}
    </ul>
    <p class="straightchoice_section">
        <a href="{$www_server}/addupload.php">Help The Straight Choice monitor the campaign by uploading material you receive</a>
    </p>
    <p class="straightchoice_section">
        <a href="{$www_server}/leaflets.php?n={$leaflets[0]->constituency_url_id}">More campaign material from this area</a>
    </p>
</div>