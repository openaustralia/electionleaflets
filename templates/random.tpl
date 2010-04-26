{include file="header.tpl"}
    <div id="divUserStatus">
        <span><a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/">Link to this leaflet</a></span> <a href="{$www_server}/random/">Show me another!</a>
    </div>

    <div id="divFullImage" class="contentfull">
        <ul class="random">
            {foreach from="$leaflet_images" item="leaflet_image"}
                <li id="l{$leaflet_image->leaflet_image_id}"><img src="{$leaflet_image->medium_url()}" /></li>
            {/foreach}
        </ul>
    </div>
    
    <div id="divUserStatus">
        <span><a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/">Link to this leaflet</a></span> <a href="{$www_server}/random/">Show me another!</a>
    </div>    
{include file="footer.tpl"}