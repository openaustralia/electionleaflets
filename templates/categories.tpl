{include file="header.tpl"}

    <div class="contentfull">
        <h1>Categories</h1>
        <ul class="parties">
            {foreach from="$categories" item="category"}
                <li>
                    <a href="{$www_server}/categories/{$category->category_id}">{$category->name}</a>
                </li>
            {/foreach}
        </ul>
    </div>
    
{include file="footer.tpl"}