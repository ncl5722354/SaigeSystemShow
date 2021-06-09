<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="waterpump.aspx.cs" Inherits="SaigeSystemShow.waterpump" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
  
     <form id="form2" runat="server" style="position:absolute;left:0%;top:0%;width:100%;height:100%;overflow:hidden;">
       <div  id="maindiv" style="position:absolute;left:0%;top:0%;width:100%;height:100%;overflow:hidden;">
          
        <img  id="img_background" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/background2.png"/>
            <label id="label_title" style="position:absolute;left:30%;width:40%;top:5%;font-size:40px;height:42px;text-align:center;color:white">综合水泵房</label>
            <div id="div_pool" style="position:absolute;left:5%;width:25%;top:10%;height:25%;">
                <img id="background_pool" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
                <img id="background_pool1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
                <label id="pool_title" style="position:absolute;left:30%;width:40%;top:3%;height:18px;font-size:15px;text-align:center;color:white">水池</label>
                <label id="real_time_water_level_title" style="position:absolute;left:15%;width:30%;top:25%;height:20px;font-size:16px;text-align:center;color:white">实时水位(mm)</label>
                <div id="AI_div_1" style="position:absolute;left:50%;top:25%;height:20px;width:35%;font-size:16px;color:white">300</div>
                <label id="High_WaterPool_Warning" style="position:absolute;left:15%;top:50%;height:20px;width:30%;font-size:16px;text-align:center;color:white">高水位报警</label>
                <label id="Low_WaterPool_Warning" style="position:absolute;left:15%;top:70%;height:20px;width:30%;font-size:16px;text-align:center;color:white">低水位报警</label>
                <div id="Bits_Deivces_1" style="position:absolute;left:50%;width:5%;height:7%;top:51%;background-color:red;border-radius:100%"></div>
                <div id="Bits_Devices_2" style="position:absolute;left:50%;width:5%;height:7%;top:71%;background-color:red;border-radius:100%"></div>

            </div>

           <div id="Life_Water_Pump_Elect" style="position:absolute;left:5%;width:25%;top:40%;height:25%">
               <img id="background_Life_Water_Pump_Elect" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
               <img id="background_Life_Water_Pump_Elect1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
               <label id="Life_Water_Pump_Elect_Title" style="position:absolute;left:30%;width:40%;top:2%;height:20px;font-size:14px;text-align:center;color:white" >生活水泵电参数</label>

           </div>

           <div id="Life_Water_Pump" style="position:absolute;left:5%;width:25%;top:70%;height:25%">
                <img id="background_Life_Water_Pump" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
               <img id="background_Life_Water_Pump1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
               <label id="Life_Water_Pump_Title" style="position:absolute;left:30%;width:40%;top:2%;height:20px;font-size:16px;text-align:center;color:white" >生活水泵网管</label>
               <label id="Life_Water_Pump_Press_Title" style="position:absolute;left:15%;width:35%;top:40%;height:22px;font-size:20px;color:white">出口实时压力</label>
               <div id="AI_div_2" style="position:absolute;left:50%;width:45%;top:40%;height:22px;font-size:20px;color:white">300</div>
           </div>
           

           <div id="Sewage_Pump" style="position:absolute;left:35%;width:25%;top:15%;height:20%;">
                <img id="background_Sewage_Pump" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
               <img id="background_Sewage_Pump1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
               <label id="Sewage_Pump_Title" style="position:absolute;left:30%;width:40%;top:2%;height:20px;font-size:16px;text-align:center;color:white">污水泵</label>
               <label id="Sewage_Pump_Status_Title" style="position:absolute;left:15%;width:25%;top:40%;height:20px;font-size:18px;color:white;text-align:center;">启停状态</label>
               <div id="Bits_Devices_3" style="position:absolute;left:50%;width:6%;height:10%;top:41%;background-color:red;border-radius:100%"></div>
           </div>

           <div id="Collect_Water" style="position:absolute;left:35%;width:25%;top:40%;height:25%">
                <img id="Collect_Water_Pump" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
               <img id="Collect_Water_Pump1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
               <label id="Collect_Water_Pump_Title" style="position:absolute;left:30%;width:40%;top:2%;height:20px;font-size:16px;text-align:center;color:white">集水井</label>
               <label id="Collect_Water_Pump_High_Level" style="position:absolute;left:20%;width:30%;top:30%;height:20px;font-size:18px;color:white;">高水位</label>
               <label id="Collect_Water_Pump_Low_Level" style="position:absolute;left:20%;width:30%;top:60%;height:20px;font-size:18px;color:white;">低水位</label>
               <div id="AI_div_3" style="position:absolute;left:50%;width:50%;top:30%;height:20px;font-size:18px;color:white;">200</div>
               <div id="AI_div_4" style="position:absolute;left:50%;width:50%;top:60%;height:20px;font-size:18px;color:white;">300</div>
           </div>

           <div id="Life_Water_Pump_Vedio" style="position:absolute;left:35%;width:25%;top:70%;height:25%">
               <img id="back_Life_Water_Pump_Vedio" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
               <img id="back_Life_Water_Pump_Vedio1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
               <label id="Life_Water_Pump_Vedio_Title" style="position:absolute;left:30%;width:40%;top:2%;height:20px;font-size:16px;text-align:center;color:white">水泵房视频</label>
           </div>

           <div id="Fire_pump" style="position:absolute;left:65%;width:25%;top:10%;height:25%;">
               <img id="back_Fire_pump" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/frame1.png"/>
               <img id="back_Fire_pump1" style="position:absolute;left:0%;width:100%;top:10%;height:90%;" src="pic/frame2.png"/>
               <label id="Fire_pump_Title" style="position:absolute;left:30%;width:40%;top:2%;height:20px;font-size:16px;text-align:center;color:white">消火栓泵</label>
               <label id="Fire_pump_Start_Stop" style="position:absolute;left:20%;width:30%;top:25%;height:20px;font-size:18px;color:white">启停状态</label>
               <div id="Bits_Devices_4" style="position:absolute;left:50%;width:5%;top:26%;height:7%;background-color:red;border-radius:100%"></div>
               <label id="Fire_pump_Auto" style="position:absolute;left:20%;width:30%;top:40%;height:20px;font-size:18px;color:white">手自动状态</label>
               <div id="Bits_Devices_5" style="position:absolute;left:50%;width:5%;top:41%;height:7%;background-color:red;border-radius:100%"></div>
               <label id="Fire_pump_Error" style="position:absolute;left:20%;width:30%;top:55%;height:20px;font-size:18px;color:white">故障指示</label>
               <div id="Bits_Devices_6" style="position:absolute;left:50%;width:5%;top:56%;height:7%;background-color:red;border-radius:100%"></div>
               <label id="Fire_pump_Exit_Press" style="position:absolute;left:20%;width:30%;top:70%;height:20px;font-size:18px;color:white">出口压力</label>
               <div id="AI_div_5" style="position:absolute;left:50%;width:50%;top:70%;height:20px;font-size:18px;color:white;">1125
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script>
    var list_water_pump_list = new Array();

    init();


    function init()
    {
        //var water_device_list_string = get_result_sql("SELECT shebeiname FROM saigedatabase.shebeitable where shebeizhongleiID= (SELECT shebeizhongleiID FROM saigedatabase.shebeizhongleitable where shebeizhongleiname=\"模拟量采集\")");
        //var water_device_list_json = From_Text_To_Json(water_device_list_string);

        //for(var i=0;i<water_device_list_json.length;i++)
        //{
        //    list_water_pump_list.push(water_device_list_json[i]);
            
        //}

        //Put_Water_Devices_To_Divs(list_water_pump_list, "waterpump_device_div");

        //Water_Temp_Tick();
        //setInterval(Water_Temp_Tick(), 3000);






    }


    function Put_Water_Devices_To_Divs(list, div_name_head) {
        for (var i = 0; i < list.length; i++) {

            var contect_div = document.getElementById(div_name_head + (i + 1).toString());

            contect_div.innerHTML = "";

            // 放入图片
            var back_framk_img = document.createElement("img");
            back_framk_img.style.left = "0%";
            back_framk_img.style.top = "0%";
            back_framk_img.style.width = "100%";
            back_framk_img.style.height = "100%";
            back_framk_img.src = "pic//frame2.png";
            contect_div.appendChild(back_framk_img);


            // 

            var value1_label = document.createElement("label");
            value1_label.style.left = "50%";
            value1_label.style.width = "50%";
            value1_label.style.top = "20%";
            value1_label.style.height = "30px";
            value1_label.style.fontSize = "28px";
            value1_label.style.position = "absolute";
            value1_label.id = "waterpumpvalue_" + list[i].toString() + "_1";
            value1_label.style.textAlign = "center";
            value1_label.style.color = "white";
            contect_div.appendChild(value1_label);


            var value2_label = document.createElement("label");
            value2_label.style.left = "50%";
            value2_label.style.width = "50%";
            value2_label.style.top = "40%";
            value2_label.style.height = "30px";
            value2_label.style.fontSize = "28px";
            value2_label.style.position = "absolute";
            value2_label.id = "waterpumpvalue_" + list[i].toString() + "_2";
            value2_label.style.textAlign = "center";
            value2_label.style.color = "white";
            contect_div.appendChild(value2_label);

            var value3_label = document.createElement("label");
            value3_label.style.left = "50%";
            value3_label.style.width = "50%";
            value3_label.style.top = "60%";
            value3_label.style.height = "30px";
            value3_label.style.fontSize = "28px";
            value3_label.style.position = "absolute";
            value3_label.id = "waterpumpvalue_" + list[i].toString() + "_3";
            value3_label.style.textAlign = "center";
            value3_label.style.color = "white";
            contect_div.appendChild(value3_label);

            var value4_label = document.createElement("label");
            value4_label.style.left = "50%";
            value4_label.style.width = "50%";
            value4_label.style.top = "80%";
            value4_label.style.height = "30px";
            value4_label.style.fontSize = "28px";
            value4_label.style.position = "absolute";
            value4_label.id = "waterpumpvalue_" + list[i].toString() + "_4";
            value4_label.style.textAlign = "center";
            value4_label.style.color = "white";
            contect_div.appendChild(value4_label);

        }
    }

    function Water_Temp_Tick()
    {

        for(var i=0;i<list_water_pump_list.length;i++)
        {
            var device_name = list_water_pump_list[i].toString();


            var value_string = get_result_sql ("SELECT value1 FROM saigedatabase.shebeitable where shebeiname=\"" + device_name + "\"");

            var value_json = From_Text_To_Json(value_string);

            var label1 = document.getElementById("waterpumpvalue_" + device_name + "_1");
            label1.textContent = Get_Kongge_String(value_json[0].toString(), 1);

            var label2 = document.getElementById("waterpumpvalue_" + device_name + "_2");
            label2.textContent = Get_Kongge_String(value_json[0].toString(), 2);

            var label3 = document.getElementById("waterpumpvalue_" + device_name + "_3");
            label3.textContent = Get_Kongge_String(value_json[0].toString(), 3);

            var label4 = document.getElementById("waterpumpvalue_" + device_name + "_4");
            label4.textContent = Get_Kongge_String(value_json[0].toString(), 4);

        }
    }


</script>
