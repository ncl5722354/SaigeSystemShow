<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Elect_RealTime.aspx.cs" Inherits="SaigeSystemShow.Elect_RealTime" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="position:absolute;left:0%;top:0%;width:100%;height:100%;overflow:hidden;">
    <div  id="maindiv" style="position:absolute;left:0%;top:0%;width:100%;height:100%;overflow:hidden;background-color:#0B121C">
        <label id="label_title" style="position:absolute;left:30%;width:40%;top:5%;font-size:40px;height:42px;text-align:center;color:white">电力系统实时监测</label>
        <div id="elect_device_div1" style="position:absolute;left:5%;width:30%;height:40%;top:15%;border-style:solid;border-width:2px;border-color:#444B55"></div>
        <div id="elect_device_div2" style="position:absolute;left:35%;width:30%;height:40%;top:15%;border-style:solid;border-width:2px;border-color:#444B55"></div>
        <div id="elect_device_div3" style="position:absolute;left:65%;width:30%;height:40%;top:15%;border-style:solid;border-width:2px;border-color:#444B55"></div>
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


    function init()
    {
        var elect_device_list_string = get_result_sql("select shebeiID from shebeitable where shebeizhongleiID=(select shebeizhongleiID from shebeizhongleitable where shebeizhongleiname=\"正泰电表\")");
        var elect_device_list_json = From_Text_To_Json(elect_device_list_string);
        for(var i=0;i<elect_device_list_json.length;i++)
        {
            elect_device_list.push(elect_device_list_json[i]);
        }

        Put_Elect_Devices_To_Divs(elect_device_list, "elect_device_div");
        //alert(elect_device_list);

        Elect_Devices_Tick();
        setInterval(Elect_Devices_Tick, 20000);
    }

    init();


    // 把几个电表的内容放进相应的框框内
    function Put_Elect_Devices_To_Divs(list,div_name_head)
    {
        for (var i = 0; i < list.length; i++) {
            
            var contect_div = document.getElementById(div_name_head + (i+1).toString());

            // 能源消耗标题
            var label_energy_cost_title = document.createElement("label");
            label_energy_cost_title.style.position = "absolute";
            label_energy_cost_title.style.left = "5%";
            label_energy_cost_title.style.width = "20%";
            label_energy_cost_title.style.top = "10%";
            label_energy_cost_title.style.height = "20px";
            label_energy_cost_title.style.fontSize = "18px";
            label_energy_cost_title.textContent = "能源消耗";
            label_energy_cost_title.style.color = "white";
            label_energy_cost_title.style.textAlign="center";

            contect_div.appendChild(label_energy_cost_title);

            // 能源消耗部分

            var label_energy_cost = document.createElement("label");
           
            label_energy_cost.style.position = "absolute";
            label_energy_cost.style.left = "0%";
            label_energy_cost.style.width = "30%";
            label_energy_cost.style.top = "30%";
            label_energy_cost.style.height = "40px";
            label_energy_cost.style.fontSize = "38px";
            label_energy_cost.textContent = "0";
            label_energy_cost.id = div_name_head + (i + 1).toString() + "_energy_cost";
            label_energy_cost.style.color = "white";
            label_energy_cost.style.textAlign = "center";
            contect_div.appendChild(label_energy_cost);


        }
    }

    // 电功能表的更新
    function Elect_Devices_Tick()
    {
        for (var i = 0; i < elect_device_list.length; i++) {
            try{
                var energy_label = document.getElementById("elect_device_div" + (i + 1).toString() + "_energy_cost");

                var shebeiId = elect_device_list[i].toString();

                var energy_cost_str = get_result_sql("select value5 from shebeitable where shebeiID=\"" + shebeiId + "\"");

                var energy_cost_json = From_Text_To_Json(energy_cost_str);

                if (energy_cost_json[0] == "") {
                    energy_label.textContent = "0";
                }
                else {
                    energy_label.textContent = energy_cost_json[0];
                }
            }
            catch (err) {
                try{
                    var energy_label = document.getElementById("elect_device_div" + (i + 1).toString() + "_energy_cost");

                    energy_label.textContent = "0";

                }
                catch(err){}

            }

        }
    }



</script>
