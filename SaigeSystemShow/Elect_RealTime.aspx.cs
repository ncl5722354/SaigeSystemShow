using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using MySql;
using MySql.Data.MySqlClient;
using MySql.Data;
using System.Collections;
using System.Web.Security;

using System.Web.UI.HtmlControls;

using System.Web.UI.WebControls;

using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Web.Services;

 

namespace SaigeSystemShow
{
    
    public partial class Elect_RealTime : System.Web.UI.Page
    {

        public static string remote_ip = "58.250.100.13";
        public static string database_name = "saigedatabase";
        public static string password = "ncl5722354";
        public static string user = "root";
        public static string port = "3306";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

       [WebMethod]
        public  static void  Update_pic(int index, string name)
        {

            
        }

       protected void add_info_ok_Click(object sender, EventArgs e)
       {
           Random num = new Random();

           var file = System.Web.HttpContext.Current.Request.Files["add_info_pic1_input"];
           var file2 = System.Web.HttpContext.Current.Request.Files["add_info_pic2_input"];
           var file3 = System.Web.HttpContext.Current.Request.Files["add_info_pic3_input"];
           string pictureName="";
           string pictureName2 = "";
           string pictrueName3 = "";

           pictureName = DateTime.Now.ToString("yyyyMMddHHmmss") + DateTime.Now.Millisecond.ToString() + num.ToString() + "1";   // 图片名称
           pictureName2 = DateTime.Now.ToString("yyyyMMddHHmmss") + DateTime.Now.Millisecond.ToString() + num.ToString() + "2";   // 图片名称
           pictrueName3 = DateTime.Now.ToString("yyyyMMddHHmmss") + DateTime.Now.Millisecond.ToString() + num.ToString() + "3";   // 图片名称
           if (file == null)
           {
               //int idx = uploadName.LastIndexOf(".");
               //string suffix = uploadName.Substring(idx);//获得上传的图片的后缀名 
               //pictureName = DateTime.Now.Ticks.ToString() + suffix; 
               pictureName = "";
           }

           if(file2==null)
           {
               pictureName2 = "";
           }

           if(file3==null)
           {
               pictrueName3 = "";
           }

           try
           {
               if (file != null)
               {
                   string path = System.Web.HttpContext.Current.Server.MapPath("~/images/");  // Server.MapPath("~/images/");
                   file.SaveAs(path + pictureName);
               }

               if(file2!=null)
               {
                   string path = System.Web.HttpContext.Current.Server.MapPath("~/images/");  // Server.MapPath("~/images/");
                   file2.SaveAs(path + pictureName2);
               }

               if (file3 != null)
               {
                   string path = System.Web.HttpContext.Current.Server.MapPath("~/images/");  // Server.MapPath("~/images/");
                   file3.SaveAs(path + pictrueName3);
               }


               Random num1=new Random();

               


               string ID= "Info"+DateTime.Now.ToString("yyyyMMddHHmmss")+DateTime.Now.Millisecond.ToString()+num1.ToString();
               var text = Request.Form["add_info_input"].ToString();
             //  string text_string=text;

               var select=Request.Form["add_info_type_select"];

               var user = Request.Cookies["username"].Value;

               Ex_Sql("insert into search_info_table values(\"" + ID + "\",\"" + text + "\",\"" + select + "\",\"" + user + "\",\"" + pictureName + "\",\""+pictureName2+"\",\""+pictrueName3+"\",\"" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "\")");
               
           }
           catch (Exception ex)
           {
               //Response.Write(ex);
           }



       }

       public void Ex_Sql(string sql)
       {
           string CONNECTIONSTRING = "datasource=" +  remote_ip + ";port=" + port + ";database=" + database_name + ";user=" + user + ";pwd=" + password;          //= "datasource=192.168.56.1;port=3306;database=saigedatabase;user=root;pwd=ncl5722354;";      // 连接字符串
           MySqlConnection maindatabase;
           maindatabase = new MySqlConnection(CONNECTIONSTRING);

           try
           {
               maindatabase.Open();
               MySqlCommand mysqlcom = new MySqlCommand(sql, maindatabase);
               mysqlcom.ExecuteNonQuery();
               mysqlcom.Dispose();
           }
           catch { }
           maindatabase.Close();
       }


        

        
    }


}