// function UploadAsset() {
$(document).ready(function () {
    var import_file = $("#import_file").attr("value")
    console.log('import_file:', import_file)
    var data = {"import_file": import_file}
    $.ajax({
        type: "POST",
        url: "/add_asset/",
        data: data,
        async: true,
        dataType: "json",
        success: function (msg) {
            console.log('msg.response.status',msg.response.status)
            // window.location('/host_list/')
        },
        // failed:function (msg) {
        //     console.log('msg.response.status',msg.response.status)
        //     window.location('/host_list/')
    })
})
// }

// $.post( "{% url '/host_list/' %}",
//  { csrfmiddlewaretoken: '{{ csrf_token}}' ,
//    other_params: JSON.stringify(whatever)
//  },
//  function(data) {
//      if(data.status == 1){ // meaning that everyhting went ok
//         // do something
//          window.location('/host_list/')
//      }
//      else{
//         alert(data.message)
//         // do your redirect
//         window.location('your_url')
//      }
// })