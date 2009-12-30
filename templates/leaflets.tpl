{include file="header.tpl"}

    <div id="divResults" class="contentfull">
        {if $has_party || $has_category || $has_tag || $has_party_attack || $has_constituency}
            <h1>{$heading[0]} <em>{$heading[1]}</em></h1>
        {else}
            <div class="searchbox">
                <form method="get" action="{$www_server}/leaflets.php">
                <label for="txtSearch">Results {if $is_geo}near{else}for{/if}</label>
                <input type="text" id="txtSearch" name="q" value="{$user_term}"/>
                <input type="submit" value="GO" />
                <br/>
            </div>   
        {/if}
        <a href="{$rss_link}">
            <img id="imgRSS" src="{$www_server}/images/rss.png" alt="rss" title="Subscribe to RSS feed for '{$page_title}'"/>
        </a>
        {if $has_party || $has_category || $has_party_attack || $has_constituency}
            <p class="email_alert">
                {if $has_party}
                    <a href="{$alert_link}">Email alerts for new leaflets from the {$heading[1]}</a>
                {/if}
                {if $has_category}
                    <a href="{$alert_link}">Email alerts for new leaflets about {$heading[1]}</a>
                {/if}
                {if $has_party_attack}
                    <a href="{$alert_link}">Email alerts for new leaflets attacking the {$heading[1]}</a>
                {/if}
                {if $has_constituency}
                    <a href="{$alert_link}">Email alerts for new leaflets in {$heading[1]}</a>
                {/if}
            </p>
        {/if}
        {if $has_leaflets}
            <ul class="results">
                {foreach from="$leaflets" item="leaflet"}
                    <li {if $is_geo}class="has_distance"{/if}>
                        <a class="leaflet" href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">
                            <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/>
                        </a>
                        <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">{$leaflet->title}</a>
                        {if $is_geo}
                            <span class="distance">
                                {if $leaflet->distance < 0.5 || $leaflet->distance == 0}
            						Less than 500 m away
            					{elseif	$leaflet->distance < 1}
            						About 1 km away
            					{else}
            						About {$leaflet->distance|string_format:"%d"} km away
            					{/if}
    					    </span>
        				{/if}
                    </li>
                {/foreach}
            </ul>
        {else}
            <h3>Sorry, we couldn't find any leaflets for you</h3>
            <p>You can subscribe to email alerts or an RSS feed at the top of this page to be notified when we do.</p>
        {/if}
    </div>
    
{include file="footer.tpl"}