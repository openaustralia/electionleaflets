<h2>Latest campaign material near here</h2>
<p>
    from
    <br/>
    <a href="http://www.thestraightchoice.org">thestraightchoice.org</a>
</p>
<ul class="results">

    {foreach from="$leaflets" item="leaflet"}
        <li {if $is_geo}class="has_distance"{/if}>
            <a class="leaflet" href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">
                <img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=t"/>
            </a>
            <p>
                <a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}"><strong>{$leaflet->party_name}</strong> uploaded {$leaflet->date_uploaded}</a>
            </p>
        </li>
    {/foreach}
</ul>
<p>
    <a href="{$www_server}/addupload.php">Help The Straight Choice monitor the campaign by uploading material you receive</a>
</p>
<p>
    <a href="{$www_server}/leaflets.php?n={$leaflets[0]->constituency_url_id}">More campaign material from this area</a>
</p>
