{include file="header.tpl"}

    <div class="contentfull">
        <h1>{$party->name} statistics</h1>
        <p><strong>{$leaflet_count}</strong> leaflets have been uploaded since {$date_since}</p>

        <h2>Analysis</h2>
        <ul class="rate_results">
            {foreach from="$average_rates" item="average_rate"}
                <li>
                    <span class="left_label">{$average_rate->left_label}</span>
                    <span class="bar"><span class="result" style="left:{$average_rate->average}%"></span></span>
                    <span class="right_label">{$average_rate->right_label}</span>                    
                </li>
            {/foreach}
        </ul>
    </div>
    <div class="contentleft">
        <h2>Top constituencies</h2>
        <ol>
            {foreach from="$top_constituencies" item="constituency"}
                <li><a href="{$www_server}/constituencies/{$constituency->url_id}/">{$constituency->name}</a> {$constituency->count} leaflets</li>
            {/foreach}
        </ol>
    </div>
    <div class="contentright">
        <h2>Top categories</h2>
        <ol>
            {foreach from="$top_categories" item="category"}
                <li><a href="{$www_server}/categories/{$category->category_id}/">{$category->name}</a> {$category->count} leaflets</li>
            {/foreach}
        </ol>
    </div>
    <br class="clear"/>
    {*
    <div class="content_full">
        <h2>Interesting leaflets</h2>
        <ul class="interesting_leaflets">
            {foreach from="$interesting_leaflets" item="leaflet"}
                <li>
                    <a class="leaflet" href="{$www_Server}/leaflets/{$leaflet->leaflet_id}/">
						<img src="{image_url id=$leaflet->leaflet_image_image_key size=s}">
					</a>
					<h4>{$leaflet->title}</h4>
                    <p>{$leaflet->rate_interesting_description}</p>
                </li>
            {/foreach}
        </ul>
    </div>
    *}
{include file="footer.tpl"}