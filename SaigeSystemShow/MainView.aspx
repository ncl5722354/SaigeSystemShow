<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainView.aspx.cs" Inherits="SaigeSystemShow.MainView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
      @keyframes animation_meunitem_move
      {
          from{color:white;left:-10%;}
          to{color:red;left:0%}
          
      }

        @keyframes animation_meunitem_out {
            from{color:red;left:0%;}
          to{color:white;left:-10%;}
        }

    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="overflow:hidden">
        <img id="img_bg" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/loginba.png" />
        <div id="div_headeer" style="position:absolute;left:0%;width:100%;top:0%;height:80px;background-color:#178AB9">
            <label id="login_name" style="position:absolute;left:85%;width:15%;top:20px;height:30px;font-size:25px;color:white;">登录者</label>
        </div>

        <label id="label_company" style="position:absolute;left:25%;width:50%;top:95%;height:30px;font-size:25px;color:white;text-align:center">深圳市赛格物业管理有限公司</label>
        <div id="div_menu" style="position:absolute;left:0%;width:15%;top:80px;bottom:0px;background-color:#212C32">
            <div id="div_overview" style="position:absolute;left:-10%;width:70%;top:30px;height:25px;font-size:20px;color:white;text-align:center">页面总览</div>
            <div id="div_data_collection" style="position:absolute;left:-10%;width:70%;top:105px;height:25px;font-size:20px;color:white;text-align:center;">数据采集</div>
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
    function init()
    {
        var username = getCookie("username");

        var label_name = document.getElementById("login_name");
        label_name.textContent = "登录用户：" + username;
    }

    init();

    // 总览按钮设定
    Set_Animation_Select_Button("div_overview");
    Set_Animation_Select_Button("div_data_collection");




    // 选择按钮动作的设定
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



    
</script>
