{textformat style='email'}

$leaflet_count {if $leaflet_count == 1}new leaflet has been uploaded{else}new leaflets have been uploaded{/if}:

{$url}

Details:


{foreach from="$leaflets" item="leaflet"}
{$leaflet->title}


{/foreach}
{/textformat}