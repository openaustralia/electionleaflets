{include file="header.tpl"}

<div id="divContentFull">
    <div class="leftcolumn">
    <div id="divWelcome">
    	<h3>Make a difference</h3>
    	<h3 class="light">before you vote</h3>
        <p>
            Election leaflets are one of the main weapons in the fight 
for votes in Australia.
        </p>
        <p>
            They are targeted, effective and sometimes very bitter. 
        </p>
        <p>
            We need <strong>your help</strong> to photograph and map them so we can keep 
an eye on what the parties are up to, and try to keep them honest.
        </p><br/>
        <p id="pCount">
            <strong>{$leaflet_count}</strong> leaflets added so far!
        </p>
    </div>
    </div>
    <div class="rightcolumn">
    <div id="calltoactions">
    <div class="divider"><img class="left" width="110" height="42" src="/images/crease_line_left.png"/><img class="middle" width="75" height="42" src="/images/crease_line_middle.png"/><img class="right" width="75" height="42" src="/images/crease_line_right.png"/></div>
	    <div id="divFrontLookup">
			<h4>View leaflets in your area</h4>
	         <form method="get" action="{$www_server}/{$area_names}/">
	             <input id="txtSearch" name="p" value="Enter postcode" type="text" onfocus="value=''"><input type="image" src="{$www_server}/images/search_button.png" class="button" value="GO" type="submit">                    
	         </form>
	     </div>
	     
	     <div id="divAction">
	     	<h4>Add a leaflet</h4>
	        <div class="add upload" onclick="window.location = '{$www_server}/addupload';">
	            <span class="add-title"><a href="{$www_server}/addupload">Upload them online now</span>
	            <p>(Photograph or scan them first)</a></p>
	        </div>
	        <div class="add email" onclick="window.location = 'mailto:{$leaflets_email}';">
	            <span class="add-title"><a href="mailto:{$leaflets_email}">Email them straight from your phone</a></span>
	            <p><a href="mailto:{$leaflets_email}">{$leaflets_email}</a></p>
	        </div>
	        <div class="add post">
	            <span class="add-title">Post them to us via snail mail</span>
	            <p>OpenAustralia, PO Box 1234, Sydney NSW 2000</p>
	        </div>
	     </div>
     </div>
     </div>
     <br class="clear">
     <div id="divRecentLeaflets">
        <h4>Latest leaflets</h4><span class="orange-divider"> | </span><h4><a class="browse-leaflets" href="{$www_server}/browse">Browse leaflets</a></h4>
        <div id="divScroller"> {* TODO: update this div from Jack's work *}
            <a id="btnPrevious" href="#"><img src="{$www_server}/images/arrow_left.png" alt="Previous"/></a>
            <a id="btnNext" href="#"><img src="{$www_server}/images/arrow_right.png" alt="Next"/></a>            
            <ul class="results">
                {foreach from="$leaflets" item="leaflet"}
                    <li>
                        <a class="leaflet" href="{$www_Server}/leaflets/{$leaflet->leaflet_id}/">
							<img src="{image_url id=$leaflet->leaflet_image_image_key size=s}">
                            <!-- <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=s"/> -->
                        </a>
                        {*<a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/" class="textlink">{$leaflet->title}</a>*}
                    </li>
                {/foreach}
            </ul>
        </div>
        <p><a href="{$www_server}/browse">Browse leaflets by party or category &raquo;</a></p>
    </div>
    <br class="clear"/>
    
    <div class="stats">
      <h4>View leaflets by...</h4>
        <div>
            <h4>Top parties</h4>
            <ol>
                {foreach from="$total_counts" item="party" name="parties"}
                    <li><a href="{$www_server}/parties/{$party->url_id}/">{$party->name}</a> <span class="count">({$party->count})</span></li>
                {/foreach}
            </ol>
        </div>
        <div>
            <h4>Top {$area_names}</h4>
            <ol>
                {foreach from="$constituency_counts" item="constituency"}
                    <li><a href="{$www_server}/{$area_names}/{$constituency->url_id}/">{$constituency->name}</a> <span class="count">({$constituency->count})</span></li>
                {/foreach}
            </ol>
        </div>
        <div>
            <h4>Campaign not-spots</h4>
            <ul>
                {foreach from="$not_spots" item="constituency"}
                    <li><a href="{$www_server}/{$area_names}/{$constituency->url_id}/">{$constituency->name}</a></li>
                {/foreach}
            </ul>
            <p>
                <a href="{$www_server}/notspots/">View all not-spots</a>
            </p>
        </div>
    </div>
    
</div>

{*
<div class="contenthalf">
    <h2>Leaflets by party</h2>
     <img src="http://chart.apis.google.com/chart?cht=bhs&chd=t:{foreach from="$total_counts" item="party" name="parties"}{$party->count}{if $smarty.foreach.parties.last == false},{/if}{/foreach}&chs=400x125&chco={foreach from="$total_counts" item="party" name="parties"}{$party->colour}{if $smarty.foreach.parties.last == false}|{/if}{/foreach}&chxt=y&chxl=0:{foreach from="$total_counts" item="party" name="parties"}|{$party->name}{/foreach}&chm=N,ffffff,0,-1,11,,c&s:underp&chds=0,50"/>
</div>
 *}  
{include file="footer.tpl"}
