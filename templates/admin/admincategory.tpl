{include file="../header.tpl"}

<div class="contentfull">
    <h1>Add a new category</h1>
    <p><a href="/admin">« Admin home</a></p>

    <form method="post" action="{$form_action}">
        {include file="../formvars.tpl"}
        <fieldset>
            <ul>
                <li>
                    <label for="txtCategoryName">New Category</label>
                    <input type="text" id="txtCategoryName" name="txtCategoryName" {if $warn_txtCategoryName}class="error"{/if}/>
                    <small>e.g. Zombie Apocalypse Preparedness</small>
                </li>
            </ul>
        </fieldset>
        <div class="buttons">
            <input type="submit"  value="Create category"/>
        </div>
    </form>

    <h4>Existing Categories</h4>
    <ul>
        {foreach from="$categories" item="category"}
            <li>{$category->name}</li>
        {/foreach}
    </ul>
</div>

{include file="../footer.tpl"}
