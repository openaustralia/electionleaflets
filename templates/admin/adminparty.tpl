{include file="../header.tpl"}

<div class="contentfull">
    <h1>Add a new party</h1>
    <p><a href="/admin">« Admin home</a></p>

    <form method="post" action="{$form_action}">
        {include file="../formvars.tpl"}
        <fieldset>
            <ul>
                <li>
                    <label for="txtPartyName">New Party</label>
                    <input type="text" id="txtPartyName" name="txtPartyName" {if $warn_txtPartyName}class="error"{/if}/>
                    <small>e.g. Australian Labor Party (ALP)</small>
                </li>
            </ul>
        </fieldset>
        <div class="buttons">
            <input type="submit"  value="Add party"/>
        </div>
    </form>

    <h4>Existing Parties</h4>
    <ul>
        {foreach from="$parties" item="party"}
            <li>{$party->name}</li>
        {/foreach}
    </ul>
</div>

{include file="../footer.tpl"}
