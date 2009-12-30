{include file="../header.tpl"}
{if $done == 'no'}
    <div class="contentfull">
        <h1>Create a new email alert</h1>
        <p>
            Enter your email address to receive email alerts for {$heading[0]} <strong>{$heading[1]}</strong>
        </p>
        <form id="frmAlert" method="post" action="{$form_action}">
            {include file="../formvars.tpl"}
            <ul class="form">
                <li>
                    <label for="txtEmail">Your email address *</label>
                    <input type="text" id="txtEmail" name="txtEmail" {if $warn_txtEmail}class="error"{/if} value="{$data.txtEmail}"/>
                </li>
                <li>
                    <label for="ddlFrequency">How often do you want to receive the alerts? *</label>
                    <select id="ddlFrequency" name="ddlFrequency" {if $warn_ddlDelivered}class="error"{/if}>
                        <option value="1" {if $email_alert->frequency_hours == 1}selected="selected"{/if}>when they are uploaded</option> 
                        <option value="2" {if $email_alert->frequency_hours == 24}selected="selected"{/if}>once a day</option>
                        <option value="3" {if $email_alert->frequency_hours == 72}selected="selected"{/if}>every couple of days</option>                                        
                        <option value="4" {if $email_alert->frequency_hours == 168}selected="selected"{/if}>once a week</option>
                    </select>
                </li>
            </ul>
            <input type="submit" value="Create alert" />
        </form>
    </div>
{else}
    <div class="attention">
        <h1>Now check your email!</h1>
        <p>
            We have sent you an email, <span class="highlight">click on the link in the email</span> to confirm your alert. If you don't get an email in the next few minutes, try checking your spam filter.
        </p>
    </div>
{/if}
{include file="../footer.tpl"}