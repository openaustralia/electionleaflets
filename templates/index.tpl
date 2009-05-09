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
        <p>
            <form method="get" action="{$www_server}/addupload.php">
                <input type="submit" value ="Add a leaflet delivered to you"/>
            </form>
        </p>
        <p>
            <small>(All you need to do is take a photo of a leaflet and tell us a bit about it)</small>
        </p>
    </div>
     
     <div id="divRecentLeaflets">
        <h3>Recently uploaded leaflets</h3>
        <div id="divRecentControls">
                <form id="frmHomeSearch" method="get" action="{$www_server}/leaflets.php">
                    <label for="txtSearch">Enter a post code to see leaflets near you</label>
                    <input type="text" id="txtSearch" name="q"/>
                    <input type="submit" value="GO"/>
                    <small>e.g. <a href="{$www_server}/leaflets.php?q=sw98jx">SW9 8JX</a></small>
                </form>
        </div>
        <ul class="results">
            {foreach from="$leaflets" item="leaflet"}
                <li>
                    <a href="{$www_Server}/leaflet.php?q={$leaflet->leaflet_id}">
                        <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/>
                    </a>
                    <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}" class="textlink">{$leaflet->title}</a>
                </li>
            {/foreach}
        </ul>
        <br class="clear"/>
        <p><a href="{$www_server}/browse.php">browse leaflets by party or category &raquo;</a></p>                        
    </div>
    <br class="clear"/>
</div>
    
{include file="footer.tpl"}