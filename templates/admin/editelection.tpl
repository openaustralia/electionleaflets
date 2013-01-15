{include file="../header.tpl"}

<div class="contentfull align-left">
    <h1>Edit the {$election_details->name}</h1>
    <p><a href="/admin">« Admin home</a></p>

    <form id="frmUpload" method="post" action="{$form_action}">
        {include file="../formvars.tpl"}
        <fieldset>
            <ul>
                <li>
                    <label for="txtName">Election Name *</label>
                    <input type="text" id="txtName" name="txtName" {if $warn_txtName}class="error"{/if} value="{$election_details->name}"/>
                </li>
            </ul>
        </fieldset>
        <div class="buttons">
            <input type="submit"  value="Update election"/>
        </div>
    </form>
</div>

{include file="../footer.tpl"}
