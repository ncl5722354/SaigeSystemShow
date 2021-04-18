// 开发于2021 04 01日，开发者：倪承龙  赛格物业管理有限公司
// 本文件开发与窗体效果有关的自定义函数

// 函数001 将一个窗体(html或aspx)放入一个iframe中

function Put_Page_In_iFrame(pagename,iframename)
{
    var iframe = document.getElementById(iframename);
    iframe.src = pagename;
}