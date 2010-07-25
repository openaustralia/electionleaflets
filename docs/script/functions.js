function get(sControl){	
	return document.getElementById(sControl);
}

function postBackForm(sForm, sPostbackCommand, sPostbackArgument) {

	if(sPostbackCommand){

		get("_postback_command").value = sPostbackCommand;
	}
	
	if(sPostbackArgument){
		get("_postback_argument").value = sPostbackArgument;
	}
	
    var oForm 	
    oForm = get(sForm);
	oForm.submit();
}

function setFocus(sID) {
	if(get(sID).disabled != true){
    	get(sID).focus();
	}
}

function cancelTextboxSubmit(oEvent) {
	
	var bReturn = true;
	
	if(!oEvent){ 
		oEvent=window.event;
	}
	
	if (oEvent.keyCode == 13) {
		bReturn = false;
	}
	
	return bReturn;
	
}

function showWarning (sWarnings) {

    var sWarningHtml = '';

	if(sWarnings.indexOf('\n') > 0){
        var aWarnings = sWarnings.split('\n');
        sWarningHtml += '<ul>'
	    for (var i=0;i<aWarnings.length -1;i++) {
	       if (aWarnings[i]!= ''){
    	       sWarningHtml += '<li>' + aWarnings[i] + '</li>';
    	   }
        }
        sWarningHtml += '</ul>'
	}else{
	   sWarningHtml = sWarnings;
	}
    var oWarning;
    oWarning = get('divWarning');

    oWarning.innerHTML = sWarningHtml;
    window.scroll(0,0);    
    oWarning.style.display = 'block' 
  
}

function hideWarning (){
    oWarning = get('divWarning');
	oWarning.style.display = 'none'
    oWarning.innerHTML = '';
}

function setControlWarning (oControl, bState){

    if(bState == true){
        oControl.className += ' error';
    } else {
        oControl.className = oControl.className.replace('error', '' );
    }

}

function SimplePoint (nLng, nLat){
    this.lng = nLng;
    this.lat = nLat;
}

function showGreyOut(){
    var oGreyOut = document.createElement("div");
    oGreyOut.className = "greyout";
    document.body.appendChild(oGreyOut);
}

function setCookie(sName,sValue,sDays) {
    var oDate=new Date();
    oDate.setDate(oDate.getDate()+sDays);
    document.cookie=sName+ "=" +escape(sValue)+
    ((sDays==null) ? "" : ";expires="+oDate.toGMTString());
}

function getCookie(sName){
if (document.cookie.length>0){
  c_start=document.cookie.indexOf(sName + "=");
  if (c_start!=-1)
    { 
    c_start=c_start + sName.length+1; 
    c_end=document.cookie.indexOf(";",c_start);
    if (c_end==-1) c_end=document.cookie.length;
    return unescape(document.cookie.substring(c_start,c_end));
    } 
  }
  return "";
}

function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}

function setTextboxHint(sId, sHint){
    $(sId).onblur = function(){
        if($(sId).value == ''){
            $(sId).value = sHint;
            console.debug("set");
            $(sId).className = $(sId).className + ' hint';
        }
    }
    
    $(sId).onfocus = function(){
        if($(sId).value == sHint){
           $(sId).value = ""; 
        }
         $(sId).className = $(sId).className.replace('hint', "");
    }
}


function setActiveNav(){
	$page = window.location;
	$page_with_slash = $page+"/";
	if(!$page) {
		$page = '';
	}
	$('ul#ulMenu li a').each(function(){
		var $href = $(this).attr('href');
		var $href_with_slash = $href+"/";
		if ( ($href == $page) || ($href == $page_with_slash) || $href_with_slash == $page) {
			$(this).addClass('active');
		} else {
			$(this).removeClass('active');
		}
	});
}

$(document).ready(function(){
	setActiveNav();
});