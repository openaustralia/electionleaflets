{include file="header.tpl"}

    <div class="contentleft">
        <h1>{$leaflet->title}</h1>
        <p>{$leaflet->description}</p>
        <p>Published by <a href="{$www_server}/leaflets.php?p={$leaflet->party_party_id}">{$leaflet->party_name}</a></p>

        <h4>Categories</h4>
        <ul>
            {foreach from="$leaflet_categories" item="leaflet_category"}
                <li><a href="{$www_server}/leaflets.php?c={$leaflet_category->category_id}">{$leaflet_category->name}</a></li>
            {/foreach}            
        </ul>
        
        <h4>Tags</h4>
        <ul>
            {foreach from="$leaflet_tags" item="leaflet_tag"}
                <li><a href="{$www_server}/leaflets.php?t={$leaflet_tag->tag}">{$leaflet_tag->tag}</a></li>
            {/foreach}
        </ul>
        
        <h4>Parties attacked</h4>
        <ul>
            {foreach from="$leaflet_parties_attacked" item="leaflet_party_attack"}
                <li><a href="{$www_server}/leaflets.php?a={$leaflet_party_attack->party_id}">{$leaflet_party_attack->name}</a></li>
            {/foreach}            
        </ul>

        <h4>Location</h4>
        <div id="divSpotMap"></div>
    </div>    

    <div class="contentright">
        <ul>
            {foreach from="$leaflet_images" item="leaflet_image"}
                <li>
                    <a href="{$www_server}/full.php?q={$leaflet->leaflet_id}#l{$leaflet_image->leaflet_image_id}">
                        <img src="{$leaflet_image->medium_url()}" />
                    </a>
                    <br/>
                    <small>
                        <a href="{$www_server}/full.php?q={$leaflet->leaflet_id}#l{$leaflet_image->leaflet_image_id}">
                            view larger image
                        </a>
                    </small>
                </li>
            {/foreach}
        </ul>
    </div>

{include file="footer.tpl"}