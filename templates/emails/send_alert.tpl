{textformat style='email'}

{if $leaflet_count == 1}New leaflet has been uploaded{else}New leaflets have been uploaded{/if}.

Details:


{foreach from="$leaflets" item="leaflet"}
{$leaflet->title}


{$url}{$leaflet->leaflet_id}


{/foreach}

Unsubscribe, or change this alert : {$unsub_url}

{/textformat}
