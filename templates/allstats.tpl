{include file="header.tpl"}

    <div class="contentfull">
        <h1>Analysis results</h1>
        <p>These are the results from the rating of random leaflets by members of the public</p>
            <h2>Conservative Party</h2>
            <ul class="rate_results">
            {foreach from="$conservative_party_party_rates" item="rate"}            
                <li>
                    <span class="left_label">{$rate->left_label}</span>
                    <span class="bar"><span class="result" style="left:{$rate->average}%"></span></span>
                    <span class="right_label">{$rate->right_label}</span>                    
                </li>
            {/foreach}
            </ul>     
            <p><a href="{$www_server}/parties/conservative_party/stats/">More data about the Conservative Party</a></p>
            <br/>
            <h2>The Labour Party</h2>
            <ul class="rate_results">
            {foreach from="$the_labour_party_party_rates" item="rate"}            
                <li>
                    <span class="left_label">{$rate->left_label}</span>
                    <span class="bar"><span class="result" style="left:{$rate->average}%"></span></span>
                    <span class="right_label">{$rate->right_label}</span>                    
                </li>
            {/foreach}
            </ul>
            <p><a href="{$www_server}/parties/the_labour_party/stats/">More data about The Labour Party</a></p>
            <br/>
            <h2>Liberal Democrats</h2>
            <ul class="rate_results">
            {foreach from="$liberal_democrats_party_rates" item="rate"}            
                <li>
                    <span class="left_label">{$rate->left_label}</span>
                    <span class="bar"><span class="result" style="left:{$rate->average}%"></span></span>
                    <span class="right_label">{$rate->right_label}</span>                    
                </li>
            {/foreach}
            </ul>       
            <p><a href="{$www_server}/parties/liberal_democrats/stats/">More data about the Liberal Democrats</a></p>
    </div>

{include file="footer.tpl"}