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
            <p>
                Other wonderful projects by the OpenAustralia Foundation:
                <a href="http://www.righttoknow.org.au/">Right To Know</a> |
                <a href="http://www.openaustralia.org/">OpenAustralia.org</a> |
                <a href="http://www.planningalerts.org.au/">PlanningAlerts</a>
            </p>
        </div>
    </div>

        {if $onloadscript !="" || $set_focus_control !=""}
            <script type="text/javascript" defer="defer">
                {if $set_focus_control !=""}setFocus('{$set_focus_control}');{/if}
                {if $onloadscript !=""} {$onloadscript}; {/if}
            </script>
        {/if}
</body>
</html>
