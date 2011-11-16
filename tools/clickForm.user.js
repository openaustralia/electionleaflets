// ==UserScript==
// @name           clickForm
// @namespace      test
// @include        http://www.abc.net.au/elections/qld/2009/guide/electoratefinder.htm
// ==/UserScript==

(function() {
   var input = document.getElementById('addressinput');
   var postcode = 4000;
   var total = "";

   function logElectorate() {
     input.value = postcode++;
     var evt = document.createEvent("MouseEvents");
     evt.initMouseEvent("click", true, true, window,
     0, 0, 0, 0, 0, false, false, false, false, 0, null);
     input.nextSibling.nextSibling.dispatchEvent(evt);
     setTimeout(function() {
       var output = document.getElementById('output');
       if (output.lastChild.firstChild.firstChild) {
         total += input.value + ":" + output.lastChild.firstChild.firstChild.innerHTML + ",";
       }
       console.log(total);
     }, 3000);
   }

   for (var i=0; i <= 999; i++) {
     setTimeout(logElectorate, i*5000);
   }
})();
