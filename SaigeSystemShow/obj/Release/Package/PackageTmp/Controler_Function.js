// 开发于2021 04 03  开发者 倪承龙 赛格物业管理有限公司

// 用数组加入select
function Read_Array_To_Select(array,select_name)
{
    var select = document.getElementById(select_name);
    select.options.length = 0;

    for(var i=0;i<array.length;i++)
    {
        select.add(new Option(array[i].toString(), array[i].toString()));
    }

}

// 用数据库查询结果加入select
function Read_Sql_To_Select(sql,select_name)
{
    $.ajax({
        url: "SqlCaozuo.asmx/Get_Sql_Select_Return",
        type: "Post",
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: "{sql:'" + sql + "'}",
        success: function (data) {
            var json_object = From_Text_To_Json(data);
           
            var select = document.getElementById(select_name);
            select.options.length = 0;

            for (var i = 0; i < json_object.length; i++) {
                select.add(new Option(json_object[i].toString(), json_object[i].toString()));
            }
            
        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });

}



// 将一个值加入一个控件中
function Set_Control_Value(controlname,value)
{
    var control = document.getElementById(controlname);

    if (control.type == "text") {
        control.value = value
    }

    // 如果控件的类弄是select-one 
    if (control.type == "select-one") {
        for (var z = 0; z < control.options.length; z++) {
            if (control.options[z].value == value) {
                control.options[z].selected = true;
            }
        }

    }


}


function Set_Control_animation(controlname, animationname,fill_mode)
{
    var control = document.getElementById(controlname);

    control.style.animation = animationname;
    control.style.animationFillMode = fill_mode;
}


function Set_Control_animation_infinite(controlname, animationname, fill_mode) {
    var control = document.getElementById(controlname);

    control.style.animation = animationname;
    control.style.animationIterationCount = "infinite";
    control.style.animationFillMode = fill_mode;

}


// 内容滚动
function Set_Sroll_Div_In_Div(subdiv)
{
    var mysubdiv = document.getElementById(subdiv);

    var top = parseFloat(mysubdiv.style.top.substr(0, mysubdiv.style.top.length - 2));

    var bottom = parseFloat(mysubdiv.style.bottom.substr(0, mysubdiv.style.bottom.length - 2));

    var height;


    var timer = setInterval(gundong, 40);


    function gundong()
    {
        

        top = parseFloat( mysubdiv.style.top.substr(0, mysubdiv.style.top.length - 2));

        bottom = parseFloat( mysubdiv.style.bottom.substr(0, mysubdiv.style.bottom.length - 2));

        height = parseFloat(mysubdiv.style.height.substr(0, mysubdiv.style.height.length - 2));


        mysubdiv.style.top = (top - 1).toString() + "px";
        mysubdiv.style.bottom = (bottom + 1).toString() + "px";

        if(bottom>=height)
        {
            mysubdiv.style.top = "0px";
            mysubdiv.style.bottom = "0px";
            mysubdiv.style.height = height + "px";

            clearInterval(timer);
            setTimeout(set_timer_again, 5000);
        }
       
       


        function set_timer_again()
        {
            timer=setInterval(gundong,40);
        }
    }

}

// 将array放入div中

function Put_Array_Label_In_Div(array,div_name)
{
    var device_project_subdiv_view = document.getElementById(div_name);

    device_project_subdiv_view.innerHTML="";

    for (var i = 0; i < array.length; i++) {
        var label = document.createElement("label");
        label.style.position = "absolute";
        label.style.top = (i * 30).toString() + "px";
        label.style.left = "5%";
        label.style.height = "30px";
        label.style.width = "90%";
        label.style.fontSize = "20px";
        label.textContent = array[i].toString();
        label.style.color = "#61C9D6";
        label.id = "label_"+ div_name + "_" + i.toString();
        device_project_subdiv_view.appendChild(label);
     //   all_label.push(label.id.toString());

        Set_Animation_Label(label.id);
    }


    device_project_subdiv_view.style.height = ((i + 1) * 30).toString() + "px";
}

function Put_Table_Label_In_Div(arrayitem,arrayleft,arraywidth,div_name)
{
    var subdiv = document.getElementById(div_name);

    subdiv.innerHTML = "";

    for(var i=0;i<arrayitem.length;i++)
    {
        var label_array = arrayitem[i];

        for(var j=0;j<label_array.length;j++)
        {
            var label = document.createElement("label");
            label.style.position = "absolute";
            label.style.top = (i * 30).toString()+"px";
            label.style.left = arrayleft[j];
            label.style.width = arraywidth[j];
            label.style.height = "30px";
            label.textContent = label_array[j].toString();
            label.style.color = "#61C9D6";
            label.id = "label_" + div_name + "_" + i.toString() + "_" + j.toString();
            label.style.textAlign = "center";
            subdiv.appendChild(label);
            Set_Animation_Label(label.id);

        }

    }
    subdiv.style.height = ((i + 1) * 30).toString() + "px";

}



function Show_Pie(myRadarChart,value_array,color_array,highlight_array,label_array,canvas_name)
{
    try
    {
        myRadarChart.clean();
    }
    catch (err) { }

    var ctx = document.getElementById(canvas_name).getContext("2d");

    var options = {
        datasetStrokeWidth: 1,
        pointDotStrokeWidth: 0,
        pointDot: false,
        pointDotRadius: 1,
        pointHitDetectionRadius: 1,
        datasetStroke: false,
        bezierCurveTension: 1,
        datasetFill: false,
        bezierCurve: false,
    };


    var data = {};

    myRadarChart = new Chart(ctx).Pie(data, options);

    for (var i = 0; i < value_array.length; i++) {
        myRadarChart.addData({
            value: value_array[i],
            color: color_array[i],
            highlight: highlight_array[i],
            label: label_array[i]
        });
    }

}