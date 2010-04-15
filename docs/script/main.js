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
    
    var aRatingNames = new Array('LocalNational', 'CandidateParty', 'SingleMultiple', 'PositiveNegative', 'PolicyPersonality')
    for (var i=0; i < aRatingNames.length; i++) {
         $("#div" + aRatingNames[i] + " div.slider").slider({
                value: 50,
                change: function (event, ui){
        //                changeWeek(ui.value);
        
                    }
                });        
    };
}