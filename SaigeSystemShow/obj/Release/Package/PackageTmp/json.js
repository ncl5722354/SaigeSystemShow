
// 开发于2021 04 03日 开开者 倪承龙 赛格物业管理有限公司



// 001 功能：将从后台返回的文本变成json文件
function From_Text_To_Json(str)
{
    var sub_string = str.substr(5, str.length - 6);
    var json_object = JSON.parse(sub_string);
    return json_object;
}