{textformat style='email'}

{if $leaflet_count == 1}New leaflet has been uploaded{else}New leaflets have been uploaded{/if}:

{$url}

Details:


{foreach from="$leaflets" item="leaflet"}
{$leaflet->title}


{/foreach}
{/textformat}