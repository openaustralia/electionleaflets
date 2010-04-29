{include file="header.tpl"}
    <div id="divUserStatus">
        <span><a href="{$www_server}/leaflets/{$leaflet->leaflet_id}/">link to this leaflet</a></span> Hi {$name}, you have completed <strong>{$user_count}</strong> leaflets. <a href="{$www_server}">Exit</a>
    </div>
    <div id="divFullImage" class="contentfull">
        <ul>
            {foreach from="$leaflet_images" item="leaflet_image"}
                <li id="l{$leaflet_image->leaflet_image_id}"><img src="{$leaflet_image->large_url()}" /></li>
            {/foreach}
        </ul>
    </div>
 <div id="divRateControls">
     <form method="post" action="{$form_action}">
         {include file="formvars.tpl"}
        <div id="divSliders">
            {foreach from="$rate_types" item="rate_type"}
                <div id="divRate_{$rate_type->rate_type_id}" class="rate_item">
                    <span class="label left">{$rate_type->left_label}</span><div class="slider"></div><span class="label right">{$rate_type->right_label}</span>
                </div>
            {/foreach}
        </div>
        <div id="divDodgyClaim">
            <label for="txtInteresting">Anything else interesting about this leaflet? e.g. a claim you can demonstrait to be incorrect or a misleading graph.</label>
            <br/>
            <textarea id="txtInteresting" name="txtInteresting"></textarea>
        </div>
        <div id="divButtons">
            <fieldset>
                <input type="hidden" name="hidLeafletId" value="{$leaflet_id}"/>                
                <input type="hidden" id="hidRateItems" value="{foreach from="$rate_types" item="rate_type"}{$rate_type->rate_type_id},{/foreach}"/>
                {foreach from="$rate_types" item="rate_type"}
                    <input type="hidden" id="hidRateValue_{$rate_type->rate_type_id}" name="hidRateValue_{$rate_type->rate_type_id}" value="50"/>
                {/foreach}
            </fieldset>
            <input type="submit" id="btnSave" value="Save ratings"/>
            <br/>
            <br/>            
            <a href="{$www_server}/rate.php">Skip this leaflet</a>
        </div>
    </form>
 </div>
{include file="footer.tpl"}