{include file="../header.tpl"}

<div class="contentfull">
    <h1>Add a new party or category</h1>
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
                <li>
                    <label for="txtCategoryName">New Category</label>
                    <input type="text" id="txtCategoryName" name="txtCategoryName" {if $warn_txtCategoryName}class="error"{/if}/>
                    <small>e.g. Zombie Apocalypse Preparedness</small>
                </li>
            </ul>
        </fieldset>
        <div class="buttons">
            <input type="submit"  value="Create election"/>
        </div>
    </form>
</div>

{include file="../footer.tpl"}
