{include file="../header.tpl"}

<div class="contentfull align-left">
    <h1>{$page_title}</h1>
    <p>
        <a href="edit_election.php?id={$election_details->election_id}">
            « Back to {$election_details->name}
        </a>
    </p>

    <p>
        <strong>Format:</strong> one constituency name per line
        <small>e.g. <code>Grayndler</code></small>
    </p>

    <form id="frmUpload" method="post" action="{$form_action}">
        {include file="../formvars.tpl"}
        <textarea type="text" id="txtConstituencies" name="txtConstituencies" rows="20" cols="45">{$constituencies}</textarea>
        <div class="buttons">
            <input type="submit"  value="Bulk replace constituencies"/>
        </div>
    </form>
</div>

{include file="../footer.tpl"}
