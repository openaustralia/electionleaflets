{include file="header.tpl"}
    <div class="contentfull">
        <h1>Browse election leaflets</h1>

        <h3>Parties</h3>
        <ul class="parties">
            {foreach from="$parties" item="party"}
                <li>
                    <a href="{$www_server}/leaflets.php?p={$party->party_id}">{$party->name}</a>
                    <small><a href="{$www_server}/leaflets.php?a={$party->party_id}" title="Leaflets attacking {$party->name}">view leaflets attacking this party</a></small>
                </li>
            {/foreach}
                <li class="more">
                    <a href="{$www_server}/parties.php">View all parties ...</a>
                </li>
        </ul>
        <h3>Tags</h3>
        <ul class="tagcloud">
            {foreach from="$weighted_tags" item="weighted_tag"}
                <li class="{if $weighted_tag->count < 10}tg1{elseif $weighted_tag->count < 30}tg2{elseif $weighted_tag->count < 50}tg3{elseif $weighted_tag->count < 75}tg4{elseif $weighted_tag->count < 100}tg5{else}tg6{/if}">
                    <a href="{$www_server}/leaflets.php?t={$weighted_tag->tag}">{$weighted_tag->tag}</a>
                </li>
            {/foreach}
        </ul>

        <h3>Categories</h3>
        <ul>
            {foreach from="$categories" item="category"}
                <li>
                    <a href="{$www_server}/leaflets.php?c={$category->category_id}">{$category->name}</a>
                </li>
            {/foreach}
        </ul>
        
        <h3>Constituencies</h3>
        <ul>
            {foreach from="$constituencies" item="constituency"}
                <li>
                    <a href="{$www_server}/leaflets.php?n={$constituency->url_id}">{$constituency->name}</a>
                </li>
            {/foreach}
        </ul>
    </div>
    
{include file="footer.tpl"}