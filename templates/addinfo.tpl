{include file="header.tpl"}

<div id="divContentFull">
    <form id="frmUpload" method="post" action="{$form_action}">
        {include file="formvars.tpl"}
        <h1>Add a leaflet (step 2 of 2)</h1>
        <p>
            Add some more information about this leaflet
        </p>
        <fieldset>
            <ul>
                <li>
                    <label for="txtPostcode">Enter the postcode the leaflet was delivered to *</label>
                    <input type="text" id="txtPostcode" name="txtPostcode" {if $warn_txtPostcode}class="error"{/if} value="{$data.txtPostcode}"/>
                    <small>this will let us work out which constituency the leaflet covers</small>
                </li>
                <li>
                    <label for="txtTitle">Give the leaflet a title *</label>
                    <input type="text" id="txtTitle" name="txtTitle" {if $warn_txtTitle}class="error"{/if} value="{$data.txtTitle}"/>
                    <small>e.g. the main headline</small>
                </li>
                <li>
                    <label for="txtDescription">Enter a brief, impartial description of issues covered in the leaflet</label>
                    <textarea type="text" id="txtDescription" name="txtDescription" {if $warn_txtDescription}class="error"{/if} cols="70" rows="5">{$data.txtDescription}</textarea>
                    <br/>
                    <small>e.g. "Free swimming in Cambridge, cutting police numbers and council tax"</small>
                </li>
                <li>
                    <label for="ddlPartyBy">Which party is responsible for the leaflet? *</label>
                    <select id="ddlPartyBy" name="ddlPartyBy" {if $warn_ddlPartyBy}class="error"{/if}>
                        <option></option>
						{section name="party" loop="$parties"}
							<option value="{$parties[party]->party_id}" {if $parties[party]->party_id == $data.ddlPartyBy}selected="selected"{/if}>
								{$parties[party]->name}
							</option>
							{if $parties[party]->major == 1 && $parties[party.index_next]->major !=1}
							    <option>-------------------</option>
							{/if}
						{/section}
                    </select>
                </li>
                <li>
                    <label>Which parties (if any) does the leaflet attack or criticise?</label>
                    <ul class="scroll">
						{section name="party" loop="$parties"}
    						{assign var="checked" value=false}
                            {foreach from="$selected_party_attack_ids" item="selected_party_attack_id"}
                                {if $parties[party]->party_id == $selected_party_attack_id}
                                    {assign var="checked" value=true}
                                {/if}
                            {/foreach}
                            <li {if $parties[party]->major == 1 && $parties[party.index_next]->major !=1} class="divider" {/if}>
                                <input type="checkbox" id="chkPartyAttack_{$parties[party]->party_id}" name="chkPartyAttack_{$parties[party]->party_id}" value="{$parties[party]->party_id}" {if $checked == true}checked="checked"{/if}/>
                                <label for="chkPartyAttack_{$parties[party]->party_id}">{$parties[party]->name}</label>
                            </li>
						{/section}
                    </ul>
                </li>
                <li>
                    <label>What categories best describes the content of this leaflet?</label>
                    <ul class="scroll">
						{foreach from="$categories" item="category"}
    						{assign var="checked" value=false}
                            {foreach from="$selected_category_ids" item="selected_category_id"}
                                {if $category->category_id == $selected_category_id}
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
                <li>
                    <label for="txtTags">Enter some extra tags to help describe this leaflet separated by commas</label>
                    <input type="text" id="txtTags" name="txtTags" value="{$data.txtTags}"/>
                    <small>e.g. crime, london, tax, briansmith</small>
                </li>
                <li>
                    <label for="txtName">Enter your name and email address *</label>
                    <input type="text" id="txtName" name="txtName" value="{$data.txtName}"/>
                    <input type="text" id="txtEmail" name="txtEmail" value="{$data.txtEmail}"/>
                    <small>Your email address will not be made public</small>                                   
                </li>
            </ul>
        </fieldset>
        <div class="buttons">
            <input type="submit"  value="Save leaflet"/>
        </div>
    </form>    
</div>                
    
{include file="footer.tpl"}