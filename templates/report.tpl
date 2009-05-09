{include file="header.tpl"}

    <div class="contentfull">
        {if $message_sent == false}
            <h1>Report abuse: <em>{$leaflet->title}</em></h1>
            <p>
                This form is for reporting abuse of this website e.g. people uploading images that are not of election leaflets, maliciously altering the text of a leaflet when transcribing it or generally being an idiot. <strong>It's is not for reporting the content of election leaflets</strong>. If you believe that claims made in an election leaflet are in anyway <a href="http://en.wikipedia.org/wiki/Representation_of_the_People_Act_1983">illegal</a>, abusive, racist, homophobic or sexist please report them directly to the <a href="http://www.electoralcommission.org.uk/contact">Electoral Commission</a>.
            </p>
            <form method="post" action="{$form_action}">
                {include file="formvars.tpl"}                
                <ul class="form">
        			<li>
        				<label for="txtName">Your name</label>
                        <input type="text" id="txtName" name="txtName" class="textbox{if $warn_txtName} error{/if}" value="{$data.txtName}"/>
        			</li>
        			<li>
        				<label for="txtEmail">Your email address</label>
                        <input type="text" id="txtEmail" name="txtEmail" class="textbox{if $warn_txtEmail} error{/if}" value="{$data.txtEmail}"/>
        			</li>
        			<li>
        				<label for="txtDetails">Details</label>
                        <textarea id="txtDetails" name="txtDetails" class="textbox{if $warn_txtDetails} error{/if}" cols="50" rows="5">{$data.txtDetails}</textarea>
        			</li>
                    <li>
                        <input type="submit" value="Send report" />
                    </li>
                </ul>
            </form>
        {else}
            <div class="attention">
                <h1>Thank you, your message has been sent</h1>
                <p><a href="{$www_server}/leaflet.php?q={$leaflet->leaflet_id}">Click here to return to the leaflet</a></p>
            </div>
        {/if}
    </div>
    
{include file="footer.tpl"}