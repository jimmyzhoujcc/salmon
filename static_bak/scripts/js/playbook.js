function SaltCmd(){
    var tgt = $("#tgt").attr("value"); // 执行主机
    var fun = $("#fun").val(); // 下拉列表，执行模块
    //var expr_form = $("#expr_form").val(); // 匹配规则
    //var timeout = $("#timeout").attr("value"); // 执行超时时间
    var arg = $("#arg").attr("value");  // input，执行命令
    //var data = "fun=" + fun + "&arg=" + arg + "&tgt=" + tgt;
    //var data = { "fun": fun, "arg": arg, "tgt": tgt, 'expr_form':expr_form, 'timeout':timeout };
    //var data = {'n':'task#100000@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'};
    // var data = $.parseJSON({ "n":"task#100000@project","m": fun, "a": arg, "t": tgt});
    var data = JSON.stringify({ "n":"task#100000@project","m": fun, "a": arg, "t": tgt});
    var ingData = "<tr><td>1</td><td>" + tgt + "</td><td><img src='../static/images/loading1.gif' /></td><td><font color='green'><b>Running</b></td></tr>";
    $("#CmdRtList").html(ingData);
    $.ajax({
        type: "POST",
        url: "/run_playbook/",
        data: data,
        // dataType: "html",
        dataType : "json",
	success: function(msg){
        msg = JSON.parse(msg);
        // tbody = document.all.item("CmdRtList");
        // tbody.parentNode.outerHTML = tbody.parentNode.outerHTML.replace(tbody.innerHTML,"<tr><td>1</td><td>" + msg + "</td><td><font color='green'><b>success</b></td></tr>");
        var html = "";
        html = "<tr><td>1</td><td>" + msg + "</td><td><font color='green'><b>success</b></td></tr>"
        // var out = msg.find["stdout"] // pro为programmers的一个数组
        // for(int i = 0; i < pro.length; i++) { //循环后台传过来的Json数组
        //      var datas = pro[i];
        //      alert(pro.firstName);
        //      alert(pro.lastName);
        //      alert(pro.email);
        // }
        $("#ResJson").html(msg);
        // $("#ReqJson").html(msg);
        // $("#CmdRtList").html(msg);
	    },
	error:function(){
  	    alert("提示：执行错误！");
	    }
	});
       };


