{include file="../header.tpl"}
    {if $state == 'view'}
        <div class="contentfull">
            <h1>Manage your alert for <em>{$email_alert->title}</em></h1>
        </div>
        <div class="contentleft">
            <h2>Change the frequency of this alert</h2>        
            <form method="post" action="{$form_action}">
                {include file="../formvars.tpl"}
                <input type="hidden" name="action" value="edit"/>            
                <select id="ddlFrequency" name="ddlFrequency" {if $warn_ddlDelivered}class="error"{/if}>
                    <option value="1" {if $email_alert->frequency_hours == 1}selected="selected"{/if}>when they are uploaded</option> 
                    <option value="2" {if $email_alert->frequency_hours == 24}selected="selected"{/if}>once a day</option>
                    <option value="3" {if $email_alert->frequency_hours == 72}selected="selected"{/if}>every couple of days</option>                                        
                    <option value="4" {if $email_alert->frequency_hours == 168}selected="selected"{/if}>once a week</option>
                </select>
                <input type="submit" value="Save changes"/>            
            </form>
        </div>
        <div class="contentright">
            <h2>Delete this alert?</h2>        
            <form method="post" action="{$form_action}">
                {include file="../formvars.tpl"}
                <input type="hidden" name="action" value="delete"/>
                <input type="submit" value="Yes please, delete this alert"/>
            </form>
        </div>
{else}
    {if $state == 'updated'}
    <div class="contentfull attention">
        <h1>Your email alert has been updated</h1>
        <p><a href="{$www_server}">Take me home</a></p>
    </div>
    {/if}
    {if $state == 'deleted'}
        <div class="contentfull attention">
            <h1>Your email alert has been deleted</h1>
            <p><a href="{$www_server}">Take me home</a></p>            
        </div>
    {/if}
{/if}

{include file="../footer.tpl"}