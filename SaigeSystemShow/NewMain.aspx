<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewMain.aspx.cs" Inherits="SaigeSystemShow.NewMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        @keyframes animation_meunitem_move {
            from {
                color: white;
            }

            to {
                color: red;
            }
        }

        @keyframes animation_meunitem_out {
            from {
                color: red;
            }

            to {
                color: white;
            }
        }


    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <img id="img_bg" style="position:absolute;left:0%;width:100%;top:0%; height:100%;" src="pic/background.png" />
         <!--div id="mask" style="position:absolute;left:0%;width:100%;top:0%;height:100%;background-color:darkblue;opacity:0.5"--><!--/div-->
        <div id="div_headeer" style="position:absolute;left:0%;width:100%;top:0%;height:80px;">
            <label id="login_name" style="position:absolute;left:85%;width:15%;top:35px;height:30px;font-size:25px;color:white; font-weight: bold; font-style: italic;">登录者</label>
            <label id="label_title" style="position:absolute;left:40%;width:20%;top:10px;height:40px;font-size:30px;text-align:center;color:white">赛格物业机电管控平台</label>
            <label id="label_time" style="position:absolute;left:1%;width:20%;top:35px;height:30px;font-size:18px;color:white;font-weight:bold;font-style:italic;">当前时间</label>
        </div>
        <div id="div_selector" style="position:absolute;left:0%;width:150px;top:8%;height:92%;background-color:#212C32"">

        </div>
        <div id="div_content" style="position:absolute;left:150px;right:0px;top:80px;bottom:0px;">
            <img id="div_content_bg" style="position:absolute;left:0%;width:100%;top:0%;height:100%" src="pic/background2.png"/>
            <label id="div_content_title" style="position:absolute;left:30%;width:40%;top:7%;height:35px;font-size:30px;text-align:center;color:white; font-family: 华文细黑;"></label>
            <div id="div_detail_content" style="position:absolute;left:0%;width:100%;top:13%;bottom:0px;">

            </div>
        </div>
         <div id="div_add_info_view" style="position:absolute;left:30%;width:40%;top:20%;height:70%;background-image:url('pic/background2.png');overflow:scroll;border-style:solid;border-width:2px;border-color:white;visibility:hidden" >
            <label id="add_info_title" style="position:absolute;left:20%;width:60%;top:5%;height:20px;font-size:18px;text-align:center;color:white">添加信息</label>
            <label id="add_info_colse" style="position:absolute;left:0%;width:20%;top:5%;height:18px;font-size:15px;text-align:center;color:white">关闭</label>
            <label id="add_info_input_label" style="position:absolute;left:0%;width:20%;top:20%;height:18px;font-size:15px;text-align:center;color:white">添加说明信息</label>
            <textarea id="add_info_input" style="position:absolute;left:30%;width:60%;top:20%;height:20%;" runat="server"></textarea>
            <label id="add_info_type_label" style="position:absolute;left:0%;width:20%;height:18px;top:45%;font-size:15px;text-align:center;color:white">选择类型</label>
            <select id="add_info_type_select" style="position:absolute;left:30%;width:20%;height:18px;top:45%;font-size:15px;text-align:center;" runat="server">
                <option value="正常巡检">正常巡检</option>
                <option value="发现异常">发现异常</option>
                <option value="异常恢复">异常恢复</option>
            </select>
             

              <label id="add_info_pic" style="position:absolute;left:0%;width:20%;top:55%;height:18px;font-size:15px;text-align:center;color:white">添加图片</label>
            <img id="add_pic1" style="position:absolute;left:20%;width:16%;top:55%;height:16%;"/>
            <img id="add_pic2" style="position:absolute;left:45%;width:16%;top:55%;height:16%;"/>
            <img id="add_pic3" style="position:absolute;left:70%;width:16%;top:55%;height:16%;"/>

             <label id="add_info_type_duty_label" style="position:absolute;left:0%;width:20%;height:18px;top:70%;font-size:15px;text-align:center;color:white">消息流向职位选择</label>
             <select id="add_info_type_duty_select" style="position:absolute;left:20%;width:20%;height:18px;top:70%;font-size:15px;text-align:center;" runat="server">

             </select>

             <label id="add_info_type_user_label" style="position:absolute;left:50%;width:20%;height:18px;top:70%;font-size:15px;text-align:center;color:white">消息流向人员选择</label>
             <select id="add_info_type_user_select" style="position:absolute;left:70%;width:20%;height:18px;top:70%;font-size:15px;text-align:center;"  runat="server">

             </select>


           
            <input id="add_info_pic1_input" name="add_info_pic1_input" type="file" style="position:absolute;left:20%;width:20%;top:80%;height:5%;color:white;"  runat="server"/>
            <input id="add_info_pic2_input" name="add_info_pic2_input" type="file" style="position:absolute;left:45%;width:20%;top:80%;height:5%;color:white;"  runat="server"/>
            <input id="add_info_pic3_input" name="add_info_pic3_input" type="file" style="position:absolute;left:70%;width:20%;top:80%;height:5%;color:white"  runat="server"/>
            <asp:Button  id="add_info_ok" value="确定" style="position:absolute;left:30%;width:10%;top:88%;height:25px;font-size:20px;text-align:center;" runat="server" OnClick="add_info_ok_Click" />
            <input id="add_info_name_title" runat="server" style="position:absolute;left:200%;color:white"/>
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
<script src="privatefunction.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script>
       
    // 用读取ini的方式来进行页面的设计
    // 流程控制部分
    // 需要增加一个标记，展示此界面现在是否可以实时更新
    init();    // 初始化
    var select_list = Read_Selector();// 读取导航栏信息
    var select_json = From_Text_To_Json(select_list);
    var current_id;
    var update_is = true;
    var temp_update_is;
    // 公共变量
    var Device_Data_Array;

    var temp_duty_select = "";                              // 用来判断选择的select与实际的select是不是有不同

    setInterval(update_duty_usr, 100);
    function update_duty_usr()
    {
        var duty_select = document.getElementById("add_info_type_duty_select");
        if(duty_select.value!=temp_duty_select)
        {
            temp_duty_select = duty_select.value;

            get_result_sql_to_select("SELECT userid FROM saigedatabase.usertable where zhiwei=(select zhiwei_ID from saigedatabase.zhiwei_table where zhiwei_Name=\"" + temp_duty_select + "\")", "add_info_type_user_select");
        }


    }


    current_id = "w_页面总览";
    Reflush();

    // 实现导航栏操作
    

    setInterval(Reflush, 20000);
    
    Reflush_selector();

    setInterval(Reflush_selector, 2000);

    function Reflush_selector()
    {
        var selector = document.getElementById("div_selector");
        selector.innerHTML = "";

        for (var i = 0; i < select_json.length; i++) {
            var label = document.createElement("div");
            label.textContent = select_json[i].toString();
            label.id = "select_" + select_json[i].toString();
            label.style.position = "absolute";
            label.style.left = "0%";
            label.style.top = (80 * i + 80).toString() + "px";
            label.style.width = "100%";
            label.style.color = "white";
            label.style.textAlign = "center";
            label.style.cursor = "pointer";
            label.onclick = function (event) {

                // 切换到相应画面
                var title = document.getElementById("div_content_title");
                title.textContent = Get_Xiahuaxian_String(event.currentTarget.id, 2);

                // 读取相应的界面并填充画面
                current_id = event.currentTarget.id;
                Read_View(Get_Xiahuaxian_String(event.currentTarget.id, 2), "div_detail_content");
            }

            // 对于特殊的位置添加红色数字标签

            if (select_json[i].toString() == "巡检记录")
            {
                var username = getCookie("username");
                var count_string = get_result_sql("select count(*) from search_info_table where touser=\"" + username + "\" and have_senn=\"否\"");
                var count_json = From_Text_To_Json(count_string);
                var count = count_json[0];
                if(count!="0")
                {
                    var label_count = document.createElement("div");
                    label_count.style.position = "absolute";
                    label_count.style.left = "80%";
                    label_count.style.width = "14%";
                    label_count.style.top = "20%";
                    label_count.style.height = "80%";
                    label_count.textContent = count;
                    label_count.style.borderRadius = "100%";
                    label_count.style.backgroundColor = "red";
                    label_count.style.color = "white";
                    label.appendChild(label_count);
                }
            }

            $("#div_selector").append(label);
            Set_Animation_Select_Button(label.id);
        }
    }


    // 初始化函数
    function init()
    {
        // 关于登录的用户名
        var username = getCookie("username");
        var label_name = document.getElementById("login_name");
        label_name.textContent = "登录用户：" + username;

        // 关于时钟计时
        setInterval(Time_Timer, 500);      
    }


    // 时钟计时的实现
    function Time_Timer() {
        var label_timer = document.getElementById("label_time");
        var time = new Date();
        label_timer.textContent = "当前时间：" + To_yyyy_MM_dd_HH_mm_ss_From_Data(time) + " " + Get_Week_Day(time.getDay().toString());
    }


    // 为选择导航选择设置动作
    function Set_Animation_Select_Button(controlname) {
        var label_overview = document.getElementById(controlname);
        label_overview.onmouseenter = function (event) {
            Set_Control_animation(event.currentTarget.id, "animation_meunitem_move 0.3s", "forwards");
        }

        label_overview.onmouseout = function (event) {
            Set_Control_animation(event.currentTarget.id, "animation_meunitem_out 0.3s", "forwards");
        }
    }


    // 读取导航信息
    

    function Reflush()
    {
        if (update_is == false) return;
        try{
            Read_View(Get_Xiahuaxian_String(current_id, 2), "div_detail_content");
        }
        catch(err){}
    }





    // 关于设备信息上传

    function Show_Add_Info_View(btn_show_info_view_string) {

        var btn = document.getElementById(btn_show_info_view_string);
        var btn_ok = document.getElementById("add_info_ok");

        var view = document.getElementById("div_add_info_view");
        btn.onclick = function (event) {
            temp_update_is = update_is;
            update_is = false;
            $('#add_info_name_title').attr('value', event.target.id);
            //alert(event.target.id);
            $('#add_pic1').attr('src', '');
            $('#add_pic2').attr('src', '');
            $('#add_pic3').attr('src', '');
            $('#add_info_pic1_input').attr('value', '添加图片1');
            $('#add_info_pic2_input').attr('value', '添加图片2');
            $('#add_info_pic3_input').attr('value', '添加图片3');
            view.style.visibility = "visible";

            var close_btn = document.getElementById("add_info_colse");

            close_btn.onclick = function (event) {
                update_is = temp_update_is;
                view.style.visibility = "hidden";
            }

            btn_ok.onclick = function (event) {

                // 把图片上传到服务器
                // update_file(1,"add_info_pic1_input");
                update_is = temp_update_is;


                view.style.visibility = "hidden";
            }


        }


    }


    // 显示读取的图片
    $('#add_info_pic1_input').change(function () {
        let fileobj = this.files[0];
        let filereader = new FileReader();
        filereader.readAsDataURL(fileobj);
        filereader.onload = function () {
            $('#add_pic1').attr('src', filereader.result);
        }
    })

    $('#add_info_pic2_input').change(function () {
        let fileobj = this.files[0];
        let filereader = new FileReader();
        filereader.readAsDataURL(fileobj);
        filereader.onload = function () {
            $('#add_pic2').attr('src', filereader.result);
        }
    })

    $('#add_info_pic3_input').change(function () {
        let fileobj = this.files[0];
        let filereader = new FileReader();
        filereader.readAsDataURL(fileobj);
        filereader.onload = function () {
            $('#add_pic3').attr('src', filereader.result);
        }
    })

    function update_file(index, input_name) {

        var input_object = document.getElementById(input_name);
        $.ajax({
            url: "Elect_RealTime.aspx/Update_pic",
            type: "Post",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            data: "{index:'" + index + "',name:'" + input_name + "'}",
            success: function (data) {


            },
            error: function (data) {
                //200的响应也有可能被认定为error，responseText中没有Message部分
                return $.parseJSON(data.responseText).Message;
            },
            complete: function (data) {

            }
        });
    }
</script>
