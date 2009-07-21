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
                    <label for="txtTitle">Give the leaflet a title *</label>
                    <input type="text" id="txtTitle" name="txtTitle" {if $warn_txtTitle}class="error"{/if} value="{$data.txtTitle}"/>
                    <small>e.g. the main headline</small>
                </li>
                <li>
                    <label for="txtDescription">Enter a transcript of the main points / first paragraph</label>
                    <textarea type="text" id="txtDescription" name="txtDescription" {if $warn_txtDescription}class="error"{/if} cols="70" rows="5">{$data.txtDescription}</textarea>
                    <br/>
                </li>
                <li>
                    <label for="txtPostcode">Which postcode was the leaflet was delivered to? *</label>
                    <input type="text" id="txtPostcode" name="txtPostcode" {if $warn_txtPostcode}class="error"{/if} value="{$data.txtPostcode}"/>
                    <small>this will let us work out which constituency the leaflet covers</small>
                </li>
                <li>
                    <label for="ddlDelivered">When was the leaflet delivered? *</label>
                    <select id="ddlDelivered" name="ddlDelivered" {if $warn_ddlDelivered}class="error"{/if}>
                        <option value="0" {if $data.ddlDelivered == 0}selected="selected"{/if}>Today</option>
                        <option value="1" {if $data.ddlDelivered == 1}selected="selected"{/if}>Yesterday</option>
                        <option value="7" {if $data.ddlDelivered == 7}selected="selected"{/if}>Last Week</option>
                        <option value="14" {if $data.ddlDelivered == 14}selected="selected"{/if}>Couple of weeks ago</option>
                        <option value="30" {if $data.ddlDelivered == 30}selected="selected"{/if}>Last month</option>                        
                    </select>
                    <small class="highlight">Please only add leaflets that have been delivered to you recently</small>
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
                    <label for="txtTags">Tags this leaflet (candidate name, town, policy name, etc)</label>
                    <textarea type="text" id="txtTags" name="txtTags" {if $warn_txtTags}class="error"{/if} cols="70" rows="3">{$data.txtTags}</textarea>
                    <br/>
                    <small>e.g. Brian Smith<span class="huge">,</span> Woking<span class="huge">,</span> zero tolerance<span class="huge">,</span> parks<span class="huge">,</span> transport</small>
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