{include file="header.tpl"}

<div id="divContentFull">
	{literal}
    <script type="text/javascript">
        <!-- For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. --> 
        var swfVersionStr = "10.0.0";
        <!-- To use express install, set to playerProductInstall.swf, otherwise the empty string. -->
        var xiSwfUrlStr = "http://zoom.thestraightchoice.org/playerProductInstall.swf";
        var flashvars = {source: 'http://zoom.thestraightchoice.org/Leaders_img/ImageProperties.xml', logo: 'hide'};
        var params = {};
        params.quality = "high";
        params.bgcolor = "#000000";
        params.allowscriptaccess = "always";
        params.allowfullscreen = "true";
        var attributes = {};
        attributes.id = "StraightChoiceViewer";
        attributes.name = "StraightChoiceViewer";
        attributes.align = "middle";
        swfobject.embedSWF(
            "http://thestraightchoicezoom.s3.amazonaws.com/StraightChoiceViewer.swf", "flashContent", 
            "100%", "300px", 
            swfVersionStr, xiSwfUrlStr, 
            flashvars, params, attributes);
		<!-- JavaScript enabled so display the flashContent div in case it is not replaced with a swf object. -->
		swfobject.createCSS("#flashContent", "display:block;text-align:left;");
    </script>
	{/literal}
    <div id="flashContent" style="display:none">
    </div>


         <div id="divFrontLookup">
             <form method="get" action="{$www_server}/constituencies/">
                 <label for="txtSearch">Enter your postcode to see leaflets near you</label>
                 <input type="text" id="txtSearch" name="p" />
                 <label for="ddlConstituency">or choose a constituency</label>                    
                 <select id="ddlConstituency" name="c">
                     <option></option>
                     {foreach from="$constituencies" item="constituency"}
                         <option value="{$constituency->url_id}">{$constituency->name}</option>
                     {/foreach}
                 </select>
                 <input  class="button" type="submit" value="GO" />                    
             </form>
         </div>
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
            Email them to <a href="mailto:{$leaflets_email}">{$leaflets_email}</a> and follow the instructions we send you, or just <a href="{$www_server}/addupload">upload them directly</a>.
            <br/><strong>(One leaflet at a time please).</strong>
            </p>
        </div>
     </div>
     <br class="clear"/>
     <div id="divRecentLeaflets">
        <h2>Latest leaflets</h2>
        <div id="divScroller">
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
        <div>
            <h2>Top parties</h2>
            <ol>
                {foreach from="$total_counts" item="party" name="parties"}
                    <li><a href="{$www_server}/parties/{$party->url_id}/">{$party->name}</a> {$party->count} leaflets</li>
                {/foreach}
            </ol>
        </div>
        <div>
            <h2>Top constituencies</h2>
            <ol>
                {foreach from="$constituency_counts" item="constituency"}
                    <li><a href="{$www_server}/constituencies/{$constituency->url_id}/">{$constituency->name}</a> {$constituency->count} leaflets</li>
                {/foreach}
            </ol>
        </div>
        <div>
            <h2>Campaign not-spots</h2>
            <ul>
                {foreach from="$not_spots" item="constituency"}
                    <li><a href="{$www_server}/constituencies/{$constituency->url_id}/">{$constituency->name}</a></li>
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
