function upload(){

    //validation goes here
    
    //hide form and show loading gif
    document.getElementById('frmLeaflet').style.display = "none";
    document.getElementById('divLoading').style.display = "block";

    //javascript post goes here
    
}

function showMap(sMapProvider, nLng, nLat){

    var oMapstraction = new Mapstraction('divSpotMap', sMapProvider);

    oMapstraction.addControls({
        overview: true          
    });

    // create a lat/lon object
    var oPoint = new LatLonPoint(nLat,nLng);

    // display the map centered on a latitude and longitude (Google zoom levels)
    oMapstraction.setCenterAndZoom(oPoint, 11);

    // create a marker positioned at a lat/lon 
    oMarker = new Marker(oPoint);
    oMarker.setIcon("/images/marker.png", [15,15], null);
    oMarker.setShadowIcon("/images/shadow.png",1);
 
    // display marker
    oMapstraction.addMarker(oMarker);
}

function uploadImages(){
   document.getElementById('frmUpload').style.position = "absolute";    
   document.getElementById('frmUpload').style.left = "-2000px";       
    document.getElementById('divUploading').style.display = "block";
    
    return true;
}

function mycarousel_initCallback(carousel)
{
    // Disable autoscrolling if the user clicks the prev or next button.
    carousel.buttonNext.bind('click', function() {
        carousel.startAuto(0);
    });

    carousel.buttonPrev.bind('click', function() {
        carousel.startAuto(0);
    });

    $('#btnNext').bind('click', function() {
        carousel.next();
        return false;
    });

    $('#btnPrevious').bind('click', function() {
        carousel.prev();
        return false;
    });

    // Pause autoscrolling if the user moves with the cursor over the clip.
    carousel.clip.hover(function() {
        carousel.stopAuto();
    }, function() {
        carousel.startAuto();
    });
};

function setupRate(){

    var aItems = $('#hidRateItems').val().split(',');
    for (var i=0; i < aItems.length; i++) {
        if(aItems[i] != ''){
             $("#divRate_" + aItems[i] + " div.slider").slider({
                    value: 50,
                    change: function (event, ui){
                            iRateId = $(this).parent().attr('id').split('_')[1];
                            $('#hidRateValue_' + iRateId).val($(this).slider('value'));
                        }
                    });        
        }
    };
}

function setupUploader(){
    $('[name=addInfo]').click(function(){window.location="/addinfo.php";return false;});
    $("#uploadify").uploadify({
    	'uploader'       : 'script/uploadify.swf',
    	'script'         : '/upload.php',
    	'buttonText'     : 'Select files from your computer',
    	'buttonImg'      : 'images/upload.png',
    	'width'          : 400,
    	'height'          : 80,
    	'scriptData'     : {
    							'_is_postback' : true,
    							'upload_key'   : $('[name=upload_key]').val()
    						},
    	'cancelImg'      : '/images/cancel.png',
    	'folder'         : 'uploads',
    	'queueID'        : 'divFileQue',
    	'auto'           : true,
    	'multi'          : true,
    	'simUploadLimit' : 4,
    	'onSelectOnce'   : function(){
                                $('#divFileQue p.hint').hide();
	                        },
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
}