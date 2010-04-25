{include file="header.tpl"}
<script type="text/javascript" src="{$www_server}/script/upload.js"></script>
<div id="divContentFull">
        <h1>Add a leaflet (step 1 of 2)</h1>
        <p>
            Take a photo of a <strong>single leaflet</strong> and upload it below in JPG format. If the leaflet has more than one side you can upload multiple images. If the leaflet was sent by mail, please obscure your name and address with a marker pen.
        </p>
        <p>If your image files are large (more than about 1MB), please resize to help keep our server happy, very large files may not upload.</p>
		<div class="contentleft">
		    <div>
			    <h1>Choose Image(s)</h1>
			</div>
			<div class="buttons">
				<form id="uploadForm" action="http://services.snipshot.com" method="post" enctype="multipart/form-data" autocomplete="off"> 
				  	<input type="hidden" name="upload_key" value="{$upload_key}"/>
					{literal}
					<input type="hidden" name="_is_postback" value="1">
					<input type="hidden" name="snipshot_input_options" value='{"effect":{"enhance": true}}'/>
					<input type="hidden" name="snipshot_output_options" value='{"hires":true,"filetype":"jpg"}'/>
					<input type="hidden" name="snipshot_css" value="#enhance,#resize,#adjust,#effects,#undo{display:none;}"/>
		            <input type="hidden" name="snipshot_output" value="Filedata" />
					{/literal}
					<input id="file" name="snipshot_input" size="41" type="file" />
				    <input type="hidden" name="snipshot_callback" value="{$www_server}/uploadv2.php" /> 
		        </form> 
		        <div id="uploadProgress" class="hide"> 
		          Just a moment please...
		        </div>
				<br/>
				<form>
					<input type="hidden" name="upload_key" value="{$upload_key}"/> 
					<input name="addInfo" type="submit" {if empty($image_que_items)}disabled="disabled"{/if} value="Add Info &raquo;"/>
	        </div>
			<br/>
		</div>
		<div class="contentright">
			<div>
		        {foreach from="$image_que_items" item="image_que_item"}
					<img src="{image_url id=$image_que_item->image_key size=m}">
		            <br/>
		        {/foreach}
		    </div>
		</div>
    </form>
</div>                
    
{include file="footer.tpl"}
