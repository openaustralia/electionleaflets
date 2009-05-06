{include file="header.tpl"}

<div id="divContentFull">
    <div id="divWelcome">
        <p id="pCount">
            {$leaflet_count} leaflets added so far!
        </p>
        <h1>
            <span class="hide">{$site_name}</span>
        </h1>
        <h2 class="hide">
            {$site_tag_line}
        </h2>
        <p>
            Election leaflets are one of the main weapons in the fight for votes in the UK.
            <br/>
            They are targeted, effective and sometimes very bitter. We need your help to photograph and map them so we can keep an eye on what the parties are up to, and try to keep them honest.
        </p>
    </div>

    <div class="boxes">
        <div class="box">
            <h3>Search for leaflets near you, or enter a party name or subject</h3>
            <p>Enter a postcode, place, party or keyword</p>
            <form method="get" action="{$www_server}/leaflets.php">
                <input type="text" id="txtSearch" name="q"/>
                <input type="submit" value="GO"/>
                <br/>
                <small>e.g. <a href="{$www_server}/leaflets.php?q=sw98jx">SW9 8JX</a>, <a href="{$www_server}/leaflets.php?q=cambridge">Cambridge</a>, <a href="{$www_server}/leaflets.php?q=Labour+Party">Labour Party</a> or <a href="{$www_server}/leaflets.php?q=crime">Crime</a></small>
            </form>
        </div>
    
        <div class="box">
            <h3>Add a leaflet delivered to you</h3>
            <p>
                All you need to do is take a photo of a leaflet and tell us a bit about it.
            </p>
            <form method="get" action="{$www_server}/addupload.php">
                <input type="submit" value ="Add a leaflet now"/>
            </form>
        </div>
    </div>
    <br class="clear"/>
    
    <h3>Recently uploaded leaflets</h3>
    <ul class="results">
        {foreach from="$leaflets" item="leaflet"}
            <li>
                <a href="{$www_Server}/leaflet.php?q={$leaflet->leaflet_id}">
                    <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/>
                </a>
                <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">{$leaflet->title}</a>
            </li>
        {/foreach}
    </ul>
</div>
    
{include file="footer.tpl"}