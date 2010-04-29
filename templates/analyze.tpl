{include file="header.tpl"}
    <div class="contentcolleft">
        <h1>Election leaflet analysis</h1>
        <p>
            We now have over {$leaflet_count} leaflets photographed and uploaded by members of the public. But need more help to analyse them (no one ever said this transparency lark was going to be simple). We'll show you some random leaflets and ask you to tell us a bit about them and anything interesting you find.
        </p>
        <p>
            There will be  prizes for the people who analyse the most leaflets, and it will help us find out things about the different parties approaches to the election - e.g. how local or national the leaflets are, if they are about policy or personality.
        </p>
        <h3>League table</h3>
        <table>
            <tr>
                <th>Position</th>
                <th>Name</th>
            </tr>
            {foreach from="$users" item="user" name="foo"}
                <tr>
                    <td>{$smarty.foreach.foo.iteration}</td>
                    <td>{$user->user_name}</td>                    
                </tr>
            {/foreach}
        </table>
    </div>

    <div class="contentcolright">
        <h3>Ready?</h3>
        <form method="post" action="{$form_action}" class="formhighlight">
            {include file="formvars.tpl"}
            <ul>
                <li>
                    <label for="txtName">Name</label>
                    <input type="text" id="txtName" name="txtName" {if $warn_txtName}class="error"{/if} value="{$data.txtName}"/>
                </li>
                <li>
                    <label for="txtEmail">Email</label>
                    <input type="text" id="txtEmail" name="txtEmail" {if $warn_txtEmail}class="error"{/if} value="{$data.txtEmail}"/>
                </li>
            </ul>
            <input type="submit" value="Get started"/>
        </form>
        <h3>Prizes</h3>
        <p>
            The top 3 people will each receive the following glamourous prizes:
        </p>
        <ul class="bullets">
           <li>1 year subscription to Private Eye</li> 
           <li>Picture made up of election leaflets of the party leader of your choice</li>
           <li>scraperWiki.com mug</li>
        </ul>
    </div>


{include file="footer.tpl"}