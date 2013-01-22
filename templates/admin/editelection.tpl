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
                <li>
                    <label for="txtDate">What date is the vote? *</label>
                    <input type="text" id="txtDate" name="txtDate" {if $warn_txtDate}class="error"{/if} value="{$election_details->vote_date}"/>
                    <small>e.g. 2013-01-15</small>
                </li>
                <li>
                    <label for="chkEnabled">Is this election live? *</label>
                    <input type="checkbox" id="chkEnabled" name="chkEnabled" {if $warn_chkEnabled}class="error"{/if} value="1" {if $election_details->enabled == 1}checked="checked"{/if}/>
                </li>
                <li>
                    <label>Parties registered for this election</label>
                    <ul class="scroll">
                        {foreach from="$parties" item="party"}
                            {assign var="checked" value=false}
                            {foreach from="$selected_party_ids" item="selected_party_id"}
                                {if $party->party_id == $selected_party_id->party_id}
                                    {assign var="checked" value=true}
                                {/if}
                            {/foreach}
                            <li>
                                <input type="checkbox" id="chkParty_{$party->party_id}" name="chkParty_{$party->party_id}" value="{$party->party_id}" {if $checked == true}checked="checked"{/if}/>
                                <label for="chkParty_{$party->party_id}">{$party->name}</label>
                            </li>
                        {/foreach}
                    </ul>
                </li>
                <li>
                    <label>Categories to display for this election</label>
                    <ul class="scroll">
                        {foreach from="$categories" item="category"}
                            {assign var="checked" value=false}
                            {foreach from="$selected_category_ids" item="selected_category_id"}
                                {if $category->category_id == $selected_category_id->category_id}
                                    {assign var="checked" value=true}
                                {/if}
                            {/foreach}
                            <li>
                                <input type="checkbox" id="chkCategory_{$category->category_id}" name="chkCategory_{$category->category_id}" value="{$category->category_id}" {if $checked == true}checked="checked"{/if}/>
                                <label for="chkCategory_{$category->category_id}">{$category->name}</label>
                            </li>
                        {/foreach}
                    </ul>
                </li>
            </ul>
        </fieldset>
        <div class="buttons">
            <input type="submit"  value="Update election"/>
        </div>
    </form>

    <h4>Constituencies</h4>
    <ul>
        <li>
            <a href="adminconstituencies.php?election_id={$election_details->election_id}">
                Constituencies bulk edit
            </a>
        </li>
        <li>
            <a href="adminpostcodes.php?election_id={$election_details->election_id}">
                Postcode mapping bulk edit
            </a>
        </li>
    </ul>
</div>

{include file="../footer.tpl"}
