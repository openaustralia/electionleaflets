{include file="header.tpl"}

    <div class="contentleft">
        <h1>{$leaflet->title}</h1>
        <p>{$leaflet->description}</p>
        <p>Published by <a href="#">{$leaflet->party_name}</a></p>
        
        <h4>Categories</h4>
        <ul>
            {foreach from="$leaflet_categories" item="leaflet_category"}
                <li><a href="#">{$leaflet_category->name}</a></li>
            {/foreach}            
        </ul>
        
        <h4>Tags</h4>
        <ul>
            {foreach from="$leaflet_tags" item="leaflet_tag"}
                <li><a href="#">{$leaflet_tag->tag}</a></li>
            {/foreach}
        </ul>
        
        <h4>Parties attacked</h4>
        <ul>
            {foreach from="$leaflet_parties_attacked" item="leaflet_party_attack"}
                <li><a href="#">{$leaflet_party_attack->name}</a></li>
            {/foreach}            
        </ul>

        <h4>Location</h4>
        <div id="divSpotMap"></div>
    </div>    

    <div class="contentright">
        <ul>
            {foreach from="$leaflet_images" item="leaflet_image"}
                <li><img src="{$leaflet_image->medium_url()}" /></li>
            {/foreach}
        </ul>
    </div>

{include file="footer.tpl"}