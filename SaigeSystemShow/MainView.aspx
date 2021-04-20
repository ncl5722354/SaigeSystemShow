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
        <img id="img_bg" style="position:absolute;left:0%;width:100%;top:0%; height:100%;" src="pic/loginba.png" />
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
            <label id="label_deviceoverview_num" style="position:absolute;left:60%;width:40%;top:17%;height:30px;font-size:40px;color:#61C9D6;">##台</label>
            <label id="label_deviceonline_title" style="position:absolute;left:5%;width:50%;top:50%;height:15%;font-size:20px;color:#61C9D6;">设备在线数量</label>
            <label id="label_deviceonline_num" style="position:absolute;left:60%;width:40%;top:65%;height:30px;font-size:40px;color:#61C9D6;">##台</label>
        </div>


        <div id="device_project_info" style="position:absolute;left:45%;width:35%;top:10%;height:25%;border-style:solid;border-color:#61C9D6;border-radius:5%;overflow:hidden;">
             <div id="back1" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:black;opacity:0.5;border-radius:5%;"></div>
            <label id="label_device_project_info" style="position:absolute;left:5%;width:50%;top:2%;height:15%;font-size:20px;color:#61C9D6;">各项目在线信息</label>
            <div id="context_div" style="position:absolute;left:0%;width:100%;top:20%;bottom:0px;overflow:hidden;">
               <div id="device_project_subdiv"  style="position:absolute;left:0%;width:100%;top:0px;bottom:0px;">

               </div>
            </div>
        </div>

        <div id="warning_info" style="position:absolute;left:45%;width:35%;top:40%;height:25%;border-style:solid;border-color:#61C9D6;border-radius:5%;overflow:hidden;">
            <div id="back2" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:black;opacity:0.5;border-radius:5%;"></div>
                <label id="label_warning_info" style="position:absolute;left:0%;width:60%;top:2%;height:15%;font-size:20px;color:#61C9D6;text-align:center">报警信息</label>
                <label id="label_warninig_time" style="position:absolute;left:60%;width:40%;top:2%;height:15%;font-size:20px;color:#61C9D6;text-align:center">报警时间</label>
                <div id="warning_info_context_div" style="position:absolute;left:0%;width:100%;top:20%;bottom:0px;overflow:hidden">
                <div id="warning_info_subdiv" style="position:absolute;left:0%;width:100%;top:0px;bottom:0px">

                </div>
                </div>
            
        </div>
       

        <div id="device_energy_cost" style="position:absolute;left:20%;width:20%;top:40%;height:25%;border-style:solid;border-color:#61C9D6;border-radius:5%;overflow:hidden">
            <div id="back3" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:black;opacity:0.5;border-radius:5%;"></div>
            <label id="label_energy_title" style="position:absolute;left:10%;width:30%;top:5%;height:15px;font-size:15px;color:#61C9D6">能源概况</label>
            <label id="label_today_energy_title" style="position:absolute;left:1%;width:30%;top:30%;height:15px;font-size:15px;color:#61C9D6">今日能源消耗</label>
            <label id="label_today_energy" style="position:absolute;left:35%;width:60%;top:25%;height:30px;font-size:28px;color:#F2B828;text-align:center">3256</label>
            <label id="label_month_energy_title" style="position:absolute;left:1%;width:30%;top:50%;height:15px;font-size:15px;color:#61C9D6">本月能源消耗</label>
            <label id="label_month_energy" style="position:absolute;left:35%;width:60%;top:45%;height:30px;font-size:28px;color:#F2B828;text-align:center">70782</label>
        </div>

        <div id="pie_device_online_div" style="position:absolute;left:85%;width:13%;top:10%;height:25%;border-style:solid;border-color:#61C9D6;border-radius:5%;overflow:inherit">
            <div id="back4" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:black;opacity:0.5;border-radius:5%;"></div>
                <label id="pie_device_onliee_title" style="position:absolute;left:0%;width:100%;top:10%;height:20%;text-align:center;font-size:15px;color:white">在线项目示意</label>
                <canvas id="pie_device_online" style="position:absolute;left:0%;width:100%;top:30%;height:65%;">

                </canvas>
            
        </div>


        <div id="Doughnut_device_online_div" style="position:absolute;left:85%;width:13%;top:40%;height:25%;border-style:solid;border-color:#61C9D6;border-radius:5%;overflow:inherit">
            <div id="back6" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:black;opacity:0.5;border-radius:5%;"></div>
             <label id="goughnut_device_onliee_title2" style="position:absolute;left:0%;width:100%;top:10%;height:20%;text-align:center;font-size:15px;color:white">在线设备示意</label>
            <canvas id="doughunt_device_online" style="position:absolute;left:0%;width:100%;top:30%;height:65%;">

                </canvas>
        </div>

        <div id="line_energy_cowst" style="position:absolute;left:20%;width:70%;top:70%;height:20%;border-style:solid;border-color:#61C9D6;border-radius:5%;overflow:inherit">
            <div id="back5" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:white;opacity:0.7;border-radius:5%;"> </div>
             <label id="line_energy_cost_title" style="position:absolute;left:0%;width:100%;top:10%;height:20%;text-align:center;font-size:15px;color:black">能源监测</label>
                <canvas id="line_energy_cost" style="position:absolute;left:0%;width:100%;top:30%;height:65%;color:white">

                </canvas>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script>

    // 全局数量
    var Pie_Project_Online;
    var Doughnut_Project_Online;


    
    function init()
    {
        var username = getCookie("username");

        var label_name = document.getElementById("login_name");
        label_name.textContent = "登录用户：" + username;




       


        // 各项目的在线情况

        Project_Online_Tick();
        Device_Num_And_Online_Tick();



        var project_online_timer = setInterval(Project_Online_Tick, 30000);         // 更新项目的在线情况


        var device_online_timer = setInterval(Device_Num_And_Online_Tick, 30000);    // 更新设备的在线情况





        // 实时更新设备数量与在线情况




        
        
        Set_Sroll_Div_In_Div("device_project_subdiv");


        var warning_list = new Array();

        var warn1 = new Array();
        warn1.push("故障1");
        warn1.push("2021-04-14 00:00:02");

        var warn2 = new Array();
        warn2.push("故障2");
        warn2.push("2021-04-14 00:00:03");

        var warn3 = new Array();
        warn3.push("故障3");
        warn3.push("2021-04-14 00:00:03");
      
        warning_list.push(warn1);
        warning_list.push(warn2);
        warning_list.push(warn3);

        var width_list = new Array();
        width_list.push("60%");
        width_list.push("40%");

        var left_list = new Array();
        left_list.push("0%");
        left_list.push("60%");

        Put_Table_Label_In_Div(warning_list, left_list, width_list, "warning_info_subdiv");

        Set_Sroll_Div_In_Div("warning_info_subdiv");
       
         


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

    Set_Animation_Label("label_energy_title");
    Set_Animation_Label("label_today_energy_title");
    Set_Animation_Label("label_month_energy_title");

    
    // 动画限定的函数

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




    

    //var myradarchart;

    //var value_array=new Array();
    //value_array.push(30);
    //value_array.push(100);

    //var color_array=new Array();
    //color_array.push("red");
    //color_array.push("blue");

    //var label_array = new Array();
    //label_array.push("不在线");
    //label_array.push("在线");

    //var high_array = new Array();
    //high_array.push("#550000");
    //high_array.push("#000055");

    
    //var myradarline;

    //var point1 = [1125];
    //var point2 = [1245];
    //var point3 = [1752];
    //var point4 = [1532];
    //var point5 = [1500];
    //var point6 = [1800];

    //var point_list = new Array();
    //point_list.push(point1);
    //point_list.push(point2);
    //point_list.push(point3);
    //point_list.push(point4);
    //point_list.push(point5);
    //point_list.push(point6);


    //var datetime_list = new Array();
    //datetime_list.push("2021-04-01");
    //datetime_list.push("2021-04-02");
    //datetime_list.push("2021-04-03");
    //datetime_list.push("2021-04-04");
    //datetime_list.push("2021-04-05");
    //datetime_list.push("2021-04-06");



    //Show_Pie(myradarchart, value_array, color_array, high_array, label_array, "pie_device_online");
    //Show_Doughnut(myradarchart, value_array, color_array, high_array, label_array, "doughunt_device_online");

    //Show_Line(myradarline, point_list,datetime_list, "line_energy_cost");
    
    // 在线项目相关
    function Project_Online_Tick()
    {
        // 从数据库中读出项目的在线消息
        // 先读出所有的项目 再从项目是否在线的表里找到是否在线

        var online_count = 0;             // 在线的数目
        var offline_count = 0;            // 离线的数目
        
        try
        {
            // 滚动图表 
            var onlinelist_str = get_result_sql("SELECT xiangmuID,xiangmuname,onlinetime FROM saigedatabase.xiangmuguanlitable left join saigedatabase.project_online on xiangmuguanlitable.xiangmuID=project_online.ProjectID");
            var json_object = From_Text_To_Json(onlinelist_str);

            var show_list = new Array();


            for (var i = 0; i < json_object.length; i++) {

                var item = new Array();
                var time_str = json_object[i][2].toString();
                var time = Date.parse(time_str);

                //  var online_is= json_object[i][1].toString()+" ";

                item.push(json_object[i][1].toString());

                var nowtime = new Date();

                if (Math.abs(parseInt(time - nowtime) / 1000 / 60) > 1) {
                    //  online_is = online_is + "不在线";
                    offline_count++;
                    item.push("不在线");
                }


                if (Math.abs(parseInt(time - nowtime) / 1000 / 60) <= 1) {
                    online_count++;
                    item.push("在线");
                }

                if (time_str == "") {
                    offline_count++;
                    item.push("不在线");
                }
                show_list.push(item);
            }

            var left_array = new Array();
            left_array.push("0%");
            left_array.push("60%");

            var width_array = new Array();
            width_array.push("60%");
            width_array.push("40%");

            Put_Table_Label_In_Div(show_list, left_array, width_array, "device_project_subdiv");

            var value_array=new Array();
            value_array.push(online_count);
            value_array.push(offline_count);

            var color_array=new Array();
            color_array.push("blue");
            color_array.push("red");

            var label_array = new Array();
            label_array.push("在线项目");
            label_array.push("离线项目");

            Show_Pie(Pie_Project_Online, value_array, color_array, color_array, label_array, "pie_device_online");
            
        }
        catch(err){}
    }

    // 在线设备数相关
    function Device_Num_And_Online_Tick()
    {
        var Device_Num_Label = document.getElementById("label_deviceoverview_num");
        var Device_Online_Num_Label = document.getElementById("label_deviceonline_num");


        var device_list_str = get_result_sql("SELECT * FROM saigedatabase.shebeitable;");
        var device_list_json = From_Text_To_Json(device_list_str);

        Device_Num_Label.textContent = device_list_json.length.toString() + "台";


        var nowtime = new Date();

        var lasttime = new Date();

         lasttime.setMinutes(lasttime.getMinutes() - 3);

         var lasttime_string = To_yyyy_MM_dd_HH_mm_ss_From_Data(lasttime);

         var device_online_list_str = get_result_sql("select * from shebeitable where value10>=\"" + lasttime_string + "\"");

         var device_online_list_json = From_Text_To_Json(device_online_list_str);

         Device_Online_Num_Label.textContent = device_online_list_json.length.toString() + "台";

         var online_devices = device_online_list_json.length;

         var offline_devices = device_list_json.length - device_online_list_json.length;


         var value_array = new Array();
         value_array.push(online_devices.toString());
         value_array.push(offline_devices.toString());


         var color_array=new Array();
         color_array.push("blue");
         color_array.push("red");

         var label_array = new Array();
         label_array.push("在线设备");
         label_array.push("离线设备");

        

         Show_Doughnut(Doughnut_Project_Online, value_array, color_array, color_array, label_array, "doughunt_device_online");


    }



   
</script>
