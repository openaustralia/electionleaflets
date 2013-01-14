{include file="header.tpl"}

<div class="leftcolumn leaflet">
    <form id="frmUpload" method="post" action="{$form_action}">
        {include file="formvars.tpl"}
        <h1>Add an election</h1>
        <fieldset>
            <ul>
                <li>
                    <label for="txtName">Give the election a name *</label>
                    <input type="text" id="txtName" name="txtName" {if $warn_txtName}class="error"{/if} value="{$data.txtName}"/>
                    <small>e.g. Australian Federal Election 2010</small>
                </li>
                <li>
                    <label for="txtDate">What date is the vote? *</label>
                    <input type="text" id="txtDate" name="txtDate" {if $warn_txtDate}class="error"{/if} value="{$data.txtDate}"/>
                    <small>e.g. 2013-01-15</small>
                </li>
            </ul>
        </fieldset>
        <div class="buttons">
            <input type="submit"  value="Create election"/>
        </div>
    </form>

    <h1>Existing elections</h1>
    <ul>
        {foreach from="$election_details" item="election"}
            <li>{$election->name} - <a href="#">Edit</a></li>
        {/foreach}
    </ul>
</div>

{include file="footer.tpl"}
