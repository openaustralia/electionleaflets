{php}header("Content-Type: text/csv");{/php}
id,published_by,title,description,date_uploaded,image_url
{if $has_leaflets}
{foreach from="$leaflets" item="leaflet"}
{$leaflet->leaflet_id},"{$leaflet->party_name}","{$leaflet->title}","{$leaflet->description}",{$leaflet->date_uploaded|date_format:"%Y-%m-%d"},{image_url id=$leaflet->leaflet_image_image_key size=t}
{/foreach}
{/if}
