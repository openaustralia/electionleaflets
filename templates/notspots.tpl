{include file="header.tpl"}

<div class="contentfull">

        <h2>Campaign not-spots</h2>
        <ul>
            {foreach from="$not_spots" item="constituency"}
                <li><a href="{$www_server}/leaflets.php?n={$constituency->url_id}">{$constituency->name}</a></li>
            {/foreach}
        </ul>

</div>
{include file="footer.tpl"}