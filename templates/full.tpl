{include file="header.tpl"}

    <div id="divFullImage" class="contentfull">
        <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">&larr; back to details of <em>'{$leaflet->title}'</em></a>
        <ul>
            {foreach from="$leaflet_images" item="leaflet_image"}
                <li id="l{$leaflet_image->leaflet_image_id}"><img src="{$leaflet_image->large_url()}" /></li>
            {/foreach}
        </ul>
        <a href="#">&larr; back to details of <em>{$leaflet->title}</em></a>
    </div>
 
{include file="footer.tpl"}