        </div>
        <div id="divFooter" {if $is_full_view == true}class="full-width"{/if}>
        	<div class="footer-line">
        		<img src="/images/footer_line.png" />
        	</div>
            <ul class="inline">
                <li><a href="/">Home</a></li>
                <li><a href="/about">About</a></li>
                <li><a href="/about#contact">Contact</a></li>
		<li><a href="http://twitter.com/electionleaflet">Twitter</a></li>
		<li class="last"><a href="http://blog.openaustralia.org">Blog</a></li>
            </ul>
        </div>
    </div>

	    {if $onloadscript !="" || $set_focus_control !=""}
			<script type="text/javascript" defer="defer">
				{if $set_focus_control !=""}setFocus('{$set_focus_control}');{/if}
				{if $onloadscript !=""} {$onloadscript}; {/if}
			</script>
		{/if}
		{literal}
        <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
        try {
        var pageTracker = _gat._getTracker("{/literal}{$google_analytics_tracker}{literal}");
        pageTracker._trackPageview();
        } catch(err) {}</script>
        {/literal}

</body>
</html>
