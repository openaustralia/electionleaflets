{textformat style='email'}

{if $leaflet_count == 1}New leaflet has been uploaded{else}New leaflets have been uploaded{/if}.

{ * Display the url if it's not for specific leaflets * }
{if isset($email_url)}{$email_url}{/if}

Details:


{foreach from="$leaflets" item="leaflet"}
{if !isset($email_url)}{$leaflet_url}{$leaflet->leaflet_id}{/if}


{$leaflet->title}


{/foreach}

Unsubscribe, or change this alert : {$unsub_url}

{/textformat}
