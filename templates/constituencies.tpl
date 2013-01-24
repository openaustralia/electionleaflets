{include file="header.tpl"}
    <div class="contentfull">
        <h1>{$area_names|capitalize}</h1>
        <p>Select from the {$area_names} below, or enter your postcode</p>
        <form method="get" action="{$www_server}/{$area_names}/">
            <label for="txtSearch">Postcode</label>
            <input type="text" id="txtSearch" name="p" />
            <input  type="submit" value="GO" />
            <small>e.g. <a href="{$www_server}/{$area_names}/?p={$example_postcode}">{$example_postcode}</a></small>
        </form>
        <div class="section">
            <ul>
                {foreach from="$constituencies" item="constituency"}
                    <li>
                        <a href="{$www_server}/{$area_names}/{$constituency->url_id}/">{$constituency->name}</a>
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
    
{include file="footer.tpl"}
