<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SaigeSystemShow.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="overflow:hidden">
        <img id="img_bg" style="position:absolute;left:0%;width:100%;top:0%;height:100%;" src="pic/loginba.png" />
        <div id="login_div" style="position:absolute;left:60%;width:35%;top:40%;height:40%;border-radius:5%;border-style:solid;border-color:white;background-color:white;opacity:0.3">

        </div>
        <div id="login_div_border" style="position:absolute;left:60%;width:35%;top:40%;height:40%;border-radius:5%;border-style:solid;border-color:white;">

        </div>
        <label id="label_login" style="position:absolute;left:63%;width:5%;top:45%;height:30px;font-size:28px;color:white;">登录</label>

        <label id="label_username" style="position:absolute;left:63%;width:10%;top:55%;height:35px;font-size:33px;color:white">用户名</label>
        <input  id="input_username" style="position:absolute;left:73%;width:18%;top:55%;height:35px;font-size:33px;color:black;border-radius:2%;border-style:solid;border-color:black;"/>

        <label id="label_password" style="position:absolute;left:63%;width:10%;top:62%;height:35px;font-size:33px;color:white">密&nbsp;&nbsp;&nbsp;码 </label>
        <input  id="input_password" style="position:absolute;left:73%;width:18%;top:62%;height:35px;font-size:33px;color:black;border-radius:2%;border-style:solid;border-color:black;" type="password"/>
        
        <input id="button_login" type="button" style="position:absolute;left:65%;width:25%;top:68%;height:40px;font-size:30px;color:black;background-color:lightblue" value="登录"/>

        <label id="label_title" style="position:absolute;left:25%;width:50%;top:20%;height:60px;font-size:55px;color:white;text-align:center;" >赛格物业机电管控一体平台</label>
        <label id="label_company" style="position:absolute;left:25%;width:50%;top:95%;height:30px;font-size:25px;color:white;text-align:center">深圳市赛格物业管理有限公司</label>

        <label id="label_login_error" style="position:absolute;left:63%;width:20%;top:75%;height:20px;font-size:17px;color:red;text-align:center;visibility:hidden;">用户名密码错误！</label>
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
<script>

    // 登录
    var buttonlogin = document.getElementById("button_login");

    buttonlogin.onclick=function(event)
    {
        var user = document.getElementById("input_username").value.toString();
        var password = document.getElementById("input_password").value.toString();

        var result = select_exit_is("select * from usertable where userid=\"" + user + "\" and userpassword=\"" + password + "\"");

        if(result=="fail")
        {
            var label_error = document.getElementById("label_login_error");
            label_error.style.visibility = "visible";
        }

        if(result=="success")
        {

            setCookie("username", user, 1000);
            window.location.replace("NewMain.aspx");
        }
    }

     
</script>
