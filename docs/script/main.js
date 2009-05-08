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
    oMapstraction.setCenterAndZoom(oPoint, 13);

    // create a marker positioned at a lat/lon 
    //oMarker = new Marker(oPoint);
 
    // display marker
    //oMapstraction.addMarker(oMarker);
}

function uploadImages(){
    document.getElementById('frmUpload').style.display = "none";    
    document.getElementById('divUploading').style.display = "block";
    
    return true;
}