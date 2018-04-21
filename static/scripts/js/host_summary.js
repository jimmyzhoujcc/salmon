/**
 * Created by jimmy on 2018/2/26.
 */
$(document).ready(function() {
    //var hgname = document.getElementById("hgname").innerHTML
    var array_group_name = []
    var array_group_hostip = []
    {% for hg in hostgroup %}
{#    var hgname = $("#{{ hg.name }}").text()#}
    //console.log('hgname:',hgname)
    var hgname = "{{ hg.name }}"
    var data = {"a": "{{ hg.name }}"}
    array_group_name.push(hgname)

    //console.log(data)
    var queryhg = $.ajax({
        type: "POST",
        url: "/queryhostgroup/",
        async: false,
        data: data,
        dataType: "json",

        success: function (ret) {
            //console.log('response hgname:', hgname)
            //console.log('response ip:', ret.host_ip)
            var hostip = ret.host_ip
            var dict_ip = {'ip':hostip}
            var arr = $.makeArray(hostip);
            //console.log('arr',hostip)

            //console.log('dict_ip===>',dict_ip)
            var array_ip_list = []
            for(var k in dict_ip) {
                //console.log('bianli====>', k.length, dict_ip[k])
                //var reg = new RegExp(",","g")
                //var aaa = dict_ip[k].toString().replace(reg,';')
                //console.log('aaa',typeof(aaa))
                //array_group_hostip.push(dict_ip[k])
                //array_group_hostip.push(aaa)
                //array_ip_list = dict_ip[k]
                //array_ip_list.push(dict_ip[k])
                //}

                //var tbBody = ""
{#                tbBody += "{% for hg in hostgroup %}<tr><td>" +#}
{#                            "{{ hg.id }}" + "</td><td>" +#}
{#                            "{{ hg.name }}" + "</td><td>" +#}
{#                            dict_ip[k] +#}
{#                            "</td></tr>{% endfor %}"#}

                //tbBody += "<tr><td>" + dict_ip[k] + "</td></tr>"
                //tbBody += dict_ip[k] + ","

            }
{#            var hostIPList = ""#}
{#            for(var i = 0;i < ret.host_ip.length;i++) {#}
{#                console.log('response ip:', ret.host_ip[i])#}
{##}
{#                hostIPList += ret.host_ip[i] + ","#}
{#                //}#}
{#                var tbBody = ""#}
{#                tbBody += "{% for hg in hostgroup %}<tr><td>" +#}
{#                            "{{ hg.id }}" + "</td><td>" +#}
{#                            "{{ hg.name }}" + "</td><td>" +#}
{#                            hostIPList +#}
{#                            "</td></tr>{% endfor %}"#}
{#            }#}


            array_ip_list.push(arr)
            //console.log('array_ip_list',array_ip_list)
            //console.log('tbBody',tbBody)
            //$("#result").html(tbBody)
            return arr


        }
    })

    //console.log('eval(queryhg)',(eval(queryhg).responseText))
    //console.log('eval(queryhg)',(eval(queryhg).responseText))
    var res_ip = eval(queryhg).responseText
    array_group_hostip.push(res_ip)
    {% endfor %}
    //console.log('array_group_name:',array_group_name)
    //console.log('array_group_hostip:',array_group_hostip)


　　 //$.each(array_group_hostip, function(i, item){
    var tbBody = ""
　　 $.each(array_group_hostip, function(i, item){
        console.log(i);    // 输出为0，1，2，因为这二维数组含有3个数组元素
        console.log(array_group_name[i])
        console.log(item); // 输出为  ['a', 'aa', 'aaa']，['b', 'bb', 'bbb']，['c', 'cc', 'ccc']
        tbBody += "<tbody><tr><td>" +
                    i + "</td><td>" +
                    array_group_name[i] + "</td><td>" +
                    item +
                    "</td></tr></tbody>"
    })
    $("#result").html("<table class='table table-bordered'><thead><tr><th width='20px'>#</th><th width='40px'>Name</th><th width='300px'>IP</th></tr></thead>"+tbBody+"</table>")
})