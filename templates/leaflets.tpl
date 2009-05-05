{include file="header.tpl"}

    <div class="contentfull">
        <div class="searchbox">
            <form method="get" action="{$www_server}/leaflets.php">
            Results for <input type="text" id="txtSearch" name="q" value="{$user_term}"/>
            <input type="submit" value="GO" />
            <br/>
            <small>
                Showing results for leaflets {if $search_type == "postcode" || $search_type == "partial postcode"}near {$user_term}{elseif $search_type == "party"}by {$user_term}{else}for{/if}.
        </small>
        </div>
        <ul class="results">
            {foreach from="$leaflets" item="leaflet"}
                <li>
                    <a href="{$www_Server}/leaflet.php?q={$leaflet->leaflet_id}">
                        <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/>
                    </a>
                    <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">{$leaflet->title}</a>
                </li>
            {/foreach}
        </ul>
    </div>
    
{include file="footer.tpl"}