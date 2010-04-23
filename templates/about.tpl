{include file="header.tpl"}

    <div class="contentfull">
        <h1>About {$site_name}</h1>
        <p>
            Electioneering is a high-stakes game. We, at The Straight Choice, believe that it’s time for that game to become a spectator sport.
        </p>
        <p>
            The Straight Choice is an real-time election leaflet project. Our ambition is to create a live visualization of the flood of party political leaflets as they are delivered across the country during an election campaign.

            If you have recently received any election leaflets through your door you can help by photographing or scanning them and <a href="{$www_server}/addupload.php">uploading the images to our server</a>.
        </p>
        <p>
            The idea was conjured up in December 2008 at a weekend in Derbyshire, and 
            finally acted upon in Francis's front living room in Cambridge at the end of April 2009.
        </p>
        <p>
            The name of the website is derived from a leaflet in the controversial by-election in <a href="http://en.wikipedia.org/wiki/Bermondsey_by-election,_1983">Bermondsey in 1983</a> which has become the type specimen of accusations of dodgy campaigning.
        </p>
        <h3>The team</h3>
        <p>
            This website has been put together by 
            three of the usual suspects who don't have time or contacts to sell ideas or 
            apply for grants.  
	    The code has been deposited at <a href="http://code.google.com/p/theelectionleafletproject">code.google/theelectionleafletproject</a>.
        </p>
        <p class="person" id="julian">
            <img src="{$www_server}/images/julianpic1.jpg">
            <strong>Julian Todd</strong> had the job of pestering people about an election leaflet monitoring website
            after discovering just how crucially important these pieces of paper really are.  
            In 2003 he wrote <a href="http://www.publicwhip.org.uk">Public Whip</a> with Francis Irving, 
            which became the input for mySociety's <a href="http://theyworkforyou.com">TheyWorkForYou.com</a>.
            In 2007 he made <a href="http://www.undemocracy.com">undemocracy.com</a> which applied the same 
            idea to the United Nations General Assembly and Security Council. Julian and has volunteered his phone number (0791 6090736), should you be interested in talking to someone about this project
        </p>
        <p class="person" id="richard">
            <img src="{$www_server}/images/richardpic1.jpg">
            <strong>Richard Pope</strong> initially spent a couple of days <a href="http://code.google.com/p/theelectionleafletproject/">writing the code for this site</a> and making it look pretty for the European Elections in 2009. During the run up to the 2010 General Election he has been working full time on the project on a voluntary basis expanding the website and dealing with the press.
            He is the brains behind the <a href="http://www.planningalerts.com">Planning Alerts</a> project, <a href="http://www.groupsnearyou.com">Groups Near You</a> and <a href="http://www.streetwire.org">StreetWire</a>.
            In 2005 he made theElection Memory project to record and publicise 
            manifestos of the different parties in the Lambeth local elections.
        </p>

        <p class="person" id="francis">
            <img src="{$www_server}/images/francispic1.jpg">
            <strong>Francis Irving</strong> is the other half of <a href="http://www.publicwhip.org.uk">Public Whip</a> .
        He has done substantial work on mySociety's <a href="http://www.whatdotheyknow.com">WhatDoTheyKnow.com</a> 
        -- among other projects -- and would specifically like you to sign up for <a href="http://seriouschange.org.uk/">Serious Change</a>.
        </p>
        <br class="clear"/>
        <h3>Thanks</h3>
        <p>
            Our biggest thanks go out to the hundreds of volunteers who have
            kindly uploaded leaflets in recent weeks and months.  This site
            couldn't exist without you.
        </p>
        <p>
            Thanks also to <a href="http://thestraightchoice.org">mySociety</a> and <a href="http://democracyclub.org.uk">Democracy Club</a> for their support and
            publicity in terms of promoting the site to interested citizens across
            the country.
        </p>
        <p>
            In terms of project development, Richard Pope has put a lot of free
            time and effort into developing the code since April 2009, with a cash
            contribution of £3000 from Julian and use of his server.  As the load
            has increased in recent days owing to the election, the service has
            been upgraded by Donvan Hide to Amazon S3 technology with a
            contribution from <a href="http://scraperwiki.com">ScraperWiki</a>.
        </p>
        <p>
            We have also had the support of a great bunch volunteers who have helped promote The Straight Choice <a href="http://www.flickr.com/photos/memespring/3701738722/in/set-72157621134703752/">by delivering leaflets</a> during by-elections. If you'd like to help out, <a href="mailto:team@thestraightchoice.org">please get in touch</a> we'd love to hear from you.
        </p>
		<p>
			<strong><a href="http://www.availableimagination.com">Donovan Hide</a></strong> helped get all the images uploaded to and served from  Amazon's <a href="http://aws.amazon.com/s3/">S3</a> service.
		</p>
        <br class="clear"/>
        <h3>FAQs</h3>
        <dl class="faq">
            <dt>How do I upload an election leaflet</dt>
            <dd>You need to upload a photograph of the leaflet in JPG format, then enter a few details about the leaflet. <a href="{$www_server}/addupload.php">Click here to get started</a>.</dd>
            <dt id="activist">I'm a party activist, can I upload a leaflet?</dt>
            <dd>Yes. Just upload a photos of your leaflet and enter <strong>one</strong> of the post codes it is aimed at when prompted. <a href="{$www_server}/addupload.php">Click here to add a leaflet now</a>.</dd>
            <dt>Who can reuse the images</dt>
            <dd>By uploading an image to The Straight Choice you are allowing free reuse of the image. For this site to make an impact on the way electioneering is conducted it's important that the dodgy ones get as wide an audience as possible, and this helps it happen. If you would like to make sure that proper attribution for a particular image please let us know.</dd>
            <dt>Is this project affiliated to or supported by any political party</dt>
            <dd>No.</dd>
            <dt>Can I reuse the images on my website or blog?</dt>
            <dd>Yes, but please make a copy of the image on your site and link back to us.</dd>
            <dt>What do you mean by a leaflet? Does a letter count?</dt>
            <dd>Any kind of written communication - letters, leaflets, flyers - contain useful information. If in doubt, upload it anyway or get in touch with us.</dd>
            <dt>Can I send you leaflets by post?</dt>
            <dd>
                Yes. Please send them to: <address>The Straight Choice c/o Scraperwiki, LSP 2, 146
                Brownlow Hill, Liverpool L3 5RF</address> and mark each leaflet with the postcode (or postcode district) it was delivered to.
            </dd>
        </dl>
        <h3 id="contact">Contact</h3>
        <p>
            You can get in touch with us via team [at] thestraightchoice.org or phone Julian on 0791 6090736.
        </p>
        
        <h3>Thanks and acknowledgements</h3>
        <p>Linking leaflets to constituencies is made possible thanks to the <a href="http://www.theyworkforyou.com/api/">TheyWorkForYou.com API</a></p>
    </div>
    
{include file="footer.tpl"}
