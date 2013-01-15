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
</div>

{include file="../footer.tpl"}