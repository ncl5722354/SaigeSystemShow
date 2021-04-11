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
