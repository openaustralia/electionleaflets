{include file="header.tpl"}

<div id="divContentFull">
    <div id="divWelcome">
        <p>
            Election leaflets are one of the main weapons in the fight for votes in the UK.
        </p>
        <p>
            They are targeted, effective and sometimes very bitter. 
        </p>
        <p>
            We need your help to photograph and map them so we can keep an eye on what the parties are up to, and try to keep them honest.
        </p>
        <p id="pCount">
            {$leaflet_count} leaflets added so far!
        </p>
    </div>
     <div id="divAction">
        <div>
            <h3>1) Photograph any leaflets you receive</h3>
            <p>
                Take a photograph of the leaflet with your phone or camera, or scan it if you have access to a scanner.
            </p>
        </div>
        <div>
            <h3>2) Send them to us</h3>
            <p>
            Email them to <a href="mailto:leaflets@thestraightchoice.org">leaflets@thestraightchoice.org</a> and follow the instructions we send you, or just <a href="{$www_server}/addupload.php">upload them directly</a>.
            </p>
        </div>
     </div>
     <br class="clear"/>
     <div id="divRecentLeaflets">
        <h2>Latest leaflets</h2>
        <div id="divRecentControls">
                <form id="frmHomeSearch" method="get" action="{$www_server}/leaflets.php">
                    <label for="txtSearch">Enter your post code to see leaflets near you</label>
                    <input type="text" id="txtSearch" name="q" />
                    <input type="submit" value="GO" />
                    <small>e.g. <a href="{$www_server}/leaflets.php?q=sw98jx">SW9 8JX</a></small>
                </form>
        </div>

        <div id="divScroller">
            <a id="btnPrevious" href="#"><img src="{$www_server}/images/arrow_left.png" alt="Previous"/></a>
            <a id="btnNext" href="#"><img src="{$www_server}/images/arrow_right.png" alt="Next"/></a>            
            <ul class="results">
                {foreach from="$leaflets" item="leaflet"}
                    <li>
                        <a class="leaflet" href="{$www_Server}/leaflet.php?q={$leaflet->leaflet_id}">
                            <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=s"/>
                        </a>
                        {*<a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}" class="textlink">{$leaflet->title}</a>*}
                    </li>
                {/foreach}
            </ul>
        </div>
        <p><a href="{$www_server}/browse.php">Browse leaflets by party or category &raquo;</a></p>                        
    </div>
    <br class="clear"/>
</div>
<h2>Top parties</h2>
<ol>
    {foreach from="$total_counts" item="party" name="parties"}
        <li><a href="{$www_server}/leaflets.php?p={$party->party_id}">{$party->name}</a> {$party->count} leaflets</li>
    {/foreach}
</ol>
{*
<div class="contenthalf">
    <h2>Leaflets by party</h2>
     <img src="http://chart.apis.google.com/chart?cht=bhs&chd=t:{foreach from="$total_counts" item="party" name="parties"}{$party->count}{if $smarty.foreach.parties.last == false},{/if}{/foreach}&chs=400x125&chco={foreach from="$total_counts" item="party" name="parties"}{$party->colour}{if $smarty.foreach.parties.last == false}|{/if}{/foreach}&chxt=y&chxl=0:{foreach from="$total_counts" item="party" name="parties"}|{$party->name}{/foreach}&chm=N,ffffff,0,-1,11,,c&s:underp&chds=0,50"/>
</div>
 *}  
{include file="footer.tpl"}