{include file="../header.tpl"}

<div class="contentfull align-left">
    <h1>Elections</h1>
    <form id="frmUpload" method="post" action="{$form_action}">
        {include file="../formvars.tpl"}
        <h4>Add an election</h4>
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

    <h4>Existing elections</h4>
    <ul>
        {foreach from="$election_details" item="election"}
            <li>{$election->name} - <a href="edit_election.php?id={$election->election_id}">Edit</a></li>
        {/foreach}
    </ul>

    <h1>New Parties and Categories</h1>
    <ul>
        <li><a href="new_party.php">Add Party</a></li>
        <li><a href="new_category.php">Add Category</a></li>
    </ul>
</div>

{include file="../footer.tpl"}
