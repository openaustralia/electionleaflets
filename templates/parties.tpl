{include file="header.tpl"}

    <div class="contentfull align-left">
        <h3>Parties</h3>
        <ul class="parties">
            {foreach from="$parties" item="party"}
                <li>
                    <a href="{$www_server}/parties/{$party->url_id}">{$party->name}</a>
                    <small><a href="{$www_server}/leaflets?a={$party->party_id}" title="Leaflets attacking {$party->name}">view leaflets attacking this party</a></small>
                </li>
            {/foreach}
        </ul>
    </div>
    
{include file="footer.tpl"}
