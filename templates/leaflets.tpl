{include file="header.tpl"}

    <div id="divResults" class="contentfull">
        {if $has_party || $has_category || $has_tag || $has_party_attack}
            <h1>{$heading[0]} <em>{$heading[1]}</em></h1>
        {else}
            <div class="searchbox">
                <form method="get" action="{$www_server}/leaflets.php">
                Results {if $is_geo}near{else}for{/if} <input type="text" id="txtSearch" name="q" value="{$user_term}"/>
                <input type="submit" value="GO" />
                <br/>
            </div>   
        {/if}
        <a href="{$rss_link}">
            <img id="imgRSS" src="{$www_server}/images/rss.png" alt="rss" title="Subscribe to RSS feed for '{$page_title}'"/>
        </a>

        <ul class="results">
            {foreach from="$leaflets" item="leaflet"}
                <li>
                    <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">
                        <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/>
                    </a>
                    <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">{$leaflet->title}</a>
                    {if is_geo}
                        {if $leaflet->distance < 0.5 || $leaflet->distance == 0}
    						Less than 500 m away
    					{elseif	$leaflet->distance < 1}
    						About 1 km away
    					{else}
    						About {$leaflet->distance|string_format:"%d"} km away
    					{/if}
    				{/if}
                </li>
            {/foreach}
        </ul>
    </div>
    
{include file="footer.tpl"}