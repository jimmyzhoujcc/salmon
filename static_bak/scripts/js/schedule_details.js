$(document).ready(function() {
    var table = $('#example').DataTable();

    $('#example tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected')
        //console.log(document.getElementById('sid').innerHTML)

        //  Testing function start - is ok //
        var sHTML = $(this).toggleClass('selected').context
        var sid = sHTML.cells[2].innerHTML
        //console.log(typeof(sHTML))
        //console.log(sHTML.rowIndex)
        //console.log(sid)
        var data={"sid": sid}
        console.log('data:',data)
        $.ajax({
                type: "POST",
                url: "/cancel_post_json_task/",
                //url: "/schedule_details/",
                datatype: "json",
                //async: true,
                //data: {"sid": sid},
                data:data,
                success: function (json) {
                    console.log(data)
                    $('#output').html("[Info] --- System get cancel command to kill task id:" + json)
                    console.log('success,return json:',json)
                    //alert("Success to cancel task id \n"+json)
                    window.wxc.xcConfirm("Success to cancel task id: <br>"+json,window.wxc.xcConfirm.typeEnum.info)
                },
                failed: function (json) {
                    console.log(data)
                    console.log('failed,return json:',json)
                    //alert("Failed!",json)
                }
            })
        // below is unuseful
        // var x = document.getElementById("sid").innerHTML
        // console.log(x)
        // console.log($('sHTML').context)

        // var obj = $("<div id='div1'>div1</div><div id='div2'>div2</div>");
        // var obj1 = obj.find('.div1');
        // var obj2 = obj.find('.div2');

        // console.log(obj1)
        // console.log(obj2)

        // console.log(objnew)
        // Element.prototype.sid = function(str){
        //  this.innerHTML = str
        //  console.log('innerHTML:',this.innerHTML)
        // }
        // Testing function end - is ok //
    });

    //$('#button').click(function(){
        //alert( table.rows('.selected').data().length +' row(s) selected' )
        //alert('sid:',sid)
    //})
});