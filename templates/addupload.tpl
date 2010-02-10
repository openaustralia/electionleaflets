{include file="header.tpl"}

<div id="divContentFull">
    <form id="frmUpload" method="post" action="{$form_action}" enctype="multipart/form-data" onsubmit="uploadImages();">
        {include file="formvars.tpl"}        
        <h1>Add a leaflet (step 1 of 2)</h1>
        <p>
            Take a photo of a single leaflet and upload it below in JPG format. If the leaflet has more than one side you can upload multiple images. If the leaflet was sent by mail, please obscure your name and address with a marker pen.
        </p>
        <p>If your image files are large (more than about 1MB), please resize to help keep our server happy, very large files may not upload.</p>
        <fieldset>
            <input type="hidden" name="MAX_FILE_SIZE" value="10000000000">
            <ul>
                <li>
                    <label for="uplFile">Image 1 *</label>
                    <input type="file" id="uplFile_1" name="uplFile_1" />
                </li>
                <li>
                    <label for="uplFile">Image 2</label>
                    <input type="file" id="uplFile_2" name="uplFile_2" />
                </li>
                <li>
                    <label for="uplFile">Image 3</label>
                    <input type="file" id="uplFile_3" name="uplFile_3" />
                </li>
                <li>
                    <label for="uplFile">Image 4</label>
                    <input type="file" id="uplFile_4" name="uplFile_4" />
                </li>
            </ul>
        </fieldset>
        <div class="buttons">
            <input type="submit"  value="Upload files &raquo;"/>
        </div>
    </form>
    <div id="divUploading">
        <h3>Uploading your images, please wait a moment</h3>
        <img src="{$www_server}/images/loading.gif"/>
    </div> 
</div>                
    
{include file="footer.tpl"}