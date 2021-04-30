<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BitDevices.aspx.cs" Inherits="SaigeSystemShow.BitDevices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
     <form id="form1" runat="server" style="position:absolute;left:0%;top:0%;width:100%;height:100%;overflow:hidden;">
    <div  id="maindiv" style="position:absolute;left:0%;top:0%;width:100%;height:100%;overflow:hidden;background-color:#0B121C">
        <label id="label_title" style="position:absolute;left:30%;width:40%;top:5%;font-size:40px;height:42px;text-align:center;color:white">开关量监测</label>
        <div id="bit_devices_1_1" style="position:absolute;left:10%;width:5%;top:30%;height:7%;"></div>
        <div id="bit_devices_1_2" style="position:absolute;left:20%;width:5%;top:30%;height:7%;"></div>
        <div id="bit_devices_1_3" style="position:absolute;left:30%;width:5%;top:30%;height:7%;"></div>
        <div id="bit_devices_1_4" style="position:absolute;left:40%;width:5%;top:30%;height:7%;"></div>
        <div id="bit_devices_1_5" style="position:absolute;left:50%;width:5%;top:30%;height:7%;"></div>
        <div id="bit_devices_1_6" style="position:absolute;left:60%;width:5%;top:30%;height:7%;"></div>
        <div id="bit_devices_1_7" style="position:absolute;left:70%;width:5%;top:30%;height:7%;"></div>
        <div id="bit_devices_1_8" style="position:absolute;left:80%;width:5%;top:30%;height:7%;"></div>
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
    // 所有开关量
    var bit_devices_bits = new Array();  // 保存的是所有的点位

    init();

    function init()
    {
        var all_bit_devices_string = get_result_sql("select shebeiID from shebeitable where shebeizhongleiID=(select shebeizhongleiID from shebeizhongleitable where shebeizhongleiname=\"开关量采集\")");

        var all_bit_devices_json = From_Text_To_Json(all_bit_devices_string);

        // 把变量
        for (var i = 0; i < all_bit_devices_json.length; i++) {

            for (var j = 1; j <= 8; j++) {
                bit_devices_bits.push(all_bit_devices_json[i].toString()+ "_" + (i + 1).toString() + "_" + j.toString());
            }
        }

        Tick_Bits_Devices_bits();
        setInterval(Tick_Bits_Devices_bits, 5000);
    }


    function Tick_Bits_Devices_bits()
    {
        for(var i=0;i<bit_devices_bits.length;i++)
        {
           

            var point = document.createElement("div");
            point.style.width = "100%";
            point.style.height = "100%";
            point.style.left = "0%";
            point.style.top = "0%";
            point.style.position = "absolute";
            point.style.borderRadius = "100%";

            var device_id = Get_Xiahuaxian_String (bit_devices_bits[i].toString(), 1);


            var value = get_result_sql("select value1 from shebeitable where shebeiID=\"" + device_id + "\"");

            var value_json = From_Text_To_Json(value);

            var device_num = Get_Xiahuaxian_String(bit_devices_bits[i].toString(), 2);
            var device_bitsnum = Get_Xiahuaxian_String(bit_devices_bits[i].toString(), 3);
            try{
                var mydiv = document.getElementById("bit_devices_" + device_num + "_" + device_bitsnum);
                mydiv.innerHTML = "";
                var subvalue1 = value_json[0].toString();

                var subvalue = Get_Kongge_String(subvalue1, device_bitsnum);
                if(subvalue=="1")
                {
                    point.style.backgroundColor = "yellow";
                }
                else
                {
                    point.style.backgroundColor = "red";
                }
                mydiv.appendChild(point);
            }
            catch(err){}

        }
    }

    




 </script>
