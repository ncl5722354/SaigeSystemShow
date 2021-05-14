<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Elect_RealTime.aspx.cs" Inherits="SaigeSystemShow.Elect_RealTime" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="position:absolute;left:0%;top:0%;width:100%;height:100%;overflow:hidden;">
    <div  id="maindiv" style="position:absolute;left:0%;top:0%;width:100%;height:100%;overflow:hidden;">
        <img  id="img_background" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/background2.png"/>
        <label id="label_title" style="position:absolute;left:30%;width:40%;top:5%;font-size:40px;height:42px;text-align:center;color:white">供配电监测</label>
        
       <%-- <div id="elect_device_div1" style="position:absolute;left:5%;width:30%;height:40%;top:15%;"></div>
        <div id="elect_device_div2" style="position:absolute;left:35%;width:30%;height:40%;top:15%;"></div>
        <div id="elect_device_div3" style="position:absolute;left:65%;width:30%;height:40%;top:15%;"></div>--%>
        
        <div id="div_Substation_room" style="position:absolute;left:5%;width:25%;top:15%;height:30%">
            <img id="backgroud_Substation_room" style="position:absolute;left:0%;top:0%;width:100%;height:100%" src="pic/frame1.png"/>
            <img id="backgroud_Substation_room1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
            <label id="Substation_room_label" style="position:absolute;left:30%;width:40%;top:1%;height:20px;font-size:18px;text-align:center;color:white;">变压器房</label>
            <label id="Substartion_room_tempabc_Title" style="position:absolute;left:15%;width:40%;top:20%;height:25px;font-size:20px;text-align:center;color:white">变压器三相温度</label>
            <div id="Tempabc_div1" style="position:absolute;left:5%;width:95%;top:35%;height:25px;font-size:16px;text-align:center;color:white"></div>
            <label id="Substartion_room_roomtemp_Title" style="position:absolute;left:15%;width:40%;top:60%;height:25px;font-size:20px;text-align:center;color:white">变压器房温湿度</label>
            <div id="TempRoom_div1" style="position:absolute;left:5%;width:98%;top:75%;height:25px;font-size:20px;text-align:center;color:white">温度：20℃  湿度：10%</div>
        </div>

        <div id="div_Substation_room_vedio" style="position:absolute;left:5%;width:25%;top:65%;height:30%">
            <img id="backgroud_Substation_room_vedio" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
            <img id="backgroud_Substation_room_vedio1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
            <label id="Substation_room_vedio_label" style="position:absolute;left:30%;width:40%;top:3%;height:20px;font-size:15px;text-align:center;color:white;">变压器房监控</label>
            <video id="vedio_Substation_room_vedio" style="position:absolute;left:1%;width:98%;top:15%;height:84%"></video>
        </div>

        <div id="div_Low_voltage_Room" style="position:absolute;left:35%;width:25%;top:15%;height:30%">
            <img id="backgroud_low_voltage_room" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
             <img id="backgroud_low_voltage_room1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
            <label id="low_voltage_room_label" style="position:absolute;left:30%;width:40%;top:2%;height:20px;font-size:15px;text-align:center;color:white;">低压设备房</label>
            <label id="low_voltage_room_roomtemp_Title" style="position:absolute;left:15%;width:40%;top:60%;height:25px;font-size:20px;text-align:center;color:white">低压设备房温湿度</label>
            <div id="TempRoom_div2" style="position:absolute;left:1%;width:98%;top:76%;height:25px;font-size:20px;text-align:center;color:white">温度：21℃  湿度：40%</div>
        </div>


        <div id="div_low_voltage_room_vedio" style="position:absolute;left:35%;width:25%;top:65%;height:30%">
            <img id="backgroud_low_voltage_room_vedio" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
            <img id="backgroud_low_voltage_room_vedio1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
            <label id="low_voltage_room_vedio_label" style="position:absolute;left:30%;width:40%;top:3%;height:20px;font-size:15px;text-align:center;color:white;">低压设备房监控</label>
            <video id="vedio_voltage_room_room_vedio" style="position:absolute;left:1%;width:98%;top:15%;height:84%"></video>
        </div>


        <div id="div_Generator_room" style="position:absolute;left:65%;width:30%;top:15%;height:30%">
            <img id="background_Generator_room" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png" />
            <img id="background_Generator_room1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
             <label id="Generator_room_label" style="position:absolute;left:30%;width:40%;top:3%;height:20px;font-size:15px;text-align:center;color:white;">发电机组参数</label>
            <div id="elect_value1" style="position:absolute;left:0%;width:100%;top:5%;height:95%;">

            </div>
            <label id="Generator_status_title" style="position:absolute;left:50%;width:20%;top:80%;height:12px;font-size:10px;color:white;text-align:center">运行状态</label>
            <div id="bit_device_1" style="position:absolute;left:75%;width:3%;top:80%;height:5%;border-radius:100%;background-color:red"></div>
        </div>


        <div id="div_Generator_room_vedio" style="position:absolute;left:65%;width:25%;top:65%;height:30%">
            <img id="backgroud_Generator_room_vedio" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
            <img id="backgroud_Generator_room_vedio1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
            <label id="Generator_room_vedio_label" style="position:absolute;left:30%;width:40%;top:3%;height:20px;font-size:15px;text-align:center;color:white;">发电机监控</label>
            <video id="Generator_room_room_vedio" style="position:absolute;left:1%;width:98%;top:15%;height:84%"></video>
        </div>

        <div id="chart_datagrid_view" style="position:absolute;left:20%;width:60%;top:30%;height:60%;border-style:solid;border-width:2px;border-color:white;visibility:hidden;overflow:inherit">

             <img  id="sub_img_background" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/background2.png"/>
             
             <label id="sub_label_title" style="position:absolute;left:30%;width:40%;top:5%;font-size:40px;height:42px;text-align:center;color:white">历史数据</label>
              <label id="sub_chart_close" style="position:absolute;left:85%;width:15%;top:2%;height:20px;font-size:18px;text-align:center;color:white">关 闭</label>
              <div id="sub_chart_div" style="position:absolute;left:20%;width:60%;top:15%;height:84%;">

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
<script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>

<script>

    var elect_device_list = new Array();       // 保存电力设备列表
    var elect_temp_device_list = new Array();  // 保存电力温度设备列表
    var bit_device_list = new Array();         // 保存开关量设备列表




    function init()
    {

        elect_temp_device_list.push("设备20210429095350");

        Put_Elect_Temp_To_Divs(elect_temp_device_list, "Tempabc_div");


        // 电力
        elect_device_list.push("设备20210409224051");
        Put_Elect_Devices_To_Divs(elect_device_list, "elect_value");


        // 开关量
        bit_device_list.push("设备20210430112255_2");

        ///// 正泰电表系列
        //var elect_device_list_string = get_result_sql("select shebeiID from shebeitable where shebeizhongleiID=(select shebeizhongleiID from shebeizhongleitable where shebeizhongleiname=\"正泰电表\")");
        //var elect_device_list_json = From_Text_To_Json(elect_device_list_string);
        //for(var i=0;i<elect_device_list_json.length;i++)
        //{
        //    elect_device_list.push(elect_device_list_json[i]);
        //}

        
        //// 正泰电力温度系列
        //var elect_temp_device_list_string = get_result_sql("select shebeiID from shebeitable where shebeizhongleiID=(select shebeizhongleiID from shebeizhongleitable where shebeizhongleiname=\"正泰三相温度表\")")
        //var elect_temp_device_list_json = From_Text_To_Json(elect_temp_device_list_string);

        //for (var i = 0; i < elect_temp_device_list_json.length; i++)
        //{
        //    elect_temp_device_list.push(elect_temp_device_list_json[i]);
        //}
       

        //Put_Elect_Devices_To_Divs(elect_device_list, "elect_device_div");
        //Put_Elect_Temp_To_Divs(elect_temp_device_list, "elect_device_div");
        //alert(elect_device_list);

        Elect_Devices_Tick();
        setInterval(Elect_Devices_Tick, 20000);

        Elect_Temp_Device_Tick();
        setInterval(Elect_Temp_Device_Tick, 20000);

        Bit_Deivce_Tick();
        setInterval(Bit_Deivce_Tick, 20000);

        var sub_chart_close = document.getElementById("sub_chart_close");
        sub_chart_close.onclick=function(event)
        {
            var sub_div = document.getElementById("chart_datagrid_view");
            sub_div.style.visibility = "hidden";
        }

       
        // Play_Vedio("192.168.1.2", "vedio_Substation_room_vedio");


    }

    init();


    // 把几个电表的内容放进相应的框框内
    function Put_Elect_Devices_To_Divs(list,div_name_head)
    {
        for (var i = 0; i < list.length; i++) {
            
            var contect_div = document.getElementById(div_name_head + (i+1).toString());

            contect_div.innerHTML = "";

            // 放入图片
            var back_framk_img = document.createElement("img");
            back_framk_img.style.left = "0%";
            back_framk_img.style.top = "0%";
            back_framk_img.style.width = "100%";
            back_framk_img.style.height = "100%";
            back_framk_img.src = "pic//frame2.png";
            contect_div.appendChild(back_framk_img);


            // 能源消耗标题
            var label_energy_cost_title = document.createElement("label");
            label_energy_cost_title.style.position = "absolute";
            label_energy_cost_title.style.left = "15%";
            label_energy_cost_title.style.width = "20%";
            label_energy_cost_title.style.top = "15%";
            label_energy_cost_title.style.height = "20px";
            label_energy_cost_title.style.fontSize = "18px";
            label_energy_cost_title.textContent = "能源消耗";
            label_energy_cost_title.style.color = "white";
            label_energy_cost_title.style.textAlign = "center";
           

            contect_div.appendChild(label_energy_cost_title);

            // 能源消耗部分

            var label_energy_cost = document.createElement("label");
           
            label_energy_cost.style.position = "absolute";
            label_energy_cost.style.left = "10%";
            label_energy_cost.style.width = "30%";
            label_energy_cost.style.top = "30%";
            label_energy_cost.style.height = "40px";
            label_energy_cost.style.fontSize = "38px";
            label_energy_cost.textContent = "0";
            label_energy_cost.id = div_name_head + "_" + list[i].toString() + "_energy_cost";
            label_energy_cost.style.color = "white";
            label_energy_cost.style.textAlign = "center";
            label_energy_cost.onclick=function(event)
            {
                var line_grid_view = document.getElementById("chart_datagrid_view");
                line_grid_view.style.visibility = "visible";
                
                var sub_lind_view = document.getElementById("sub_chart_div");
                
                sub_lind_view.innerHTML = "";

                var canvas = document.createElement("canvas");
                canvas.style.left = "0%";
                canvas.style.width = "100%";
                canvas.style.top = "0%";
                canvas.style.heigh = "100%";
                canvas.style.position = "absolute";
                canvas.id = "sub_line_canvas";
                sub_lind_view.appendChild(canvas);

                var line_object;

                var thisid=event.target.id;

                //  从历史中读取
                var value_time_string = get_result_sql("select value,savetime from history_save where device_id=\""+  Get_Xiahuaxian_String(thisid,3)+"\" and value_id = (select canshutypeid from canshutable where canshutype=\"正向有功总电能\")");
                var value_time_json = From_Text_To_Json(value_time_string);

                var value_list = new Array();
                var time_list = new Array();

                var count = value_time_json.length;

                if (count >= 30) count = 30;
                for(var i=0;i<count;i++)
                {
                    value_list.push([value_time_json[i][0]]);
                    time_list.push([value_time_json[i][1]]);
                }


                Show_Line(line_object, value_list, time_list, "sub_line_canvas");

                // 画曲线


            }


            contect_div.appendChild(label_energy_cost);

            // 电压

            var Uabc_div = document.createElement("div");
            
            Uabc_div.style.position = "absolute";
            Uabc_div.style.left = "35%";
            Uabc_div.style.width = "65%";
            Uabc_div.style.top = "15%";
            Uabc_div.style.height = "15%";
            contect_div.appendChild(Uabc_div);


            var Uabc_title = document.createElement("label");
            Uabc_title.style.position = "absolute";
            Uabc_title.style.left = "5%";
            Uabc_title.style.width = "40%";
            Uabc_title.style.top = "5%";
            Uabc_title.style.height = "15px";
            Uabc_title.style.fontSize = "12px";
            Uabc_title.style.color = "white";
            Uabc_title.textContent = "三相电压（V）";
            Uabc_div.appendChild(Uabc_title);

            var label_Uabc = document.createElement("label");
            label_Uabc.style.position = "absolute";
            label_Uabc.style.left = "0%";
            label_Uabc.style.width = "100%";
            label_Uabc.style.top = "50%";
            label_Uabc.style.height = "15px";
            label_Uabc.style.fontSize = "13px";
            label_Uabc.textContent = "0";
            label_Uabc.id = div_name_head +"_"+ list[i].toString() + "_Uabc";
            label_Uabc.style.color = "white";
            label_Uabc.style.textAlign = "center";
            Uabc_div.appendChild(label_Uabc);


            // 电流
            var Iabc_div = document.createElement("div");
            Iabc_div.style.position = "absolute";
            Iabc_div.style.left = "35%";
            Iabc_div.style.width = "65%";
            Iabc_div.style.top = "30%";
            Iabc_div.style.height = "15%";
            contect_div.appendChild(Iabc_div);

            var Iabc_title = document.createElement("label");
            Iabc_title.style.position = "absolute";
            Iabc_title.style.left = "5%";
            Iabc_title.style.width = "40%";
            Iabc_title.style.top = "5%";
            Iabc_title.style.height = "15px";
            Iabc_title.style.fontSize = "12px";
            Iabc_title.style.color = "white";
            Iabc_title.textContent = "三相电流（I）";
            Iabc_div.appendChild(Iabc_title);

            var label_Iabc = document.createElement("label");
            label_Iabc.style.position = "absolute";
            label_Iabc.style.left = "10%";
            label_Iabc.style.width = "80%";
            label_Iabc.style.top = "50%";
            label_Iabc.style.height = "15px";
            label_Iabc.style.fontSize = "13px";
            label_Iabc.textContent = "0";
            label_Iabc.id = div_name_head+"_" + list[i].toString() + "_Iabc";
            label_Iabc.style.color = "white";
            label_Iabc.style.textAlign = "center";
            Iabc_div.appendChild(label_Iabc);

            // 功率
            var Power_Rate_div = document.createElement("div");
            Power_Rate_div.style.position = "absolute";
            Power_Rate_div.style.left = "35%";
            Power_Rate_div.style.width = "65%";
            Power_Rate_div.style.top = "45%";
            Power_Rate_div.style.height = "15%";
            contect_div.appendChild(Power_Rate_div);

            var Power_Rate_title = document.createElement("label");
            Power_Rate_title.style.position = "absolute";
            Power_Rate_title.style.left = "5%";
            Power_Rate_title.style.width = "40%";
            Power_Rate_title.style.top = "5%";
            Power_Rate_title.style.height = "15px";
            Power_Rate_title.style.fontSize = "12px";
            Power_Rate_title.style.color = "white";
            Power_Rate_title.textContent = "功率";
            Power_Rate_div.appendChild(Power_Rate_title);

            var label_Power_Rate = document.createElement("label");
            label_Power_Rate.style.position = "absolute";
            label_Power_Rate.style.left = "10%";
            label_Power_Rate.style.width = "80%";
            label_Power_Rate.style.top = "50%";
            label_Power_Rate.style.height = "15px";
            label_Power_Rate.style.fontSize = "13px";
            label_Power_Rate.textContent = "0";
            label_Power_Rate.id = div_name_head+"_" + list[i].toString() + "_Power_Rate";
            label_Power_Rate.style.color = "white";
            label_Power_Rate.style.textAlign = "center";
            Power_Rate_div.appendChild(label_Power_Rate);

            // 转换因数
            var Conversion_Factor_div = document.createElement("div");
            Conversion_Factor_div.style.position = "absolute";
            Conversion_Factor_div.style.left = "35%";
            Conversion_Factor_div.style.width = "65%";
            Conversion_Factor_div.style.top = "60%";
            Conversion_Factor_div.style.height = "15%";
            contect_div.appendChild(Conversion_Factor_div);

            var Conversion_Factor_title = document.createElement("label");
            Conversion_Factor_title.style.position = "absolute";
            Conversion_Factor_title.style.left = "5%";
            Conversion_Factor_title.style.width = "40%";
            Conversion_Factor_title.style.top = "5%";
            Conversion_Factor_title.style.height = "15px";
            Conversion_Factor_title.style.fontSize = "12px";
            Conversion_Factor_title.style.color = "white";
            Conversion_Factor_title.textContent = "转换因数";
            Conversion_Factor_div.appendChild(Conversion_Factor_title);

            var label_Conversion_Factor = document.createElement("label");
            label_Conversion_Factor.style.position = "absolute";
            label_Conversion_Factor.style.left = "10%";
            label_Conversion_Factor.style.width = "80%";
            label_Conversion_Factor.style.top = "50%";
            label_Conversion_Factor.style.height = "15px";
            label_Conversion_Factor.style.fontSize = "13px";
            label_Conversion_Factor.textContent = "0";
            label_Conversion_Factor.id = div_name_head +"_" + list[i].toString() + "_Conversion_Factor";
            label_Conversion_Factor.style.color = "white";
            label_Conversion_Factor.style.textAlign = "center";
            Conversion_Factor_div.appendChild(label_Conversion_Factor);



            // 表名
            var Temp_Device_Title = document.createElement("label");
            Temp_Device_Title.style.position = "absolute";
            Temp_Device_Title.style.left = "5%";
            Temp_Device_Title.style.width = "40%";
            Temp_Device_Title.style.top = "75%";
            Temp_Device_Title.style.heigh = "20px";
            Temp_Device_Title.style.fontSize = "18px";
            Temp_Device_Title.style.textAlign = "center";
            Temp_Device_Title.id = div_name_head+"_" + list[i].toString() + "_Title";
            Temp_Device_Title.style.color = "white";
            contect_div.appendChild(Temp_Device_Title);

        }
    }



    // 三相温度
    function Put_Elect_Temp_To_Divs(list,div_name_head)
    {
        for (var i = 0; i < list.length; i++) {

            var contect_div = document.getElementById(div_name_head + (i + 1).toString());
            // 三相温度
            var Temp_abc_div = document.createElement("label");
            Temp_abc_div.style.position = "absolute";
            Temp_abc_div.style.left = "0%";
            Temp_abc_div.style.width = "100%";
            Temp_abc_div.style.top = "0%";
            Temp_abc_div.style.height = "100%";
            contect_div.appendChild(Temp_abc_div);

            //var Temp_abc_Title = document.createElement("label");
            //Temp_abc_Title.style.position = "absolute";
            //Temp_abc_Title.style.left = "5%";
            //Temp_abc_Title.style.width = "40%";
            //Temp_abc_Title.style.top = "5%";
            //Temp_abc_Title.style.height = "15px";
            //Temp_abc_Title.style.fontSize = "12px";
            //Temp_abc_Title.style.color = "white";
            //Temp_abc_Title.textContent = "电力三相温度（℃）"
            //Temp_abc_div.appendChild(Temp_abc_Title);


            var label_Temp_abc = document.createElement("label");
            label_Temp_abc.style.position = "absolute";
            label_Temp_abc.style.left = "10%";
            label_Temp_abc.style.width = "80%";
            label_Temp_abc.style.top = "0%";
            label_Temp_abc.style.height = "25px";
            label_Temp_abc.style.fontSize = "20px";
            label_Temp_abc.style.textAlign = "center";
            label_Temp_abc.id = div_name_head + list[i].toString() + "_Temp_abc";
            label_Temp_abc.style.color = "white";
            label_Temp_abc.style.textAlign = "center";
            Temp_abc_div.appendChild(label_Temp_abc);
        }
    }

    // 电功能表的更新
    function Elect_Devices_Tick() {
        for (var i = 0; i < elect_device_list.length; i++) {

            var shebeiId = elect_device_list[i].toString();
            // 用电量

            var label_elect_cost_id = "elect_value_" + shebeiId + "_energy_cost";
            var sql_elect_cost = "select value5 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_elect_cost, label_elect_cost_id);
            

            var label_Uabc_id = "elect_value_" + shebeiId + "_Uabc";
            var sql_Uabc = "select value1 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            //get_result_sql_to_labelcontent(sql_Uabc, label_Uabc_id);

            var Uabc_value_string = get_result_sql(sql_Uabc);
            var Uabc_value_json = From_Text_To_Json(Uabc_value_string);
            var label_Uabc = document.getElementById(label_Uabc_id);
            label_Uabc.textContent  = "A：" + Get_Kongge_String(Uabc_value_json[0].toString(), 1) + "   " + "B：" + Get_Kongge_String(Uabc_value_json[0].toString(), 2) + "   " + "C：" + Get_Kongge_String(Uabc_value_json[0].toString(), 3);

            

            var label_Iabc_id = "elect_value_" + shebeiId + "_Iabc";
            var sql_Iabc = "select value2 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_Iabc, label_Iabc_id);
            
            var label_Power_Rate_id = "elect_value_" + shebeiId + "_Power_Rate";
            var sql_Power_Rate = "select value3 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_Power_Rate, label_Power_Rate_id);
            

            var label_Conversion_Factor = "elect_value_" + shebeiId + "_Conversion_Factor";
            var sql_Conversion_Factor = "select value4 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_Conversion_Factor, label_Conversion_Factor);
            
            var label_Title = "elect_value_" + shebeiId + "_Title";
            var sql_Device_Name = "select shebeiname from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_Device_Name, label_Title);
            
        }
    }


    // 电温度表的更新

    function Elect_Temp_Device_Tick()
    {
        for(var i=0;i<elect_temp_device_list.length;i++)
        {
            var device_id = elect_temp_device_list[i].toString();

            // 三相温度
            var label_elect_temp_abc_id = "Tempabc_div" + device_id + "_Temp_abc";
            var sql_Temp_abc = "select value1 from shebeitable where shebeiID=\"" + device_id + "\"";
            var temp_abc_string = get_result_sql(sql_Temp_abc);
            var temp_abc_json = From_Text_To_Json(temp_abc_string);
            var temp_string = temp_abc_json[0].toString();
            var label = document.getElementById(label_elect_temp_abc_id);
            label.textContent = "A相:" + Get_Kongge_String(temp_string, 1) + "℃\xa0\xa0" + "B相:" + Get_Kongge_String(temp_string, 2) + "℃\xa0\xa0" + "C相:" + Get_Kongge_String(temp_string, 3) + "℃";

           // get_result_sql_to_labelcontent(sql_Temp_abc, label_elect_temp_abc_id);
        }
    }


    // 开关量
    function Bit_Deivce_Tick()
    {
        for(var i=0;i<bit_device_list.length;i++)
        {
            var id = bit_device_list[i].toString();

            var Bit_Deivce_id = Get_Xiahuaxian_String(id, 1);
            var index = Get_Xiahuaxian_String(id, 2);

            var Bit_Sql = "select value1 from shebeitable where shebeiID=\"" + Bit_Deivce_id + "\"";

            var bit_value_string = get_result_sql(Bit_Sql);

            var bit_value_json = From_Text_To_Json(bit_value_string);

            var bit_value = bit_value_json[0].toString();

            var index_int = parseInt(index);

            var bit = Get_Kongge_String(bit_value, index_int);

            var div= document.getElementById("bit_device_"+(i+1).toString());

            if (bit == "0")
                div.style.backgroundColor = "red";
            if (bit == "1")
                div.style.backgroundColor = "yellow";

                
        }
    }



</script>
