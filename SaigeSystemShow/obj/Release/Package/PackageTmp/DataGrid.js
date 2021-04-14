// 开发于2021 04 01 开发者 倪承龙  赛格物业管理有限公司
// 表格控件DataGrid

//  功能001 用一个sql语句把表格读出来并填满
function Fill_DataGrid_From_Sql(divname,subdiv_name,headdiv_name,sql,userlist,usercontrols_list)
{
    var datagriddiv; // 装整体的
    var subdiv;      // 装数据的
    var headerdiv;   // 装表头的

    try {
        datagriddiv = document.getElementById(divname);
        datagriddiv.style.overflow = "scroll";


        headerdiv = document.getElementById(headdiv_name);
   
        headerdiv.innerHTML = "";


        subdiv = document.getElementById(subdiv_name);

        subdiv.style.overflow = "scroll";

        subdiv.innerHTML = "";

        
    }
    catch(err){}

    $.ajax({
        url:"SqlCaozuo.asmx/Get_Sql_Select_Return",
        type: "Post",
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        data: "{sql:'" + sql+ "'}",
        success: function (data) {
            var json_object=From_Text_To_Json(data);
            
            var rows = json_object.length;

            var length;

            try
            {
                length = json_object[0].length;
            }
            catch(err){}

            subdiv.style.width = (length * 300+100).toString() + "px";   // 定义表格数据部分的长度
            subdiv.style.height = (rows * 60+60).toString() + "px";

            headerdiv.style.width = (length * 300 + 100).toString() + "px";

            
            for(var i=0;i<json_object.length;i++)
            {
             
                for(var j=0;j<json_object[i].length;j++)
                {
                    var label = document.createElement("label");
                    label.style.position = "absolute";
                    label.style.width = "300px";
                    label.style.height = "30px";
                    label.style.left = (300 * j).toString() + "px";
                    label.style.top = (60 * i).toString() + "px";
                    label.style.textAlign = "center";
                    label.style.fontSize = "30px";
                    label.textContent = json_object[i][j].toString();
                    label.id = "data_" + i.toString() + "_" + j.toString() + "_" + rows.toString() + "_" + length.toString();

                    // 在这里加入label的点击事件

                    label.onclick=function(event)
                    {
                        var label_id = event.currentTarget.id;
                        var row = Get_Xiahuaxian_String(label_id, 2);
                        //alert(row);


                        var row_count = new Number(Get_Xiahuaxian_String(label_id, 4));
                        var col_count = new Number( Get_Xiahuaxian_String(label_id, 5));

                        for (var i = 0; i < row_count; i++) {
                            for (j = 0; j < col_count; j++) {

                                var select_label=document.getElementById("data_"+i.toString()+"_"+j.toString()+"_"+row_count.toString()+"_"+col_count.toString());
                                if (i != row) {
                                    select_label.style.backgroundColor = "white";
                                    select_label.style.color = "black";
                                }
                                else {
                                    select_label.style.backgroundColor = "blue";
                                    select_label.style.color = "white";

                                    // 将值放入编辑单中
                                   //     var control = document.getElementById(usercontrols_list[j].toString());


                                    // 将select_label.textContent 放入 该控件中

                                    Set_Control_Value(usercontrols_list[j].toString(), select_label.textContent.toString());

                                    // 这里也可以单独弄一个类
                                    //if (control.type == "text") {
                                    //    control.value = select_label.textContent.toString();
                                    //}

                                    //// 如果控件的类弄是select-one 
                                    //if(control.type=="select-one")
                                    //{
                                    //    for(var z=0;z<control.options.length;z++)
                                    //    {
                                    //        if(control.options[z].value==select_label.textContent.toString())
                                    //        {
                                    //            control.options[z].selected = true;
                                    //        }
                                    //    }

                                    //}
                                }
                                   


                            }
                        }


                    }

                    subdiv.appendChild(label);
                }
            }

            for(var i=0;i<userlist.length;i++)
            {
                var label=document.createElement("label");
                label.style.position = "absolute";
                label.style.width = "300px";
                label.style.height = "30px";
                label.style.left = (300 * i).toString() + "px";
                label.style.top = "0px";
                label.style.textAlign = "center";
                label.style.fontSize = "30px";
                label.textContent = userlist[i].toString();
                label.id = "head" + i.toString();
                headerdiv.appendChild(label);
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