{include file="header.tpl"}

<div id="divContentFull">
        <h1>Add a leaflet (step 1 of 2)</h1>
        <p>
            Take a photo of a <strong>single leaflet</strong> and upload it below in JPG format. If the leaflet has more than one side you can upload multiple images. If the leaflet was sent by mail, please obscure your name and address with a marker pen.
        </p>
        <p>If your image files are large (more than about 1MB), please resize to help keep our server happy, very large files may not upload.</p>
		{literal}
		<script type="text/javascript">
		$(document).ready(function() {
			$('[name=addInfo]').click(function(){window.location="/addinfo.php";return false;});
			$("#uploadify").uploadify({
				'uploader'       : 'script/uploadify.swf',
				'script'         : '/addupload.php',
				'scriptData'     : {
										'_is_postback' : true,
										'upload_key'   : $('[name=upload_key]').val()
									},
				'cancelImg'      : '/images/cancel.png',
				'folder'         : 'uploads',
				'queueID'        : 'fileQueue',
				'auto'           : true,
				'multi'          : true,
				'simUploadLimit' : 4,
				'onComplete'     : function(event,queueId,file,response,data){
										var json = $.evalJSON(response);
										$('.contentright').prepend("<div id='"+json.image_key+"' style='display:none'><img src='"+json.image_url+"'/></div>");
										$('#'+json.image_key).fadeIn('slow');
									},
				'onOpen'		 : function(){
										$('[name=addInfo]').attr('disabled', 'disabled');
									},
				'onAllComplete'	 : function(){
										$('[name=addInfo]').attr('disabled', '');
									}
			});
		});
		</script>
		{/literal}
		<div class="contentleft">
		    <div>
			    <h1>Choose Image(s)</h1>
				<div id="fileQueue"></div>
				<input type="file" name="uploadify" id="uploadify" />
		    </div>
			<br/>
			<div class="buttons">
				<form>
					<input type="hidden" name="upload_key" value="{$upload_key}"/>    
	            	<input name="addInfo" type="submit" disabled="disabled"  value="Add Info &raquo;"/>
				</form>
	        </div>
			<br/>
		</div>
		<div class="contentright">
		</div>
    </form>
</div>                
    
{include file="footer.tpl"}
