<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchInfo.aspx.cs" Inherits="SaigeSystemShow.SearchInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div  id="maindiv" style="position:absolute;left:0%;top:0%;width:100%;height:100%;overflow:hidden;">
        <img  id="img_background" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/background2.png"/>
        <label id="label_title" style="position:absolute;left:30%;width:40%;top:5%;font-size:40px;height:42px;text-align:center;color:white">巡检信息查询</label>

        
        <div id="content_div" style="position:absolute;left:10%;width:80%;top:30%;height:69%;overflow:scroll">
            <div id="sub_header_div" style="position:absolute;left:0%;width:100%;top:0%;height:10%">
                <label id="label_device_name" style="position:absolute;left:0%;width:10%;top:0%;height:10%;text-align:center;color:white;">设备</label>
                <label id="label_info" style="position:absolute;left:10%;width:30%;top:0%;height:10%;text-align:center;color:white;">信息</label>
                <label id="label_type" style="position:absolute;left:40%;width:10%;top:0%;height:10%;text-align:center;color:white;">操作</label>
                <label id="label_user" style="position:absolute;left:50%;width:10%;top:0%;height:10%;text-align:center;color:white;">用户</label>
                <label id="label_"></label>
            </div>
            <div id="sub_content_div" style="position:absolute;left:0%;width:130%;top:10%;height:90%;">
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

    ReFlush();
   
    function ReFlush() {

        var content_div = document.getElementById("sub_content_div");

        content_div.innerHTML = "";

        var select_list_string = get_result_sql("select * from search_info_table order by savetime");

        var select_list_json = From_Text_To_Json(select_list_string);

        

      //  alert(select_list_json.length);
        for(var i=0;i<select_list_json.length;i++)
        {
            // 设备
            var device_label = document.createElement("label");
            device_label.style.position = "absolute";
            device_label.style.left = "0%";
            device_label.style.top = ((120 * i) + 5).toString() + "px";
            device_label.style.width = "10%";
            device_label.style.height = "25px";
            device_label.style.textAlign = "center";
            device_label.style.color = "white";
            device_label.style.fontSize = "20px";
            device_label.textContent = select_list_json[i][1].toString();
            content_div.appendChild(device_label);


            // info
            var info_label = document.createElement("label");
            info_label.style.position = "absolute";
            info_label.style.left = "10%";
            info_label.style.top = ((120 * i) + 5).toString() + "px";
            info_label.style.width = "30%";
            info_label.style.height = "25px";
            info_label.style.textAlign = "center";
            info_label.style.color = "white";
            info_label.style.fontSize = "12px";
            info_label.textContent = select_list_json[i][2].toString();
            content_div.appendChild(info_label);


            // type
            var type_label = document.createElement("label");
            type_label.style.position = "absolute";
            type_label.style.left = "40%";
            type_label.style.top = ((120 * i) + 5).toString() + "px";
            type_label.style.width = "10%";
            type_label.style.height = "25px";
            type_label.style.textAlign = "center";
            type_label.style.color = "white";
            type_label.style.fontSize = "20px";
            type_label.textContent = select_list_json[i][3].toString();
            content_div.appendChild(type_label);


            // user 
            var user_label = document.createElement("label");
            user_label.style.position = "absolute";
            user_label.style.left = "50%";
            user_label.style.width = "20%";
            user_label.style.top = ((120 * i) + 5).toString() + "px";
            user_label.style.height = "25px";
            user_label.style.textAlign = "center";
            user_label.style.color = "white";
            user_label.style.fontSize = "20px";
            user_label.textContent = select_list_json[i][4].toString();
            content_div.appendChild(user_label);


            // pic 1
            var pic1 = document.createElement("img");
            pic1.style.position = "absolute";
            pic1.style.left = "70%";
            pic1.style.width = "20%";
            pic1.style.top = ((120 * i) + 5).toString() + "px";
            pic1.style.height = "115px";
            pic1.src = "images//" + select_list_json[i][5].toString();
            content_div.appendChild(pic1);

            // pic2
            var pic2 = document.createElement("img");
            pic2.style.position = "absolute";
            pic2.style.left = "90%";
            pic2.style.width = "20%";
            pic2.style.top = ((120 * i) + 5).toString() + "px";
            pic2.style.height = "115px";
            pic2.src = "images//" + select_list_json[i][6].toString();
            content_div.appendChild(pic2);

            // pic3
            var pic3 = document.createElement("img");
            pic3.style.position = "absolute";
            pic3.style.left = "110%";
            pic3.style.width = "20%";
            pic3.style.top = ((120 * i) + 5).toString() + "px";
            pic3.style.height = "115px";
            pic3.src = "images//" + select_list_json[i][7].toString();
            content_div.appendChild(pic3);


            // time
            var label_time = document.createElement("label");
            label_time.style.position = "absolute";
            label_time.style.left = "135%";
            label_time.style.width = "30%";
            label_time.style.top = ((120 * i) + 5).toString() + "px";
            label_time.style.height = "25px";
            label_time.style.fontSize = "20px";
            label_time.textContent = select_list_json[i][8].toString();
            label_time.style.color = "white";
            content_div.appendChild(label_time);
        }
    }
   

</script>
