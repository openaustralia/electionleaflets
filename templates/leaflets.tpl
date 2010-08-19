{include file="header.tpl"}
    {if $has_leaflets}
        <div class="contentfull align-left">
            {if $has_party || $has_category || $has_tag || $has_party_attack || $has_constituency}
                <h1>{$heading[0]} <em>{$heading[1]}</em></h1>
                {if $has_leaflets}
                    <p class="page_count">
                        <strong>{$total_count}</strong> leaflets found, page <strong>{$current_page_number}</strong> of <strong>{$total_pages}</strong>
                    </p>
                {/if}
            {else}
                <h1>Latest leaflets</h1>
            {/if}
        </div>
    {/if}
    <div id="divResults"  {if $has_leaflets}class="contentcolleft"{else}class="contentfull"{/if}>    
        {if $has_leaflets}
            <ul class="results">
                {foreach from="$leaflets" item="leaflet"}
                    <li {if $is_geo}class="has_distance"{/if}>
                        <a class="leaflet" href="{$www_server}/leaflets/{$leaflet->leaflet_id}/">
							<img src="{image_url id=$leaflet->leaflet_image_image_key size=t}">
                            <!-- <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/> -->
                        </a>
                        <small>
	                        <a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/">{$leaflet->title}</a>
	                    </small>
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
            {if $show_pagination}
                <ul class="pagination">
                    {foreach from="$pagination" item="page"}
                        <li{if $page.current}class="current"{/if}>
                            <a href="{$current_url}?page={$page.number}">
                                {$page.number}
                            </a>
                        </li>
                    {/foreach}
                </ul>
            {/if}
        {else}
            {if $has_constituency}
                <div class="attention">
                    We don't have any leaflets for <strong>{$heading[1]}</strong>. This could mean that the parties are ignoring this electorate or not sending out many leaflets because they think it is a forgone conclusion.
                    <p>
                    If you know differently please  <a href="{$www_server}/addupload">add a leaflet now</a>
                </p>
            </div>
            {else}  
                <h4>Sorry, we couldn't find any leaflets for you</h4>
            {/if}
        {/if}
    </div>
    {if $has_leaflets}
        <div class="contentcolright">
            {* iframe  *}
            {if $has_party || $has_category || $has_party_attack || $has_constituency}
                <div class="infobox">
	                <a href="{$alert_link}">
	                    <img src="{$www_server}/images/email.png" alt="rss" title="Subscribe to email alerts for '{$page_title}'"/>
	                </a>
                    {if $has_party}
                        <a href="{$alert_link}">Email alerts for new leaflets from the {$heading[1]}</a>
                    {elseif $has_category}
                        <a href="{$alert_link}">Email alerts for new leaflets about {$heading[1]}</a>
                    {elseif $has_party_attack}
                        <a href="{$alert_link}">Email alerts for new leaflets attacking the {$heading[1]}</a>
                    {elseif $has_constituency and $has_leaflets}
                        <a href="{$alert_link}">Email alerts for new leaflets in {$heading[1]}</a>
                    {/if}
                </div>
            {/if}
            {if $has_party}
                {if $leaflets[0]->party_twitter_account}
                    <div class="infobox">          
                        <a href="http://twitter.com/{$leaflets[0]->party_twitter_account}">
                            <img src="{$www_server}/images/twitter.png" alt="Twitter" title="Twitter logo"/>
                        </a>
                        <a href="http://twitter.com/{$leaflets[0]->party_twitter_account}">
                            Follow {$heading[1]} leaflets on Twitter!
                        </a>
                    </div>
                {/if}
            {/if}
            <div class="infobox">
                <a href="{$rss_link}">
                    <img src="{$www_server}/images/rss.png" alt="rss" title="Subscribe to RSS feed for '{$page_title}'"/>
                </a>
                {if $has_party}
                     <a href="{$rss_link}">Subscribe to an RSS feed for leaflets from the {$heading[1]}</a>
                {elseif $has_category}
                    <a href="{$rss_link}">Subscribe to an RSS feed about {$heading[1]}</a>
                {elseif $has_party_attack}
                    <a href="{$rss_link}">Subscribe to an RSS feed of new leaflets attacking the {$heading[1]}</a>
                {elseif $has_constituency and $has_leaflets}
                    <a href="{$rss_link}">Subscribe to an RSS feed of new leaflets in {$heading[1]}</a>
                {else}
                    <a href="{$rss_link}">Subscribe to an RSS feed of the latest leaflets</a>
                {/if}
            </div>
        
            {if $has_constituency}
                <div class="infobox">            
                    <h4>Add leaflets from {$heading[1]} to your website</h4>
            
                     <textarea rows="5"><iframe src="{$www_server}/api/call.php?method=constituency&output=html&constituency={$leaflets[0]->constituency_url_id}&count=3" style="border:none;height:900px; overflow:hidden;width:160px;"></iframe></textarea>
                    <p>
                        Just copy and paste the code above into your web page.
                    </p>
                </div>                    
            {/if}
            {if $has_party}
                <div class="infobox">            
                    <h4>Add leaflets from <strong>{$heading[1]}</strong> to your website</h4>
        
                     <textarea rows="5"><iframe src="{$www_server}/api/call.php?method=party&output=html&party_id={$leaflets[0]->party_party_id}&count=3" style="border:none;height:900px; overflow:hidden;width:160px;"></iframe></textarea>
                    <p>
                        Just copy and paste the code above into your web page.
                    </p>
                </div>
            {/if}
            <div class="infobox">  
                <h4>Parties</h4>
                <ul class="parties">
                    {foreach from="$parties_counts" item="party"}
                        <li>
                            <a href="{$www_server}/parties/{$party->url_id}">{$party->name}</a> ({$party->count})
                        </li>
                    {/foreach}
                    <li class="more">
                        <a href="{$www_server}/parties">View all parties ...</a>
                    </li>
                </ul>
            </div>
            <div class="infobox">
                <h4>Categories</h4>
                <ul>
                    {foreach from="$categories_counts" item="category"}
                        <li>
                            <a href="{$www_server}/categories/{$category->category_id}/">{$category->name}</a> ({$category->count})
                        </li>
                    {/foreach}
                    <li class="more">
                        <a href="{$www_server}/categories">View all categories ...</a>
                    </li>
                </ul>
            </div>
        </div>    
    {/if}
{include file="footer.tpl"}
