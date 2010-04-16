{include file="header.tpl"}

<div class="contentfull">

        <h1>Election Campaign Not-Spots Appeal</h1>
        <p>We currently have <strong>no leaflets for these constituencies</strong>! Are the politicians just ignoring them, or are we just missing out on the campaign?
        </p> 
        <p>Help us find out what is really going on in these seats by:
            <ol>
                <li>Email or tweet politicians in these seats asking for their or their opponents leaflets.</li>
                <li>Write a blog post appealing for leaflets that links to this page.</li>
                <li>If you live in one of these constituencies hunt down and <a href="{$www_server}/addupload.php">upload a leaflet</a>.</li>
            </ol>
        </p>
        <p>Thanks and have a good weekend, The Straight Choice.org team</p>
        <hr/>
        <ul>
            {foreach from="$not_spots" item="constituency"}
                <li><a href="{$www_server}/leaflets.php?n={$constituency->url_id}">{$constituency->name}</a></li>
            {/foreach}
        </ul>

</div>
{include file="footer.tpl"}
