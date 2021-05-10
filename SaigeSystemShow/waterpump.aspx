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
            <label id="label_title" style="position:absolute;left:30%;width:40%;top:5%;font-size:40px;height:42px;text-align:center;color:white">模拟量监测</label>
           <div id="waterpump_device_div1" style="position:absolute;left:5%;width:30%;height:40%;top:15%;"></div>
        <div id="waterpump_device_div2" style="position:absolute;left:35%;width:30%;height:40%;top:15%;"></div>
        <div id="waterpump_device_div3" style="position:absolute;left:65%;width:30%;height:40%;top:15%;"></div>
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
        var water_device_list_string = get_result_sql("SELECT shebeiname FROM saigedatabase.shebeitable where shebeizhongleiID= (SELECT shebeizhongleiID FROM saigedatabase.shebeizhongleitable where shebeizhongleiname=\"模拟量采集\")");
        var water_device_list_json = From_Text_To_Json(water_device_list_string);

        for(var i=0;i<water_device_list_json.length;i++)
        {
            list_water_pump_list.push(water_device_list_json[i]);
            
        }

        Put_Water_Devices_To_Divs(list_water_pump_list, "waterpump_device_div");

        Water_Temp_Tick();
        setInterval(Water_Temp_Tick(), 3000);

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
