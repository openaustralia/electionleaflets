{include file="header.tpl"}

    <div class="contentfull">
        <h1>Election leaflet analysis</h1>
        <p>
            We now have over {$leaflet_count} leaflets photographed and uploaded by members of the public. We need your help to analyse them.
        </p>
        <h3>Task 1 - help us classify the contents of leaflets</h3>
    </div>

    <div class="contentleft">
        <img src="{$www_Server}/images/rate.png"/>
    </div>

    <div class="contentright">
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
    </div>


{include file="footer.tpl"}