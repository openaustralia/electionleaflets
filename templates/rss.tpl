<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:georss="http://www.georss.org/georss">
	<channel>
		<title>{$page_title} ({$site_name})</title>
		<link>{$search_link}</link>
		<description>{$site_tag_line}</description>
        {foreach name="leaflets" from="$leaflets" item="leaflet"}
            <item>
                <title>{$leaflet->title}</title>
                <pubDate>{$leaflet->date_delivered|date_format:"%a, %e %b %Y"}</pubDate>                
                <guid isPermaLink="true">{$www_server}/leaflet.php?q={$leaflet->leaflet_id}</guid>
                <georss:featurename>{$group->name}</georss:featurename>
                <georss:point>{$leaflet->lat} {$leaflet->lng}</georss:point>                
                <description><![CDATA[{$leaflet->description}<br/><img src="{$www_server}/image.php?i={$leaflet->leaflet_image_image_key}&amp;s=m"/>]]></description>
                <link><![CDATA[{$www_server}/leaflet.php?q={$leaflet->leaflet_id}]]></link>
            </item>
        {/foreach}
    </channel>
</rss>
