{include file="header.tpl"}
    <div id="divUserStatus">
        <span><a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/">View full details</a></span> <strong><a href="{$www_server}/random/">Show me another!</a></strong>
    </div>

    <div id="divFullImage" class="contentfull">
        <ul class="random">
            {foreach from="$leaflet_images" item="leaflet_image"}
                <li id="l{$leaflet_image->leaflet_image_id}"><img src="{$leaflet_image->medium_url()}" /></li>
            {/foreach}
        </ul>
        <br class="clear"/>
    </div>
    
    <div id="divUserStatus">
        <span><a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/">View full details</a></span> <strong><a href="{$www_server}/random/">Show me another!</a></strong>
    </div>    
{include file="footer.tpl"}