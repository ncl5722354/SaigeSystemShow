


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
            var type = Read_Value(ini_name, object_name, "类型");
            // 父结点属性 
            

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
            
                var source = Read_Value(ini_name, object_name, "数据源");
                var mainindex = Read_Value(ini_name, object_name, "数据索引");
                var value_string;
                var subindex;
                var subindex_number;
                if (source != "") {
                    value_string = get_result_sql("select value" + mainindex + " from shebeitable where shebeiname=\"" + source + "\"");
                    subindex = Read_Value(ini_name, object_name, "数据次索引");
                    subindex_number = parseInt(subindex);
                }
                var value_json = From_Text_To_Json(value_string);
                mydiv.style.color = "white";
                var danwei = Read_Value(ini_name, object_name, "单位");
                mydiv.textContent = Get_Kongge_String(value_json[0].toString(), subindex_number) + danwei;
                mydiv.style.textAlign = "center";
            }

            if (type == "间接数据显示")
            {
                mydiv = document.createElement("div");
                mydiv.id = "mydiv_" + object_name;
                mydiv.style.position = "absolute"
                var source = Read_Value(ini_name, object_name, "数据源");
                var value_string = get_result_sql(source);
                var value_json = From_Text_To_Json(value_string);
                mydiv.style.color = "white";
                mydiv.textContent = value_json[0].toString();
                mydiv.style.textAlign = "center";
            }

            if (type == "文本")
            {
                mydiv = document.createElement("div");
                mydiv.id = "mydiv_" + object_name;
                mydiv.style.position = "absolute";

                var text = Read_Value(ini_name, object_name, "文本");
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
                var source = Read_Value(ini_name, object_name, "数据源");
                var value_string;
                var subindex;
                var subindex_number;
                if (source != "") {
                    mainindex = Read_Value(ini_name, object_name, "数据索引");
                    value_string = get_result_sql("select value" + mainindex + " from shebeitable where shebeiname=\"" + source + "\"");
                    subindex = Read_Value(ini_name, object_name, "数据次索引");
                }
                var subindex_number = parseInt(subindex);
                var value_json = From_Text_To_Json(value_string);
           
                var value = Get_Kongge_String(value_json[0].toString(), subindex_number);

                if(value=="0")
                {
                    mydiv.style.backgroundColor = Read_Value(ini_name, object_name, "0状态");
                }
                else
                {
                    mydiv.style.backgroundColor = Read_Value(ini_name, object_name, "非0状态");
                }

            }

            if (type == "饼形图")
            {
                try {
                    mydiv = document.createElement("div");
                    mydiv.id = "mydiv_" + object_name;
                    mydiv.style.position = "absolute";
                    mydiv.style.borderRadius = "100%";

                    var parent = Read_Value(ini_name, object_name, "父结点")
                    if (parent == "") {
                        var sub = document.getElementById(subdiv_name);
                        sub.appendChild(mydiv);
                    }
                    else {
                        var sub = document.getElementById("mydiv_" + parent);
                        sub.appendChild(mydiv);
                    }
                    var width = Read_Value(ini_name, object_name, "width");

                    if (width != "") {
                        mydiv.style.width = width;
                    }

                    var left = Read_Value(ini_name, object_name, "left");
                    if (left != "") {
                        mydiv.style.left = left;
                    }

                    var top = Read_Value(ini_name, object_name, "top")
                    if (top != "") {
                        mydiv.style.top = top;
                    }

                    var height = Read_Value(ini_name, object_name, "height")
                    if (height != "") {
                        mydiv.style.height = height;
                    }



                    var count_string = Read_Value(ini_name, object_name, "数量");
                    var count = parseInt(count_string);

                    var value_array = new Array();
                    var color_array = new Array();
                    var title_array = new Array();
                    for(var i=1;i<=count;i++)
                    {
                        var sql_string = Read_Value(ini_name, object_name, "数据源" + i.toString());
                        var value_string = get_result_sql(sql_string);
                        var value_json = From_Text_To_Json(value_string);
                        value_array.push(value_json[0].toString());

                        var color = Read_Value(ini_name, object_name, "颜色" + i.toString());
                        color_array.push(color);

                        var label = Read_Value(ini_name, object_name, "标题" + i.toString());
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

            if (type == "添加巡检信息")
            {
                mydiv = document.createElement("div");
                mydiv.id = Read_Value(ini_name,object_name,"设备名")+"_" + object_name;
                mydiv.style.position = "absolute";
                mydiv.style.borderRadius = "100%";
                mydiv.style.textAlign = "center";
                mydiv.textContent = "添加巡检信息";
                mydiv.style.color = "white";
                mydiv.style.cursor = "pointer";

                mydiv.onclick= function(event)
                {
                    Show_Add_Info_View(event.currentTarget.id);
                }
            }




            if(type=="")
            {
                break;
            }


            var parent = Read_Value(ini_name, object_name, "父结点")
            if (parent == "") {
                var sub = document.getElementById(subdiv_name);
                sub.appendChild(mydiv);
            }
            else {
                var sub = document.getElementById("mydiv_" + parent);
                sub.appendChild(mydiv);
            }
            var width = Read_Value(ini_name, object_name, "width");

            if (width != "") {
                mydiv.style.width = width;
            }

            var left = Read_Value(ini_name, object_name, "left");
            if (left != "") {
                mydiv.style.left = left;
            }

            var top = Read_Value(ini_name, object_name, "top")
            if (top != "") {
                mydiv.style.top = top;
            }

            var height = Read_Value(ini_name, object_name, "height")
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

