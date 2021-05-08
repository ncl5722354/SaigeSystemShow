﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Elect_RealTime.aspx.cs" Inherits="SaigeSystemShow.Elect_RealTime" %>

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
        <label id="label_title" style="position:absolute;left:30%;width:40%;top:5%;font-size:40px;height:42px;text-align:center;color:white">电力系统实时监测</label>
        
        <div id="elect_device_div1" style="position:absolute;left:5%;width:30%;height:40%;top:15%;"></div>
        <div id="elect_device_div2" style="position:absolute;left:35%;width:30%;height:40%;top:15%;"></div>
        <div id="elect_device_div3" style="position:absolute;left:65%;width:30%;height:40%;top:15%;"></div>

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

    var elect_device_list = new Array();       // 保存电力设备列表
    var elect_temp_device_list = new Array();  // 保存电力温度设备列表


    function init()
    {

        /// 正泰电表系列
        var elect_device_list_string = get_result_sql("select shebeiID from shebeitable where shebeizhongleiID=(select shebeizhongleiID from shebeizhongleitable where shebeizhongleiname=\"正泰电表\")");
        var elect_device_list_json = From_Text_To_Json(elect_device_list_string);
        for(var i=0;i<elect_device_list_json.length;i++)
        {
            elect_device_list.push(elect_device_list_json[i]);
        }

        
        // 正泰电力温度系列
        var elect_temp_device_list_string = get_result_sql("select shebeiID from shebeitable where shebeizhongleiID=(select shebeizhongleiID from shebeizhongleitable where shebeizhongleiname=\"正泰三相温度表\")")
        var elect_temp_device_list_json = From_Text_To_Json(elect_temp_device_list_string);

        for (var i = 0; i < elect_temp_device_list_json.length; i++)
        {
            elect_temp_device_list.push(elect_temp_device_list_json[i]);
        }
       

        Put_Elect_Devices_To_Divs(elect_device_list, "elect_device_div");
        Put_Elect_Temp_To_Divs(elect_temp_device_list, "elect_device_div");
        //alert(elect_device_list);

        Elect_Devices_Tick();
        setInterval(Elect_Devices_Tick, 20000);

        Elect_Temp_Device_Tick();
        setInterval(Elect_Temp_Device_Tick, 20000);
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
            label_energy_cost_title.style.textAlign="center";

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
            label_energy_cost.id = div_name_head + list[i].toString() + "_energy_cost";
            label_energy_cost.style.color = "white";
            label_energy_cost.style.textAlign = "center";
            contect_div.appendChild(label_energy_cost);

            // 电压

            var Uabc_div = document.createElement("div");
            
            Uabc_div.style.position = "absolute";
            Uabc_div.style.left = "50%";
            Uabc_div.style.width = "50%";
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
            label_Uabc.id = div_name_head + list[i].toString() + "_Uabc";
            label_Uabc.style.color = "white";
            label_Uabc.style.textAlign = "center";
            Uabc_div.appendChild(label_Uabc);


            // 电流
            var Iabc_div = document.createElement("div");
            Iabc_div.style.position = "absolute";
            Iabc_div.style.left = "50%";
            Iabc_div.style.width = "50%";
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
            label_Iabc.id = div_name_head + list[i].toString() + "_Iabc";
            label_Iabc.style.color = "white";
            label_Iabc.style.textAlign = "center";
            Iabc_div.appendChild(label_Iabc);

            // 功率
            var Power_Rate_div = document.createElement("div");
            Power_Rate_div.style.position = "absolute";
            Power_Rate_div.style.left = "50%";
            Power_Rate_div.style.width = "50%";
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
            label_Power_Rate.id = div_name_head + list[i].toString() + "_Power_Rate";
            label_Power_Rate.style.color = "white";
            label_Power_Rate.style.textAlign = "center";
            Power_Rate_div.appendChild(label_Power_Rate);

            // 转换因数
            var Conversion_Factor_div = document.createElement("div");
            Conversion_Factor_div.style.position = "absolute";
            Conversion_Factor_div.style.left = "50%";
            Conversion_Factor_div.style.width = "50%";
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
            label_Conversion_Factor.id = div_name_head + list[i].toString() + "_Conversion_Factor";
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
            Temp_Device_Title.id = div_name_head + list[i].toString() + "_Title";
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
            Temp_abc_div.style.left = "50%";
            Temp_abc_div.style.width = "50%";
            Temp_abc_div.style.top = "75%";
            Temp_abc_div.style.height = "15%";
            contect_div.appendChild(Temp_abc_div);

            var Temp_abc_Title = document.createElement("label");
            Temp_abc_Title.style.position = "absolute";
            Temp_abc_Title.style.left = "5%";
            Temp_abc_Title.style.width = "40%";
            Temp_abc_Title.style.top = "5%";
            Temp_abc_Title.style.height = "15px";
            Temp_abc_Title.style.fontSize = "12px";
            Temp_abc_Title.style.color = "white";
            Temp_abc_Title.textContent = "电力三相温度（℃）"
            Temp_abc_div.appendChild(Temp_abc_Title);


            var label_Temp_abc = document.createElement("label");
            label_Temp_abc.style.position = "absolute";
            label_Temp_abc.style.left = "10%";
            label_Temp_abc.style.width = "80%";
            label_Temp_abc.style.top = "50%";
            label_Temp_abc.style.height = "15px";
            label_Temp_abc.style.fontSize = "13px";
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

            var label_elect_cost_id = "elect_device_div" + shebeiId + "_energy_cost";
            var sql_elect_cost = "select value5 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_elect_cost, label_elect_cost_id);
            

            var label_Uabc_id = "elect_device_div" + shebeiId + "_Uabc";
            var sql_Uabc = "select value1 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_Uabc, label_Uabc_id);
            

            var label_Iabc_id = "elect_device_div" + shebeiId + "_Iabc";
            var sql_Iabc = "select value2 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_Iabc, label_Iabc_id);
            
            var label_Power_Rate_id = "elect_device_div" + shebeiId + "_Power_Rate";
            var sql_Power_Rate = "select value3 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_Power_Rate, label_Power_Rate_id);
            

            var label_Conversion_Factor = "elect_device_div" + shebeiId + "_Conversion_Factor";
            var sql_Conversion_Factor = "select value4 from shebeitable where shebeiID=\"" + shebeiId + "\"";
            get_result_sql_to_labelcontent(sql_Conversion_Factor, label_Conversion_Factor);
            
            var label_Title = "elect_device_div" + shebeiId + "_Title";
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
            var label_elect_temp_abc_id = "elect_device_div" + device_id + "_Temp_abc";
            var sql_Temp_abc = "select value1 from shebeitable where shebeiID=\"" + device_id + "\"";
            get_result_sql_to_labelcontent(sql_Temp_abc, label_elect_temp_abc_id);
        }
    }



</script>
