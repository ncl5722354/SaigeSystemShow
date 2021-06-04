


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
        var object_name = all_object_json[i];               // 元素名称  seciton


        // 在这里做界面的解析
        // 
        var mydiv;

        // 各种 元素的类型
        var type = Read_Value(ini_name, object_name, "类型");
        if(type=="边框1")
        {
            mydiv = document.createElement("div");
            mydiv.style.position = "absolute";
            
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
        }

        if(type=="")
        {
            break;
        }

        // 父结点属性 
        var parent = Read_Value(ini_name, object_name, "父结点")
        if(parent=="")
        {
            var sub = document.getElementById(subdiv_name);
            sub.appendChild(mydiv);
        }

        var width = Read_Value(ini_name, object_name, "width");

        if(width!="")
        {
            mydiv.style.width = width;
        }

        var left = Read_Value(ini_name, object_name, "left");
        if(left!="")
        {
            mydiv.style.left = left;
        }

        var top = Read_Value(ini_name, object_name, "top")
        if (top != "")
        {
            mydiv.style.top = top;
        }

        var height = Read_Value(ini_name, object_name, "height")
        if (height != "")
        {
            mydiv.style.height = height;
        }
        
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