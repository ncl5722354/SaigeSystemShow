// 开发于2021 04 04  开发者 倪承龙  赛格物业管理有限公司


// 001 功能：提取用"-"分开的字符串中间的字符
function Get_Henggang_String(scr, index) {
    // 返回下划线第index个量
    try {
        var count = 0;   // 下划线的数量
        var length = scr.length;
        //var char_arraylist = scr.
        for (var i = 0; i < length; i++) {
            if (scr[i] == '-') {
                count++;
            }
        }
        var _index = new Array();
        var substring = new Array();
        _index[0] = -1;
        var mycount = 1;
        for (var i = 0; i < length; i++) {
            if (i == length - 1) {
                _index[mycount] = i + 1;
                break;
            }
            if (scr[i] == '-') {
                _index[mycount] = i;
                mycount++;
            }
        }
        for (var i = 0; i < count + 1; i++) {
            var start_index = _index[i] + 1;
            var end_index = _index[i + 1];
            substring[i] = scr.substring(start_index, end_index);
        }
        return substring[index - 1];
    }
    catch (err) { return null; }
} // 返回空格第index个量


// 002 功能：提取用"_"分开的字符串中间的字符
function Get_Xiahuaxian_String(scr, index) {
    // 返回下划线第index个量
    try {
        var count = 0;   // 下划线的数量
        var length = scr.length;
        //var char_arraylist = scr.
        for (var i = 0; i < length; i++) {
            if (scr[i] == '_') {
                count++;
            }
        }
        var _index = new Array();
        var substring = new Array();
        _index[0] = -1;
        var mycount = 1;
        for (var i = 0; i < length; i++) {
            if (i == length - 1) {
                _index[mycount] = i + 1;
                break;
            }
            if (scr[i] == '_') {
                _index[mycount] = i;
                mycount++;
            }
        }
        for (var i = 0; i < count + 1; i++) {
            var start_index = _index[i] + 1;
            var end_index = _index[i + 1];
            substring[i] = scr.substring(start_index, end_index);
        }
        return substring[index - 1];
    }
    catch (err) { return null; }
} // 返回空格第index个量


// 004 功能：提取用""分开的字符串中间的字符
function Get_Kongge_String(scr, index) {
    // 返回下划线第index个量
    try {
        var count = 0;   // 下划线的数量
        var length = scr.length;
        //var char_arraylist = scr.
        for (var i = 0; i < length; i++) {
            if (scr[i] == ' ') {
                count++;
            }
        }
        var _index = new Array();
        var substring = new Array();
        _index[0] = -1;
        var mycount = 1;
        for (var i = 0; i < length; i++) {
            if (i == length - 1) {
                _index[mycount] = i + 1;
                break;
            }
            if (scr[i] == ' ') {
                _index[mycount] = i;
                mycount++;
            }
        }
        for (var i = 0; i < count + 1; i++) {
            var start_index = _index[i] + 1;
            var end_index = _index[i + 1];
            substring[i] = scr.substring(start_index, end_index);
        }
        return substring[index - 1];
    }
    catch (err) { return null; }
} // 返回空格第index个量

// 提取用":"分开的字符串中间的字符
function Get_Maohao_String(scr,index)
{
    // 返回下划线第index个量
    try {
        var count = 0;   // 下划线的数量
        var length = scr.length;
        //var char_arraylist = scr.
        for (var i = 0; i < length; i++) {
            if (scr[i] == ':') {
                count++;
            }
        }
        var _index = new Array();
        var substring = new Array();
        _index[0] = -1;
        var mycount = 1;
        for (var i = 0; i < length; i++) {
            if (i == length - 1) {
                _index[mycount] = i + 1;
                break;
            }
            if (scr[i] == ':') {
                _index[mycount] = i;
                mycount++;
            }
        }
        for (var i = 0; i < count + 1; i++) {
            var start_index = _index[i] + 1;
            var end_index = _index[i + 1];
            substring[i] = scr.substring(start_index, end_index);
        }
        return substring[index - 1];
    }
    catch (err) { return null; }
}


// 003 功能：将时间转成yyyyMMddHHmmss这种形式

function To_yyyyMMddHHmmss_From_Date(date)
{
    return date.getFullYear().toString() + (date.getMonth() + 1).toString().padStart(2, '0') + (date.getDate()).toString().padStart(2, '0') + (date.getHours()).toString().padStart(2, '0') + (date.getMinutes()).toString().padStart(2, '0') + (date.getSeconds()).toString().padStart(2, '0');
}


function To_yyyy_MM_dd_HH_mm_ss_From_Data(date)
{
    return date.getFullYear().toString()+"-" + (date.getMonth() + 1).toString().padStart(2, '0')+"-" + (date.getDate()).toString().padStart(2, '0')+" " + (date.getHours()).toString().padStart(2, '0')+":" + (date.getMinutes()).toString().padStart(2, '0')+":" + (date.getSeconds()).toString().padStart(2, '0');
}


function To_yyyy_MM_dd_From_Data(date)
{
    return date.getFullYear().toString() + "-" + (date.getMonth() + 1).toString().padStart(2, '0') + "-" + (date.getDate()).toString().padStart(2, '0');
}

function Get_Week_Day(num)
{
    if (num == "1")
        return "星期一";
    if (num == "2")
        return "星期二";
    if (num == "3")
        return "星期三";
    if (num == "4")
        return "星期四";
    if (num == "5")
        return "星期五";
    if (num == "6")
        return "星期六";
    if (num == "0")
        return "星期日";
}