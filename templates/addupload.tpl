{include file="header.tpl"}

<div class="contentfull align-left">
    <form id="frmUpload" method="post" action="{$form_action}" enctype="multipart/form-data" onsubmit="uploadImages();">
        {include file="formvars.tpl"}        
        <h1>Add a leaflet (step 1 of 2)</h1>
        <p>
            Take a photo of a <strong>single leaflet</strong> and upload it below in JPG format. If the leaflet has more than one side you can upload multiple images. If the leaflet was sent by mail, please obscure your name and address with a marker pen. 
        </p>
        <p>Alternatively you can email photographs to <a href="mailto:{$leaflets_email}">{$leaflets_email}</a> and we will send you a link back to fill in the details.
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
                <li>
                    <label for="uplFile">Image 5</label>
                    <input type="file" id="uplFile_5" name="uplFile_5" />
                </li>
                <li>
                    <label for="uplFile">Image 6</label>
                    <input type="file" id="uplFile_6" name="uplFile_6" />
                </li>
                <li>
                    <label for="uplFile">Image 7</label>
                    <input type="file" id="uplFile_7" name="uplFile_7" />
                </li>
                <li>
                    <label for="uplFile">Image 8</label>
                    <input type="file" id="uplFile_8" name="uplFile_8" />
                </li>
            </ul>
        </fieldset>
        <div class="buttons">
            <input type="submit"  value="Upload files &raquo;"/>
        </div>
    </form>
    <div id="divUploading">
        <h3>Uploading your images, please don't close this window, <strong>you will need to fill in a few extra details in a moment</strong></h3>
        <img src="{$www_server}/images/loading.gif"/>
    </div> 
</div>                
    
{include file="footer.tpl"}