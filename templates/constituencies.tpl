{include file="header.tpl"}
    <div class="contentfull">
        <h1>Constituencies</h1>
        <p>Select a constituency from the list below, or enter your postcode</p>
        <form method="get" action="{$www_server}/constituencies/">
            <label for="txtSearch">Postcode</label>
            <input type="text" id="txtSearch" name="p" />
            <input  type="submit" value="GO" />
            <small>e.g. <a href="{$www_server}/constituencies?p=sw98jx">SW9 8JX</a></small>
        </form>
        <div class="section">
            <ul>
                {foreach from="$constituencies" item="constituency"}
                    <li>
                        <a href="{$www_server}/constituencies/{$constituency->url_id}/">{$constituency->name}</a>
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
    
{include file="footer.tpl"}