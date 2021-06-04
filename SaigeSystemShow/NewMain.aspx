<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewMain.aspx.cs" Inherits="SaigeSystemShow.NewMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        @keyframes animation_meunitem_move {
            from {
                color: white;
            }

            to {
                color: red;
            }
        }

        @keyframes animation_meunitem_out {
            from {
                color: red;
            }

            to {
                color: white;
            }
        }


    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <img id="img_bg" style="position:absolute;left:0%;width:100%;top:0%; height:100%;" src="pic/background.png" />
         <!--div id="mask" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:darkblue;opacity:0.5"--><!--/div-->
        <div id="div_headeer" style="position:absolute;left:0%;width:100%;top:0%;height:80px;">
            <label id="login_name" style="position:absolute;left:85%;width:15%;top:35px;height:30px;font-size:25px;color:white; font-weight: bold; font-style: italic;">登录者</label>
            <label id="label_title" style="position:absolute;left:40%;width:20%;top:10px;height:40px;font-size:30px;text-align:center;color:white">赛格物业机电管控平台</label>
            <label id="label_time" style="position:absolute;left:1%;width:20%;top:35px;height:30px;font-size:18px;color:white;font-weight:bold;font-style:italic;">当前时间</label>
        </div>
        <div id="div_selector" style="position:absolute;left:0%;width:150px;top:8%;height:92%;background-color:#212C32"">

        </div>
        <div id="div_content" style="position:absolute;left:150px;right:0px;top:80px;bottom:0px;">
            <img id="div_content_bg" style="position:absolute;left:0%;width:100%;top:0%;height:100%" src="pic/background2.png"/>
            <label id="div_content_title" style="position:absolute;left:30%;width:40%;top:7%;height:35px;font-size:30px;text-align:center;color:white; font-family: 华文细黑;"></label>
            <div id="div_detail_content" style="position:absolute;left:0%;width:100%;top:13%;bottom:0px;">

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
<script src="privatefunction.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script>
       
    // 用读取ini的方式来进行页面的设计
    // 流程控制部分
    init();    // 初始化
    var select_list = Read_Selector();// 读取导航栏信息
    var select_json = From_Text_To_Json(select_list);

    // 实现导航栏操作
    for (var i = 0; i < select_json.length; i++)
    {
        var label = document.createElement("div");
        label.textContent = select_json[i].toString();
        label.id = "select_" + select_json[i].toString();
        label.style.position = "absolute";
        label.style.left = "0%";
        label.style.top = (80 * i+80).toString() + "px";
        label.style.width = "100%";
        label.style.color = "white";
        label.style.textAlign = "center";
        label.style.cursor = "pointer";
        label.onclick=function(event)
        {
            // 切换到相应画面
            var title = document.getElementById("div_content_title");
            title.textContent = Get_Xiahuaxian_String(event.currentTarget.id, 2);
            

            // 读取相应的界面并填充画面

            Read_View(Get_Xiahuaxian_String(event.currentTarget.id, 2), "div_detail_content");
        }
        
        $("#div_selector").append(label);
        Set_Animation_Select_Button(label.id);
    }
    


    // 初始化函数
    function init()
    {
        // 关于登录的用户名
        var username = getCookie("username");
        var label_name = document.getElementById("login_name");
        label_name.textContent = "登录用户：" + username;

        // 关于时钟计时
        setInterval(Time_Timer, 500);      
    }


    // 时钟计时的实现
    function Time_Timer() {
        var label_timer = document.getElementById("label_time");
        var time = new Date();
        label_timer.textContent = "当前时间：" + To_yyyy_MM_dd_HH_mm_ss_From_Data(time) + " " + Get_Week_Day(time.getDay().toString());
    }


    // 为选择导航选择设置动作
    function Set_Animation_Select_Button(controlname) {
        var label_overview = document.getElementById(controlname);
        label_overview.onmouseenter = function (event) {
            Set_Control_animation(event.currentTarget.id, "animation_meunitem_move 0.3s", "forwards");
        }

        label_overview.onmouseout = function (event) {
            Set_Control_animation(event.currentTarget.id, "animation_meunitem_out 0.3s", "forwards");
        }
    }


    // 读取导航信息
    
</script>
