// $(document).ready(function() {
//     $("#sid").click(function () {
//         $.getJSON('/cancel_post_json_task/', function (ret) {
//             $("#schedule_result").html(ret.twz);
//         })
//     })
// });

// function ScheduleDetails() {
//     var sid = $("#sid").val();
//     $.ajax({
//         type: "POST",
//         // url: "/cancel_post_json_task/",
//         url: "/schedule_details/",
//         datatype: "json",
//         // async: true,
//         data: {
//             "sid":$("#sid").val(),
//         },
//         success:function (json) {
//             $('#output').html(json);
//             alert("Created New User!");
//         }
//     });
// }

function ScheduleDetails() {
    $(document).ready(function() {
        var table = $('#example').DataTable();
        $('#example tbody').on('click', 'tr', function () {
            $(this).toggleClass('selected')
            //console.log(document.getElementById('sid').innerHTML)

            //  Testing function start - is ok //
            var sHTML = $(this).toggleClass('selected').context
            var sid = sHTML.cells[2].innerHTML
            //console.log(typeof(sHTML))
            //console.log(sHTML.rowIndex)
            console.log(sid)
            var data=JSON.stringify({"sid": sid})
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
                    $('#output').html(json)
                    alert("Success!")
                },
                failed: function (json) {
                    console.log(data)
                    alert("Failed!")
                }
            })
        })
    })
}