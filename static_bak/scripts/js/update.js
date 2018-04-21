/**
 * Created by jimmy on 2018/2/2.
 */

function update(id) {
   $.getJSON("/data/" + id + "/",function(data) {
      $.each(data, function(){
         // $("#jcc").html('<p>' + this.name + ' is a ' + this.subject + ' teacher.</p>');
         // $("#jcc").html('<p>' + this.name + ' is a ' + ' teacher.</p>');
         // $("#jcc").html('<p>' + this + ' is a ' + ' teacher.</p>');
         $("#update_alert").html('<p>' + this + '</p>');
         });
   });
}
function timeDown(limit, i) {
   limit--;
   if (i > 4) {
       i = 0;
   }
   if (limit < 0) {
       limit = 3;
       update(i);
       i++;
   }
   // $('#time').text(limit + '秒后刷新');
   $('#time').text();
       setTimeout(function() {
           timeDown(limit, i);
            // }, 1000)
            }, 20)
}

$(document).ready(function() {
   timeDown(1, 0)
})