{include file="header.tpl"}
    <div id="divUserStatus">
        <span><a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/" target="_new">View full details (new window)</a></span> <strong><a href="{$www_server}/random/">Show me another!</a></strong>
    </div>
    <div class="random_questions">
        <a href="http://spreadsheets.google.com/viewform?formkey=dFhNblRVN1hiXy1iVmhoaWkxNHhGVXc6MQ">Is there a dodgy looking graph on this leaflet?</a>
        &nbsp;&nbsp;
        <a href="http://spreadsheets.google.com/viewform?formkey=dHJhT0NGYzU1dENQdE5sYWZ2MEN0QUE6MQ">Is there a police officer or Nurse on this leaflet?</a>        
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
        <span><a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/"  target="_new">View full details (new window)</a></span> <strong><a href="{$www_server}/random/">Show me another!</a></strong>
    </div>    
{include file="footer.tpl"}