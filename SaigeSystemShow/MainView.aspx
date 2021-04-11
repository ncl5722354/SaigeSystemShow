﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainView.aspx.cs" Inherits="SaigeSystemShow.MainView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>

        /* 左面选择菜单移入移出的动画*/
        @keyframes animation_meunitem_move {
            from {
                color: white;
                left: -10%;
            }

            to {
                color: red;
                left: 0%;
            }
        }

        @keyframes animation_meunitem_out {
            from {
                color: red;
                left: 0%;
            }

            to {
                color: white;
                left: -10%;
            }
        }

        /*边框移入移出的动画*/
        @keyframes animation_div_movein
        {
            from{
                border-color:#61C9D6;
            }
            to
            {
                border-color:white;
            }
        }

        @keyframes animation_div_out
        {
            from
            {
                border-color:white;
            }
            to
            {
                border-color:#61C9D6;
            }
        }


        /*字体移入移出的动画*/
        @keyframes animation_label_movein
        {
            from{
                color:#61C9D6;
            }
            to
            {
                color:white;
            }
        }

        @keyframes animation_label_out
        {
            from
            {
                color:white;
            }
            to
            {
                color:#61C9D6;
            }
        }

        /*滚动屏的动画*/
        @keyframes animation_roll_screen
        {
            from
            {
               top:0px;
               bottom:0px
            }
            to
            {
                top:-1000px;
                bottom:-1000px;
            }
        }



    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="overflow:hidden">
        <img id="img_bg" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/loginba.png" />
         <div id="mask" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:darkblue;opacity:0.5"></div>
        <div id="div_headeer" style="position:absolute;left:0%;width:100%;top:0%;height:80px;background-color:#178AB9">
            <label id="login_name" style="position:absolute;left:85%;width:15%;top:20px;height:30px;font-size:25px;color:white;">登录者</label>
            <label id="label_title" style="position:absolute;left:10%;width:30%;top:20px;height:40px;font-size:30px;text-align:center;color:white">赛格物业机电管控平台</label>
        </div>

        <label id="label_company" style="position:absolute;left:25%;width:50%;top:95%;height:30px;font-size:25px;color:white;text-align:center">深圳市赛格物业管理有限公司</label>
        <div id="div_menu" style="position:absolute;left:0%;width:15%;top:80px;bottom:0px;background-color:#212C32">
            <div id="div_overview" style="position:absolute;left:-10%;width:70%;top:30px;height:25px;font-size:20px;color:white;text-align:center">页面总览</div>
            <div id="div_data_collection" style="position:absolute;left:-10%;width:70%;top:105px;height:25px;font-size:20px;color:white;text-align:center;">数据采集</div>
        </div>

        <div id="device_overview" style="position:absolute;left:20%;width:20%;top:10%;height:25%;border-style:solid;border-color:#61C9D6;border-radius:5%;">
            <div id="back" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:black;opacity:0.5;border-radius:5%;"></div>
            <label id="label_deviceoverview_title" style="position:absolute;left:5%;width:50%;top:2%;height:15%;font-size:20px;color:#61C9D6;">设备总数量</label>
            <label id="label_deviceoverview_num" style="position:absolute;left:70%;width:20%;top:17%;height:30px;font-size:40px;color:#61C9D6;">1台</label>
            <label id="label_deviceonline_title" style="position:absolute;left:5%;width:50%;top:50%;height:15%;font-size:20px;color:#61C9D6;">设备在线数量</label>
            <label id="label_deviceonline_num" style="position:absolute;left:70%;width:20%;top:65%;height:30px;font-size:40px;color:#61C9D6;">1台</label>
        </div>


        <div id="device_project_info" style="position:absolute;left:45%;width:40%;top:10%;height:25%;border-style:solid;border-color:#61C9D6;border-radius:5%;overflow:hidden;">
             <div id="back1" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:black;opacity:0.5;border-radius:5%;"></div>
            <label id="label_device_project_info" style="position:absolute;left:5%;width:50%;top:2%;height:15%;font-size:20px;color:#61C9D6;">各项目设备信息</label>
            <div id="device_project_subdiv" style="position:absolute;left:0%;width:100%;top:20%;bottom:0px;overflow:hidden;">

            </div>
        </div>
       
    </div>
    </form>
</body>
</html>

<script src="js/jquery-3.5.1.js"></script>
<script type="text/javascript"></script>
<script src="viewfunction.js"></script>
<script src="DataGrid.js"></script>
<script src="json.js"></script>
<script src="String_Caozuo.js"></script>
<script src="sql_JS.js"></script>
<script src="cooket.js"></script>
<script src="Controler_Function.js"></script>
<script>

    var all_label = new Array(); // 所有在设备信息参与滚动的label名称数组
    function init()
    {
        var username = getCookie("username");

        var label_name = document.getElementById("login_name");
        label_name.textContent = "登录用户：" + username;

        var gundong_list = new Array();
        gundong_list.push("群星广场 1个设备");
        gundong_list.push("项目2 2个设备");
        gundong_list.push("项目2 2个设备");
        gundong_list.push("项目2 2个设备");
        gundong_list.push("项目2 2个设备");
        gundong_list.push("项目2 2个设备");
        gundong_list.push("项目2 2个设备");
        gundong_list.push("项目2 2个设备");
        gundong_list.push("项目2 2个设备");
        gundong_list.push("项目2 2个设备");
        gundong_list.push("项目2 2个设备");

        self.setInterval("device_info_rollscreen_clock()", gundong_list.length * 8000);

       

        var device_project_subdiv_view = document.getElementById("device_project_subdiv");

        for(var i=0;i<gundong_list.length;i++)
        {
            var label = document.createElement("label");
            label.style.position = "absolute";
            label.style.top = (i*30).toString()+"px";
            label.style.left = "5%";
            label.style.height = "30px";
            label.style.width = "90%";
            label.style.fontSize = "20px";
            label.textContent = gundong_list[i].toString();
            label.style.color = "#61C9D6";
            label.id = "label__device_project_info" + i.toString();
            device_project_subdiv_view.appendChild(label);
            all_label.push(label.id.toString());

            Set_Animation_Label(label.id);
        }

        
        device_project_subdiv_view.style.height = ((i + 1) * 30).toString() + "px";
        
        
      //Set_Control_animation_infinite("device_project_subdiv", "animation_roll_screen 10s", "forwards");
       
        


    }

    init();

    // 总览按钮设定
    // 动画设定
    Set_Animation_Select_Button("div_overview");
    Set_Animation_Select_Button("div_data_collection");
    Set_Animation_Div("device_overview");
    Set_Animation_Div("device_project_info");


    Set_Animation_Label("label_deviceoverview_title");
    Set_Animation_Label("label_deviceoverview_num");
    Set_Animation_Label("label_deviceonline_title");
    Set_Animation_Label("label_deviceonline_num");
    


    // 选择按钮动作的动画设定
    function Set_Animation_Select_Button(controlname)
    {
        var label_overview = document.getElementById(controlname);
        label_overview.onmouseenter = function (event) {
            Set_Control_animation(event.currentTarget.id, "animation_meunitem_move 0.3s", "forwards");
        }

        label_overview.onmouseout=function(event)
        {
            Set_Control_animation(event.currentTarget.id, "animation_meunitem_out 0.3s", "forwards");
        }
    }


    // 鼠标进入框体的动画设定
    function Set_Animation_Div(div_name)
    {
        var div = document.getElementById(div_name);

        div.onmouseenter=function(event)
        {
            Set_Control_animation(event.currentTarget.id, "animation_div_movein 0.3s", "forwards");
        }

        div.onmouseout=function(event)
        {
            Set_Control_animation(event.currentTarget.id, "animation_div_out 0.3s", "forwards");
        }
    }

    // 鼠标进入进出标签的动画设定
    function Set_Animation_Label(label_name) {
        var Label = document.getElementById(label_name);
        Label.onmouseenter = function (event) {
            Set_Control_animation(event.currentTarget.id, "animation_label_movein 0.3s", "forwards");
        }

        Label.onmouseout = function (event) {
            Set_Control_animation(event.currentTarget.id, "animation_label_out 0.3s", "forwards");
        }
    }


    
   
    
</script>
