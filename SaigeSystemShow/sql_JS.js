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