{include file="header.tpl"}

<div class="contentfull">

        <h1>General Election 2010 Not-Spots</h1>
        <p>Volunteers from all over the country have uploaded nearly 4,000 leaflets to {$site_name}, <strong>but we don't have any leaflets at all for the {$area_names} listed below</strong>. They are, for the most part, <em>very</em> safe seats, could there be a connection?
        </p>
<embed id=VideoPlayback src=http://video.google.com/googleplayer.swf?docid=-9156604322837849461&hl=en&fs=true style=width:400px;height:326px allowFullScreen=true allowScriptAccess=always type=application/x-shockwave-flash> </embed>
        <p>Help us track down leaflets for these {$area_names}!</p>
        <hr/>
        <ul>
            {foreach from="$not_spots" item="constituency"}
                <li><a href="{$www_server}/{$area_names}/{$constituency->url_id}/">{$constituency->name}</a></li>
            {/foreach}
        </ul>

</div>
{include file="footer.tpl"}
