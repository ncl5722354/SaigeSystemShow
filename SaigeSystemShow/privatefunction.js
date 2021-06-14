


// 工程需要的私有函数

function Read_Selector()
{
    var result;
    $.ajax({
        url: "SqlCaozuo.asmx/ReadSections",
        type: "Post",
        dataType: "text",
        async: false,
        contentType: "application/json; charset=utf-8",
        data: "{ini_path_name:'viewconfig.ini'}",
        success: function (data) {
            result = data;

        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });
    return result;                                                                                  
}


// 读取所有的界面
function Read_View(view_name,subdiv_name)
{
    var all_object_string;             // 所有的界面元素的字符串
    var ini_name = view_name + ".ini";
    try{
        Device_Data_Array.clear();
    }
    catch(err){}
    // Device_Data_Array = new Array();                         // 用来装设备数据    10秒一更新
   

    if (Read_Value(ini_name, "实时更新", "update") == "true")
    {
        update_is = true;
    }
    else {
        update_is = false;
    }

    var subdiv = document.getElementById(subdiv_name);
    subdiv.innerHTML = "";
    $.ajax({
        url: "SqlCaozuo.asmx/ReadSections",
        type: "Post",
        dataType: "text",
        async: false,
        contentType: "application/json; charset=utf-8",
        data: "{ini_path_name:'"+ini_name+"'}",
        success: function (data) {
            all_object_string = data;

        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });

    var all_object_json = From_Text_To_Json(all_object_string);

    for(var i=0;i<all_object_json.length;i++)
    {
        try{
            var object_name = all_object_json[i];               // 元素名称  seciton


            // 在这里做界面的解析
            // 
            var mydiv;

            // 各种 元素的类型
            //var type = Read_Value(ini_name, object_name, "类型");
            // 父结点属性 
            var allvalue = Read_All_Value(ini_name, object_name);
           // Get_Json_Value(allvalue, "width");
           // alert(allvalue.width);
           
            var type = Get_Json_Value(allvalue, "类型");

            if(type=="边框1")
            {
                mydiv = document.createElement("div");
                mydiv.id = "mydiv_" + object_name;
                mydiv.style.position = "absolute";
            
                // 两张图片组成的底
                var myimage = document.createElement("img");
                myimage.style.width = "100%";
                myimage.style.height = "100%";
                myimage.style.left = "0%";
                myimage.style.top = "0%";
                myimage.style.position = "absolute";
                myimage.src = "pic/frame1.png";         //src="pic/frame1.png"
                mydiv.appendChild(myimage);

                var myimage2 = document.createElement("img");
                myimage2.style.width = "100%";
                myimage2.style.height = "90%";
                myimage2.style.left = "0%";
                myimage2.style.top = "10%";
                myimage2.style.position = "absolute";
                myimage2.src = "pic/frame2.png";
                mydiv.appendChild(myimage2);
            
                // 标题
                var label_title = document.createElement("label");
                label_title.style.width = "40%";
                label_title.style.left = "30%";
                label_title.style.top = "3%";
                label_title.style.height = "20px";
                label_title.style.fontSize = "14px";
                label_title.style.position = "absolute";
                label_title.style.color = "white";
                label_title.style.textAlign = "center";
                label_title.textContent = object_name;
                mydiv.appendChild(label_title);

            }



            if (type == "设备数据显示")
            {
                mydiv = document.createElement("div");
                mydiv.id = "mydiv_" + object_name;
                mydiv.style.position = "absolute";
            
                var source = Get_Json_Value(allvalue,"数据源");            // Read_Value(ini_name, object_name, "数据源");
                var mainindex = Get_Json_Value(allvalue, "数据索引");      // Read_Value(ini_name, object_name, "数据索引");
                var value_string;
                var subindex;
                var subindex_number;
                if (source != "") {
                    //  value_string =  get_result_sql("select value" + mainindex + " from shebeitable where shebeiname=\"" + source + "\"");
                     
                    subindex = Get_Json_Value(allvalue, "数据次索引");  //Read_Value(ini_name, object_name, "数据次索引");
                    subindex_number = parseInt(subindex);
                    var danwei = Get_Json_Value(allvalue, "单位");
                    get_result_sql_to_objectcontent("select value" + mainindex + " from shebeitable where shebeiname=\"" + source + "\"", subindex_number, danwei, "mydiv_" + object_name);
                }
                mydiv.style.color = "white";
                mydiv.style.textAlign = "center";

                 // 更写一个get_reslut_sql(sql,次索引,单位,物体各称)
            }

            if (type == "间接数据显示")
            {
                mydiv = document.createElement("div");
                mydiv.id = "mydiv_" + object_name;
                mydiv.style.position = "absolute"
                var source = Get_Json_Value(allvalue, "数据源");        // Read_Value(ini_name, object_name, "数据源");
                //var value_string = get_result_sql(source);
                //var value_json = From_Text_To_Json(value_string);
                var danwei = Get_Json_Value(allvalue, "单位");
                get_result_sql_to_objectcontent(source, 1, danwei, "mydiv_" + object_name);
                mydiv.style.color = "white";
                //mydiv.textContent = value_json[0].toString();
                mydiv.style.textAlign = "center";
            }

            if (type == "文本")
            {
                mydiv = document.createElement("div");
                mydiv.id = "mydiv_" + object_name;
                mydiv.style.position = "absolute";

                var text = Get_Json_Value(allvalue, "文本");            // Read_Value(ini_name, object_name, "文本");
                mydiv.textContent = text;
                mydiv.style.color = "white";
                mydiv.style.textAlign = "center";
            }

            if (type == "状态指示灯")
            {
                mydiv = document.createElement("div");
                mydiv.id = "mydiv_" + object_name;
                mydiv.style.position = "absolute";
                mydiv.style.borderRadius = "100%";
                var source = Get_Json_Value(allvalue, "数据源");           // Read_Value(ini_name, object_name, "数据源");
                var value_string;
                var subindex;
                var subindex_number;
                if (source != "") {
                    mainindex = Get_Json_Value(allvalue, "数据索引");     //Read_Value(ini_name, object_name, "数据索引");
                 //   value_string = get_result_sql("select value" + mainindex + " from shebeitable where shebeiname=\"" + source + "\"");
                    subindex = Get_Json_Value(allvalue, "数据次索引");    //  Read_Value(ini_name, object_name, "数据次索引");
                }
                var subindex_number = parseInt(subindex);
               // var value_json = From_Text_To_Json(value_string);

                get_result_sql_to_bit("select value" + mainindex + " from shebeitable where shebeiname=\"" + source + "\"", subindex_number, "mydiv_" + object_name, Get_Json_Value(allvalue, "非0状态"), Get_Json_Value(allvalue, "0状态"));
           
               // var value = Get_Kongge_String(value_json[0].toString(), subindex_number);

                //if(value=="0")
                //{
                //    mydiv.style.backgroundColor = Get_Json_Value(allvalue, "0状态"); //Read_Value(ini_name, object_name, "0状态");
                //}
                //else
                //{
                //    mydiv.style.backgroundColor = Get_Json_Value(allvalue, "非0状态"); //  Read_Value(ini_name, object_name, "非0状态");
                //}

            }

            if (type == "饼形图")
            {
                try {
                    mydiv = document.createElement("div");
                    mydiv.id = "mydiv_" + object_name;
                    mydiv.style.position = "absolute";
                    mydiv.style.borderRadius = "100%";

                    var parent = Get_Json_Value(allvalue, "父结点");    //   Read_Value(ini_name, object_name, "父结点")
                    if (parent == "") {
                        var sub = document.getElementById(subdiv_name);
                        sub.appendChild(mydiv);
                    }
                    else {
                        var sub = document.getElementById("mydiv_" + parent);
                        sub.appendChild(mydiv);
                    }
                    var width = Get_Json_Value(allvalue, "width");  //  Read_Value(ini_name, object_name, "width");

                    if (width != "") {
                        mydiv.style.width = width;
                    }

                    var left = Get_Json_Value(allvalue, "left");  // Read_Value(ini_name, object_name, "left");
                    if (left != "") {
                        mydiv.style.left = left;
                    }

                    var top = Get_Json_Value(allvalue, "top"); //Read_Value(ini_name, object_name, "top")
                    if (top != "") {
                        mydiv.style.top = top;
                    }

                    var height = Get_Json_Value(allvalue, "height"); //  Read_Value(ini_name, object_name, "height")
                    if (height != "") {
                        mydiv.style.height = height;
                    }



                    var count_string = Get_Json_Value(allvalue, "数量"); // Read_Value(ini_name, object_name, "数量");
                    var count = parseInt(count_string);

                    var value_array = new Array();
                    var color_array = new Array();
                    var title_array = new Array();
                    for(var j=1;j<=count;j++)
                    {
                        var sql_string = Get_Json_Value(allvalue, "数据源"+j.toString());  // Read_Value(ini_name, object_name, "数据源" + i.toString());
                        var value_string = get_result_sql(sql_string);
                        var value_json = From_Text_To_Json(value_string);
                        value_array.push(value_json[0].toString());

                        var color = Get_Json_Value(allvalue, "颜色"+j.toString());  //  Read_Value(ini_name, object_name, "颜色" + i.toString());
                        color_array.push(color);

                        var label = Get_Json_Value(allvalue, "标题" + j.toString()); //Read_Value(ini_name, object_name, "标题" + i.toString());
                        title_array.push(label);
                    }

                    var canvas = document.createElement("canvas");
                    canvas.id = "canvas_" + object_name;
                    canvas.style.left = 0;
                    canvas.style.width = "100%";
                    canvas.style.top = 0;
                    canvas.style.height = "100%";
                    canvas.style.position = "absolute";
                    mydiv.appendChild(canvas);
                    var myRadarChart;
                    Show_Pie(myRadarChart,value_array,color_array,color_array,title_array,"canvas_" + object_name);
                    //function Show_Pie(myRadarChart,value_array,color_array,highlight_array,label_array,canvas_name)
                }
                catch(err){}
            }

            if (type == "单曲线")
            {
                try {
                    mydiv = document.createElement("div");
                    mydiv.id = "mydiv_" + object_name;
                    mydiv.style.position = "absolute";
                    mydiv.style.borderRadius = "100%";

                    var parent = Get_Json_Value(allvalue, "父结点");    //   Read_Value(ini_name, object_name, "父结点")
                    if (parent == "") {
                        var sub = document.getElementById(subdiv_name);
                        sub.appendChild(mydiv);
                    }
                    else {
                        var sub = document.getElementById("mydiv_" + parent);
                        sub.appendChild(mydiv);
                    }
                    var width = Get_Json_Value(allvalue, "width");  //  Read_Value(ini_name, object_name, "width");

                    if (width != "") {
                        mydiv.style.width = width;
                    }

                    var left = Get_Json_Value(allvalue, "left");  // Read_Value(ini_name, object_name, "left");
                    if (left != "") {
                        mydiv.style.left = left;
                    }

                    var top = Get_Json_Value(allvalue, "top"); //Read_Value(ini_name, object_name, "top")
                    if (top != "") {
                        mydiv.style.top = top;
                    }

                    var height = Get_Json_Value(allvalue, "height"); //  Read_Value(ini_name, object_name, "height")
                    if (height != "") {
                        mydiv.style.height = height;
                    }



                    

                    //var value_array = new Array();
                    //var color_array = new Array();
                    //var title_array = new Array();
                    //for (var j = 1; j <= count; j++) {
                    //    var sql_string = Get_Json_Value(allvalue, "数据源" + j.toString());  // Read_Value(ini_name, object_name, "数据源" + i.toString());
                    //    var value_string = get_result_sql(sql_string);
                    //    var value_json = From_Text_To_Json(value_string);
                    //    value_array.push(value_json[0].toString());

                    //    var color = Get_Json_Value(allvalue, "颜色" + j.toString());  //  Read_Value(ini_name, object_name, "颜色" + i.toString());
                    //    color_array.push(color);

                    //    var label = Get_Json_Value(allvalue, "标题" + j.toString()); //Read_Value(ini_name, object_name, "标题" + i.toString());
                    //    title_array.push(label);
                    //}

                    var sql_string = Get_Json_Value(allvalue, "数据源");
                    var value_string = get_result_sql(sql_string);

                  //  alert(value_string);

                    var value_json = From_Text_To_Json(value_string);

                    var value_array = new Array();
                    var label_array = new Array();

                    for (var x = 0; x < value_json.length; x++)
                    {
                        var time = value_json[x][0].toString();
                        var value = value_json[x][1].toString();
                        value_array.push([value]);
                        label_array.push(time);
                    }

                    var canvas = document.createElement("canvas");
                    canvas.id = "canvas_" + object_name;
                    canvas.style.left = 0;
                    canvas.style.width = "100%";
                    canvas.style.top = 0;
                    canvas.style.height = "100%";
                    canvas.style.position = "absolute";
                    mydiv.appendChild(canvas);

                    var title = document.createElement("div");
                    title.style.position = "absolute";
                    title.style.left = "30%";
                    title.style.width = "40%";
                    title.style.top = "-20px";
                    title.style.height = "18px";
                    title.style.fontSize = "16px";
                    title.textContent = object_name;
                    mydiv.appendChild(title);
                    mydiv.style.color = "white";
                    mydiv.style.textAlign = "center";
                    var myRadarChart;
                    Show_Line(myRadarChart, value_array, label_array, "canvas_" + object_name);


                   // Show_Pie(myRadarChart, value_array, color_array, color_array, title_array, "canvas_" + object_name);
                    //function Show_Pie(myRadarChart,value_array,color_array,highlight_array,label_array,canvas_name)
                }
                catch (err) { }
            }

            if (type == "表格") {
                mydiv = document.createElement("div");
                mydiv.id = Get_Json_Value(allvalue, "设备名") + "_" + object_name;
                mydiv.style.position = "absolute";
                mydiv.style.overflowX = "auto";
                
                // 定义头文件
                var header_width;
                var sum_width = 0;
                var col_count = Get_Json_Value(allvalue, "列数");
                
                var header_div_main = document.createElement("div");
                

                for (var j = 0; j < col_count; j++) {
                    var width = Get_Json_Value(allvalue, "列" + (j + 1).toString() + "width");
                    var width_int = parseInt(width);

                    var header_div = document.createElement("div");
                    header_div.style.width = width_int + "px";
                    header_div.style.left = sum_width + "px";
                    header_div.style.top = 0;
                    header_div.style.height = "40px";
                    header_div.style.fontSize = "18px";
                    header_div.style.textAlign = "center";
                    header_div.textContent = Get_Json_Value(allvalue, "列" + (j + 1).toString() + "名称");
                    header_div.style.color = "white";
                    header_div.style.position = "absolute";
                    sum_width = sum_width + width_int;
                    header_div_main.appendChild(header_div);
                }


                // 将数据放入表格中
                // 参数1：sql 参数2：allvalue 参数3:count 参数4 div_name


                header_div_main.style.left = "0px";
                header_div_main.style.width = sum_width + "px";
                header_div_main.style.top = "0px";
                header_div_main.style.height = "42px";



                mydiv.appendChild(header_div_main);

                // 生成表格
                var datagrid = document.createElement("div");
                datagrid.id="sub_gridview_"+object_name;
                datagrid.style.left="0%";
                datagrid.style.top="40px"
                datagrid.style.height = "80%";

                
               
                mydiv.appendChild(datagrid);
                

                get_result_sql_to_datagrid(Get_Json_Value(allvalue, "数据源"), allvalue, col_count, "sub_gridview_" + object_name);
                
            }

            if (type == "添加巡检信息")
            {
                mydiv = document.createElement("div");
                mydiv.id = Get_Json_Value(allvalue, "设备名") + "_" + object_name; // ; Read_Value(ini_name, object_name, "设备名") + "_" + object_name;
                mydiv.style.position = "absolute";
                mydiv.style.borderRadius = "100%";
                mydiv.style.textAlign = "center";
                mydiv.textContent = "添加巡检信息";
                mydiv.style.color = "white";
                mydiv.style.cursor = "pointer";
               

                mydiv.onclick= function(event)
                {
                    Show_Add_Info_View(event.currentTarget.id);

                    // 读取职位信息

                    get_result_sql_to_select("SELECT zhiwei_Name FROM saigedatabase.zhiwei_table", "add_info_type_duty_select");
                }
            }

            if (type == "本人发送信息表格")
            {
                var username = getCookie("username");
                mydiv = document.createElement("div");
                mydiv.id = "mydiv_" + object_name;
                mydiv.style.position = "absolute";
                var result_string = get_result_sql("SELECT savetime,device,info,type,pic,pic2,pic3,touser,have_senn FROM saigedatabase.search_info_table where user=\"" + username + "\" order by savetime desc limit 100");
                var result_json = From_Text_To_Json(result_string);


                var sub_div = document.createElement("div");
                sub_div.style.left = "0%";
                sub_div.style.width = (180*9).toString()+"px";
                sub_div.style.top="20%";
                sub_div.style.height = "69%";
                sub_div.style.position = "absolute";
                sub_div.style.overflowY = "scroll";


                mydiv.appendChild(sub_div);
                mydiv.style.overflowX = "scroll";
                
                for(var x=0;x<result_json.length;x++)
                {
                    // 设定各种表格
                    var label_savetime = document.createElement("div");
                    label_savetime.style.position = "absolute";
                    label_savetime.style.left = "0px";
                    label_savetime.style.width = "180px";
                    label_savetime.style.top = (x * 180+80).toString() + "px";
                    label_savetime.style.height = "180px";
                    label_savetime.style.textAlign = "center";
                    label_savetime.textContent = result_json[x][0].toString();
                    label_savetime.style.color = "white";
                    sub_div.appendChild(label_savetime);

                    // 设备名
                    var label_device = document.createElement("div");
                    label_device.style.position = "absolute";
                    label_device.style.left = "180px";
                    label_device.style.width = "180px";
                    label_device.style.top = (x * 180 + 80).toString() + "px";
                    label_device.style.height = "180px";
                    label_device.style.textAlign = "center";
                    label_device.textContent = result_json[x][1].toString();
                    label_device.style.color = "white";
                    sub_div.appendChild(label_device);

                    // 信息
                    var label_info = document.createElement("div");
                    label_info.style.position = "absolute";
                    label_info.style.left = "360px";
                    label_info.style.width = "180px";
                    label_info.style.top = (x * 180 + 80).toString() + "px";
                    label_info.style.height = "180px";
                    label_info.style.textAlign = "center";
                    label_info.textContent = result_json[x][2].toString();
                    label_info.style.color = "white";
                    sub_div.appendChild(label_info);

                    // 类型 
                    var label_type = document.createElement("div");
                    label_type.style.position = "absolute";
                    label_type.style.left = "540px";
                    label_type.style.width = "180px";
                    label_type.style.top = (x * 180 + 80).toString() + "px";
                    label_type.style.height = "180px";
                    label_type.style.textAlign = "center";
                    label_type.textContent = result_json[x][3].toString();
                    label_type.style.color = "white";
                    sub_div.appendChild(label_type);

                    // 图片1
                    try{
                        var label_pic1 = document.createElement("img");
                        label_pic1.style.position = "absolute";
                        label_pic1.style.left = "720px";
                        label_pic1.style.width = "180px";
                        label_pic1.style.top = (x * 180 + 80).toString() + "px";
                        label_pic1.style.height = "180px";
                        label_pic1.style.textAlign = "center";
                        label_pic1.src = "images//" + result_json[x][4].toString();
                        sub_div.appendChild(label_pic1);
                    }

                    catch(err){}

                    // 图片2
                    try{
                        var label_pic2 = document.createElement("img");
                        label_pic2.style.position = "absolute";
                        label_pic2.style.left = "900px";
                        label_pic2.style.width = "180px";
                        label_pic2.style.top = (x * 180 + 80).toString() + "px";
                        label_pic2.style.height = "180px";
                        label_pic2.style.textAlign = "center";
                        label_pic2.src = "images//" + result_json[x][5].toString();
                        sub_div.appendChild(label_pic2);
                    }
                    catch(err){}

                    // 图片3
                    try{
                        var label_pic3 = document.createElement("img");
                        label_pic3.style.position = "absolute";
                        label_pic3.style.left = "1080px";
                        label_pic3.style.width = "180px";
                        label_pic3.style.top = (x * 180 + 80).toString() + "px";
                        label_pic3.style.height = "180px";
                        label_pic3.style.textAlign = "center";
                        label_pic3.src = "images//" + result_json[x][6].toString();
                        sub_div.appendChild(label_pic3);


                    }
                    catch(err){}

                    // 目标用户
                    var label_touser = document.createElement("div");
                    label_touser.style.position = "absolute";
                    label_touser.style.left = "1260px";
                    label_touser.style.width = "180px";
                    label_touser.style.top = (x * 180 + 80).toString() + "px";
                    label_touser.style.height = "180px";
                    label_touser.style.textAlign = "center";
                    label_touser.textContent = result_json[x][7].toString();
                    label_touser.style.color = "white";
                    sub_div.appendChild(label_touser);

                    // 是否确认
                    var label_sure = document.createElement("div");
                    label_sure.style.position = "absolute";
                    label_sure.style.left = "1440px";
                    label_sure.style.width = "180px";
                    label_sure.style.top = (x * 180 + 80).toString() + "px";
                    label_sure.style.height = "180px";
                    label_sure.style.textAlign = "center";
                    label_sure.textContent = result_json[x][8].toString();
                    label_sure.style.color = "white";
                    sub_div.appendChild(label_sure);
                }
            }


            if (type == "发送给本人信息表格")
            {
                var username = getCookie("username");
                mydiv = document.createElement("div");
                mydiv.id = "mydiv_" + object_name;
                mydiv.style.position = "absolute";
                var result_string = get_result_sql("SELECT search_info_id,savetime,device,info,user,type,pic,pic2,pic3,have_senn FROM saigedatabase.search_info_table where touser=\"" + username + "\" order by savetime desc limit 100");
                var result_json = From_Text_To_Json(result_string);

                var sub_div = document.createElement("div");
                sub_div.style.left = "0%";
                sub_div.style.width = (180 * 9+100).toString() + "px";
                sub_div.style.top = "20%";
                sub_div.style.height = "69%";
                sub_div.style.position = "absolute";
                sub_div.style.overflowY = "scroll";


                mydiv.appendChild(sub_div);
                mydiv.style.overflowX = "scroll";


                for(var x=0;x<result_json.length;x++)
                {
                    // 按钮
                    var button = document.createElement("input");
                    button.style.position = "absolute";
                    button.style.left = "10px";
                    button.style.width = "80px";
                    button.style.top = (x * 180 + 80).toString() + "px";
                    button.style.height = "40px";
                    button.style.fontSize = "28px";
                    button.textContent = "确认";
                    button.value = "确认";
                    button.style.textAlign = "center";
                    button.id = "button_ok_" + result_json[x][0].toString();
                    button.type = "button";

                    button.onclick=function(event)
                    {
                        var info_id = Get_Xiahuaxian_String(event.currentTarget.id, 3);
                        // 将
                        ex_sql("update search_info_table set have_senn=\"是\" where search_info_id=\"" + info_id + "\"");

                        try {
                            Read_View(Get_Xiahuaxian_String(current_id, 2), "div_detail_content");
                        }
                        catch (err) { }
                    }

                    if(result_json[x][9].toString()=="否")
                    {
                        sub_div.appendChild(button);
                    }

                    // 时间
                    var label_savetime = document.createElement("div");
                    label_savetime.style.position = "absolute";
                    label_savetime.style.left = (100+0*180).toString()+"px";
                    label_savetime.style.width = "180px";
                    label_savetime.style.top = (x * 180 + 100).toString() + "px";
                    label_savetime.style.height = "180px";
                    label_savetime.style.textAlign = "center";
                    label_savetime.textContent = result_json[x][1].toString();
                    label_savetime.style.color = "white";
                    sub_div.appendChild(label_savetime);

                    // 设备
                    var label_savetime = document.createElement("div");
                    label_savetime.style.position = "absolute";
                    label_savetime.style.left = (100 + 1 * 180).toString() + "px";
                    label_savetime.style.width = "180px";
                    label_savetime.style.top = (x * 180 + 100).toString() + "px";
                    label_savetime.style.height = "180px";
                    label_savetime.style.textAlign = "center";
                    label_savetime.textContent = result_json[x][2].toString();
                    label_savetime.style.color = "white";
                    sub_div.appendChild(label_savetime);

                    // 信息
                    var label_savetime = document.createElement("div");
                    label_savetime.style.position = "absolute";
                    label_savetime.style.left = (100 + 2 * 180).toString() + "px";
                    label_savetime.style.width = "180px";
                    label_savetime.style.top = (x * 180 + 100).toString() + "px";
                    label_savetime.style.height = "180px";
                    label_savetime.style.textAlign = "center";
                    label_savetime.textContent = result_json[x][3].toString();
                    label_savetime.style.color = "white";
                    sub_div.appendChild(label_savetime);

                    // 信息来源
                    var label_savetime = document.createElement("div");
                    label_savetime.style.position = "absolute";
                    label_savetime.style.left = (100 + 3 * 180).toString() + "px";
                    label_savetime.style.width = "180px";
                    label_savetime.style.top = (x * 180 + 100).toString() + "px";
                    label_savetime.style.height = "180px";
                    label_savetime.style.textAlign = "center";
                    label_savetime.textContent = result_json[x][4].toString();
                    label_savetime.style.color = "white";
                    sub_div.appendChild(label_savetime);

                    // 信息种类
                    var label_savetime = document.createElement("div");
                    label_savetime.style.position = "absolute";
                    label_savetime.style.left = (100 + 4 * 180).toString() + "px";
                    label_savetime.style.width = "180px";
                    label_savetime.style.top = (x * 180 + 100).toString() + "px";
                    label_savetime.style.height = "180px";
                    label_savetime.style.textAlign = "center";
                    label_savetime.textContent = result_json[x][5].toString();
                    label_savetime.style.color = "white";
                    sub_div.appendChild(label_savetime);


                    // 图片1
                    // 图片1
                    try {
                        var label_pic1 = document.createElement("img");
                        label_pic1.style.position = "absolute";
                        label_pic1.style.left = (100 + 5 * 180).toString() + "px";
                        label_pic1.style.width = "180px";
                        label_pic1.style.top = (x * 180 + 80).toString() + "px";
                        label_pic1.style.height = "180px";
                        label_pic1.style.textAlign = "center";
                        label_pic1.src = "images//" + result_json[x][6].toString();
                        sub_div.appendChild(label_pic1);
                    }

                    catch (err) { }

                    // 图片2
                    try {
                        var label_pic1 = document.createElement("img");
                        label_pic1.style.position = "absolute";
                        label_pic1.style.left = (100 + 6 * 180).toString() + "px";
                        label_pic1.style.width = "180px";
                        label_pic1.style.top = (x * 180 + 80).toString() + "px";
                        label_pic1.style.height = "180px";
                        label_pic1.style.textAlign = "center";
                        label_pic1.src = "images//" + result_json[x][7].toString();
                        sub_div.appendChild(label_pic1);
                    }

                    catch (err) { }

                    // 图片3
                    try {
                        var label_pic1 = document.createElement("img");
                        label_pic1.style.position = "absolute";
                        label_pic1.style.left = (100 + 7 * 180).toString() + "px";
                        label_pic1.style.width = "180px";
                        label_pic1.style.top = (x * 180 + 80).toString() + "px";
                        label_pic1.style.height = "180px";
                        label_pic1.style.textAlign = "center";
                        label_pic1.src = "images//" + result_json[x][8].toString();
                        sub_div.appendChild(label_pic1);
                    }

                    catch (err) { }

                    // 是否看见
                    var label_savetime = document.createElement("div");
                    label_savetime.style.position = "absolute";
                    label_savetime.style.left = (100 + 8 * 180).toString() + "px";
                    label_savetime.style.width = "180px";
                    label_savetime.style.top = (x * 180 + 100).toString() + "px";
                    label_savetime.style.height = "180px";
                    label_savetime.style.textAlign = "center";
                    label_savetime.textContent = result_json[x][9].toString();
                    label_savetime.style.color = "white";
                    sub_div.appendChild(label_savetime);



                }

            }




            if(type=="")
            {
                break;
            }

            

            var parent = Get_Json_Value(allvalue, "父结点");  // Read_Value(ini_name, object_name, "父结点")
           
            if (parent == "") {
                var sub = document.getElementById(subdiv_name);
                sub.appendChild(mydiv);
            }
            else {
                var sub = document.getElementById("mydiv_" + parent);
                sub.appendChild(mydiv);
            }
            var width = Get_Json_Value(allvalue, "width");  //Read_Value(ini_name, object_name, "width");


            mydiv.fontSize = "30px";
            if (width != "") {
                mydiv.style.width = width;
            }

            var left = Get_Json_Value(allvalue, "left"); //Read_Value(ini_name, object_name, "left");
            if (left != "") {
                mydiv.style.left = left;
            }

            var top = Get_Json_Value(allvalue, "top");    //Read_Value(ini_name, object_name, "top")
            if (top != "") {
                mydiv.style.top = top;
            }

            var height = Get_Json_Value(allvalue, "height");  //Read_Value(ini_name, object_name, "height")
            if (height != "") {
                mydiv.style.height = height;
            }

       
        }catch(err){}
    }
}


function Read_Value(ini_name,section_name,key)
{
    var value_string;
    $.ajax({
        url: "SqlCaozuo.asmx/Read_Init",
        type: "Post",
        dataType: "text",
        async: false,
        contentType: "application/json; charset=utf-8",
        data: "{ini_path_name:'" + ini_name + "',section:'" + section_name + "',key:'"+key + "'}",
        success: function (data) {
            value_string = data;

        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });

    var value_json = From_Text_To_Json(value_string);
    return value_json;
}

function Read_All_Value(ini_name,section_name)
{
    var value_string;
    $.ajax({
        url: "SqlCaozuo.asmx/ReadKeys",
        type: "Post",
        dataType: "text",
        async: false,
        contentType: "application/json; charset=utf-8",
        data: "{iniFilename:'" + ini_name + "',SectionName:'" + section_name + "'}",
        success: function (data) {
            value_string = data;
           
        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });
    var value_json = From_Text_To_Json(value_string);
    return value_json;

}

function Get_Json_Value(json,key)
{
    for(var i=0;i<json.length;i++)
    {
        //  alert(json[i].toString());
        try{
            if(Get_Maohao_String(json[i].toString(),1)==key)
            {
                return Get_Maohao_String(json[i].toString(), 2);
            }
        }
        catch(err){}
    }
    return "";
}

