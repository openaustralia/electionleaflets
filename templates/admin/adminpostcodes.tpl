{include file="../header.tpl"}

<div class="contentfull align-left">
    <h1>{$page_title}</h1>
    <p>
        <a href="edit_election.php?id={$election_details->election_id}">
            « Back to {$election_details->name}
        </a>
    </p>

    <p>
        <strong>Format:</strong> one mapping per line, comma separated with postcode
        followed by constituency name
        <small>e.g. <code>2042, Grayndler</code></small>
    </p>

    <form id="frmUpload" method="post" action="{$form_action}">
        {include file="../formvars.tpl"}
        <textarea type="text" id="txtPostcodeMappings" name="txtPostcodeMappings" rows="20" cols="45">{$postcode_mappings}</textarea>
        <div class="buttons">
            <input type="submit"  value="Bulk replace postcode mappings"/>
        </div>
    </form>
</div>

{include file="../footer.tpl"}
