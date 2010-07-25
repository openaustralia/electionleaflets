{include file="header.tpl"}

    <div id="divFullImage" class="contentfull{if $is_full_view == true} align-center{/if}">
    	<h3>{$leaflet->title}</h3>
    	<small class="back">
	        &larr;<a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/"> back to leaftlet details</a>
	    </small>
        <ul>
            {foreach from="$leaflet_images" item="leaflet_image"}
                <li id="l{$leaflet_image->leaflet_image_id}"><img src="{$leaflet_image->large_url()}" /></li>   
            {/foreach}
        </ul>
    	<small class="back">
	        &larr;<a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/"> back to leaftlet details</a>
	    </small>
    </div>
 
{include file="footer.tpl"}