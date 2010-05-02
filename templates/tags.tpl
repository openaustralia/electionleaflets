{include file="header.tpl"}
    <div class="contentfull">
        <h1>Browse election by tag</h1>
        <ul class="tagcloud">
            {foreach from="$weighted_tags" item="weighted_tag"}
                <li class="{if $weighted_tag->count < 1}tg1{elseif $weighted_tag->count < 3}tg2{elseif $weighted_tag->count < 5}tg3{elseif $weighted_tag->count < 10}tg4{elseif $weighted_tag->count < 30}tg5{else}tg6{/if}">
                    <a href="{$www_server}/tags/{$weighted_tag->tag}/">{$weighted_tag->tag}</a>
                </li>
            {/foreach}
        </ul>
    </div>
    
{include file="footer.tpl"}