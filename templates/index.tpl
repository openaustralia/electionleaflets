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
                <input type="submit" value ="Add a leaflet delivered to you" />
            </form>
        </p>
        <p>
            <small>All you need to do is take a photo of a leaflet and tell us a bit about it</small>
            <!--
            <br/>
            <small id="smlActivist">(Party activist or candidate? <a href="{$www_server}/about.php#activist">read this</a>)</small>
        -->
            <br/>
            <small id="smlPost">
                <span class="new">New!</span>You can send us leaflets by post too <a href="{$www_server}/about.php#activist">more info ...</a>
            </small>
        </p>
    </div>
     
     
     <div id="divRecentLeaflets">
        <h2>Latest leaflets</h2>
        <span class="highlight">If a leaflet you have received already appears here please still upload it, it helps us figure out where in the country is being targeted, and leaflets may vary locally in small details.</span>
        <div id="divRecentControls">
                <form id="frmHomeSearch" method="get" action="{$www_server}/leaflets.php">
                    <label for="txtSearch">Enter your post code to see leaflets near you</label>
                    <input type="text" id="txtSearch" name="q" />
                    <input type="submit" value="GO" />
                    <small>e.g. <a href="{$www_server}/leaflets.php?q=sw98jx">SW9 8JX</a></small>
                </form>
        </div>
        <ul class="results">
            {foreach from="$leaflets" item="leaflet"}
                <li>
                    <a class="leaflet" href="{$www_Server}/leaflet.php?q={$leaflet->leaflet_id}">
                        <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/>
                    </a>
                    <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}" class="textlink">{$leaflet->title}</a>
                </li>
            {/foreach}
        </ul>
        <p><a href="{$www_server}/browse.php">Browse leaflets by party or category &raquo;</a></p>                        
    </div>
    <br class="clear"/>
</div>
    
{include file="footer.tpl"}