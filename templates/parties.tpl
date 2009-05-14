{include file="header.tpl"}

    <div class="contentfull">
        <h1>Parties</h1>
        <ul class="parties">
            {foreach from="$parties" item="party"}
                <li>
                    <a href="{$www_server}/leaflets.php?p={$party->party_id}">{$party->name}</a>
                    <small><a href="{$www_server}/leaflets.php?a={$party->party_id}" title="Leaflets attacking {$party->name}">view leaflets attacking this party</a></small>
                </li>
            {/foreach}
        </ul>
    </div>
    
{include file="footer.tpl"}