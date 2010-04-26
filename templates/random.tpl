{include file="header.tpl"}
    <div id="divUserStatus">
        <span><a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/" target="_new">View full details <small>(new window)</small></a></span> <strong><a href="{$www_server}/random/">Show me another!</a></strong>
    </div>
    <div class="random_questions">
        <a href="http://spreadsheets.google.com/viewform?formkey=dFhNblRVN1hiXy1iVmhoaWkxNHhGVXc6MQ&entry_0={$www_server}/leaflets/{$leaflet->leaflet_id}/" target="_new">Is there a dodgy looking graph on this leaflet? <small>(new window)</small></a>
        &nbsp;&nbsp;
        <a href="http://spreadsheets.google.com/viewform?formkey=dHJhT0NGYzU1dENQdE5sYWZ2MEN0QUE6MQ&entry_0={$www_server}/leaflets/{$leaflet->leaflet_id}/"  target="_new">Is there a Police Officer or Nurse on this leaflet? <small>(new window)</small></a>        
    </div>
    <div id="divFullImage" class="contentfull">
        <ul class="random">
            {foreach from="$leaflet_images" item="leaflet_image"}
                <li id="l{$leaflet_image->leaflet_image_id}"><img src="{$leaflet_image->medium_url()}" /></li>
            {/foreach}
        </ul>
        <br class="clear"/>
    </div>
    
    <div id="divUserStatus">
        <span><a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/"  target="_new">View full details <small>(new window)</small></a></span> <strong><a href="{$www_server}/random/">Show me another!</a></strong>
    </div>    
{include file="footer.tpl"}