// 开发于2021 04 04 开发者：倪承龙  赛格物业管理有限公司

// 001 在mysql里面执行一个sql语句


function ex_sql(sql)
{
    $.ajax({
        url: "SqlCaozuo.asmx/Ex_Sql",
        type: "Post",
        async: false,
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: "{sql:'" + sql + "'}",
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

// 获取select 的结果
function get_result_sql(sql)
{
    var result;
    $.ajax({
        url: "SqlCaozuo.asmx/Get_Sql_Select_Return",
        type: "Post",
        async: false,
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: "{sql:'" + sql + "'}",
        success: function (data) {
            result = data.toString();
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



// 获取select的结果更新label context

function get_result_sql_to_labelcontent(sql,label_id)
{
    var reslut;
    $.ajax({
        url: "SqlCaozuo.asmx/Get_Sql_Select_Return",
        type: "Post",
        async: true,
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: "{sql:'" + sql + "'}",
        success: function (data) {
            try{
                result = data.toString();

                var reslut_json = From_Text_To_Json(result);

                var reslut_value = reslut_json[0].toString();

                var label = document.getElementById(label_id);

                label.textContent = reslut_value;
            }catch(err){}

        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });
  //  return result;
}

// 将sql读取到的信息给select
function get_result_sql_to_select(sql,select_name)
{
    var reslut;
    $.ajax({
        url: "SqlCaozuo.asmx/Get_Sql_Select_Return",
        type: "Post",
        async: true,
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: "{sql:'" + sql + "'}",
        success: function (data) {
            try {
                result = data.toString();

                var reslut_json = From_Text_To_Json(result);

                var select_object = document.getElementById(select_name);

                select_object.options.length = 0;


                for(var i=0;i<reslut_json.length;i++)
                {
                    var myoption = new Option(reslut_json[i].toString(), reslut_json[i].toString());
                    select_object.add(myoption);
                }

            } catch (err) { }

        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });
}


// 获取直接数据的结果更新某个label_content
function get_result_sql_to_objectcontent(sql,subindex,danwei,div_id)
{
    var reslut;
    $.ajax({
        url: "SqlCaozuo.asmx/Get_Sql_Select_Return",
        type: "Post",
        async: true,
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: "{sql:'" + sql + "'}",
        success: function (data) {
            try {
                result = data.toString();

                var reslut_json = From_Text_To_Json(result);

                var reslut_value = reslut_json[0].toString();

                var value = Get_Kongge_String(reslut_value, subindex);

                var label = document.getElementById(div_id);

                label.textContent = value + danwei;
            } catch (err) { }

        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });
}

function get_result_sql_to_bit(sql,subindex,div_id,true_color,false_color)
{
    var reslut;
    $.ajax({
        url: "SqlCaozuo.asmx/Get_Sql_Select_Return",
        type: "Post",
        async: true,
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: "{sql:'" + sql + "'}",
        success: function (data) {
            try {
                result = data.toString();

                var reslut_json = From_Text_To_Json(result);

                var reslut_value = reslut_json[0].toString();

                var value = Get_Kongge_String(reslut_value, subindex);

                var label = document.getElementById(div_id);

                if(value=="0")
                {
                    label.style.backgroundColor = false_color;
                }
                else
                {
                    label.style.backgroundColor = true_color;
                }


            } catch (err) { }

        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });
}


function get_result_sql_to_datagrid(sql,allvalue,count,div_name)
{
    var reslut;
    $.ajax({
        url: "SqlCaozuo.asmx/Get_Sql_Select_Return",
        type: "Post",
        async: true,
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: "{sql:'" + sql + "'}",
        success: function (data) {
            try {
                result = data.toString();

                var reslut_json = From_Text_To_Json(result);

                var row_height = Get_Json_Value(allvalue, "row_height");
                
                var row_height_int = parseInt(row_height);

                var div = document.getElementById(div_name);

                div.style.overflowY = "auto";
                
                var sum_height = 0;
                for(var z=0;z<reslut_json.length;z++)
                {
                    var sum_width = 0;
                    
                    for(var x=0;x<count;x++)
                    {
                        var width_string = Get_Json_Value(allvalue, "列" + (x+1).toString() + "width");
                        var width_int = parseInt(width_string);
                        var mylabel = document.createElement("div");
                        mylabel.style.width = width_int + "px";
                        mylabel.style.left = sum_width + "px";
                        mylabel.style.height = (row_height_int).toString() + "px";
                        mylabel.style.position = "absolute";
                        mylabel.style.color = "white";
                        mylabel.style.top = (sum_height+80) + "px";
                        mylabel.style.textAlign = "center";
                        
                        if (Get_Json_Value(allvalue, "列" + (x+1).toString() + "类型") == "文字") {
                            mylabel.textContent = reslut_json[z][x].toString();
                        }

                        if (Get_Json_Value(allvalue, "列" + (x + 1).toString() + "类型") == "图片") {
                           
                            // 加入图片
                            var pic = document.createElement("img");
                            pic.style.position = "absolute";
                            pic.style.left = "0%";
                            pic.style.width = "100%";
                            pic.style.top = "0%";
                            pic.style.height = "100%";
                            pic.src = "images//" + reslut_json[z][x].toString();
                            mylabel.appendChild(pic);
                        }
                        div.appendChild(mylabel);
                        sum_width = sum_width + width_int;
                    }
                    sum_height = sum_height + row_height_int;
                   
                }
                


            } catch (err) { }

        },
        error: function (data) {
            //200的响应也有可能被认定为error，responseText中没有Message部分
            return $.parseJSON(data.responseText).Message;
        },
        complete: function (data) {

        }
    });

}



    // 插入的简单用法
    function insert_sql(insert_array,table_name)
    {
        var sql = "insert into " + table_name + " values (";

        for (var i = 0; i < insert_array.length - 1;i++)
        {
            sql = sql + insert_array[i].toString()+",";
        }

        sql = sql + insert_array[insert_array.length - 1].toString() + ")";

        ex_sql(sql);


    }

    function update_sql(update_array, table_name, where_cmd) {
        var sql = "update " + table_name + " set ";

        for (var i = 0; i < update_array.length - 1; i++) {
            sql = sql + update_array[i].toString() + ",";

        }

        sql = sql + update_array[update_array.length - 1].toString() + " " + where_cmd;
    
        ex_sql(sql);
    }

    function select_exit_is(sql)
    {
        var result = get_result_sql(sql);
        if (result.length == 8)
            return "fail";
        else
            return "success";
    }