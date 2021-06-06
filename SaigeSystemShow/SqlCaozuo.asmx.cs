using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using MySql;
using MySql.Data.MySqlClient;
using MySql.Data;
using System.Collections;
using System.Web.Security;

using System.Web.UI.HtmlControls;

using System.Web.UI.WebControls;

using System.Web.UI.WebControls.WebParts;
using System.Text;
using FileOperation;


// 此脚本用来

namespace MEEC_Config_System
{
    /// <summary>
    /// http://58.250.100.13/
    /// SqlCaozuo 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
     [System.Web.Script.Services.ScriptService]

      
    public class SqlCaozuo : System.Web.Services.WebService
    {
        public static string remote_ip = "58.250.100.13";
        public static string database_name = "saigedatabase";
        public static string password = "ncl5722354";
        public static string user="root";
        public static string port="3306";


        [System.Runtime.InteropServices.DllImport("kernel32")]
        public static extern long WritePrivateProfileString(string section, string key, string val, string filePath);

        [System.Runtime.InteropServices.DllImport("kernel32")]

        public static extern int GetPrivateProfileString(string section, string key, string def, System.Text.StringBuilder retVal, int size, string filePath);

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }



        // 从数据库查询中返回一组查询结果
        [WebMethod]
        // 返回
        public ArrayList Get_Sql_Select_Return(string sql)
        {
            ArrayList return_list = new ArrayList();
            // 连接字符串
            string CONNECTIONSTRING = "datasource=" + remote_ip + ";port=" + port + ";database=" + database_name + ";user=" + user + ";pwd=" + password;          //= "datasource=192.168.56.1;port=3306;database=saigedatabase;user=root;pwd=ncl5722354;";      // 连接字符串
            MySqlConnection maindatabase;
            maindatabase = new MySqlConnection(CONNECTIONSTRING);

            try
            {
                maindatabase.Open();

                MySqlCommand mysqlcom = new MySqlCommand(sql, maindatabase);
                MySqlDataReader mysqlread = mysqlcom.ExecuteReader();

                while(mysqlread.Read())
                {
                    int FieldCount = mysqlread.FieldCount;
                    ArrayList row = new ArrayList();
                    for(int i=0;i<FieldCount;i++)
                    {
                        row.Add(mysqlread[i].ToString());

                    }
                    return_list.Add(row);
                }
                mysqlread.Close();
            }
            catch { }

            maindatabase.Close();
            return return_list;
        }
        

        [WebMethod]
        public void Ex_Sql(string sql)
        {
            string CONNECTIONSTRING = "datasource=" + remote_ip + ";port=" + port + ";database=" + database_name + ";user=" + user + ";pwd=" + password;          //= "datasource=192.168.56.1;port=3306;database=saigedatabase;user=root;pwd=ncl5722354;";      // 连接字符串
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


        [WebMethod]
        public void Update_pic(int index,string name)
        {
            
            Random num=new Random();

            var file = System.Web.HttpContext.Current.Request.Files[name];
            
            string pictureName = DateTime.Now.ToString("yyyyMMddHHmmss") + DateTime.Now.Millisecond.ToString() + num.ToString() + index.ToString();   // 图片名称
            if ( file==null)
            {
                //int idx = uploadName.LastIndexOf(".");
                //string suffix = uploadName.Substring(idx);//获得上传的图片的后缀名 
                //pictureName = DateTime.Now.Ticks.ToString() + suffix; 
            }

            try
            {
                if (file!=null)
                {
                    string path = System.Web.HttpContext.Current.Server.MapPath("~/images/");  // Server.MapPath("~/images/");
                    file.SaveAs(path + pictureName);
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex);
            } 
        }

        // 读取ini文件的属性
        [WebMethod]
        public string Read_Init(string ini_path_name, string section, string key)
        {
            // 如果没有文件，创建文件

            FileCaozuo.Create_File(System.Web.HttpContext.Current.Server.MapPath("~/" + ini_path_name));
            StringBuilder temp = new StringBuilder(255);

            int i = GetPrivateProfileString(section, key, "", temp, 255, System.Web.HttpContext.Current.Server.MapPath("~/" + ini_path_name));
            return temp.ToString();
        }

        // 读取所有的section
        [System.Runtime.InteropServices.DllImport("kernel32")]
        public static extern int GetPrivateProfileSectionNames(byte[] buffer, int iLen, string lpFileName);

        [WebMethod]
        public ArrayList ReadSections(string ini_path_name)
        {
            byte[] buffer = new byte[65535];
            int rel = GetPrivateProfileSectionNames(buffer, buffer.GetUpperBound(0), System.Web.HttpContext.Current.Server.MapPath("~/"+ini_path_name));
            return Conver2ArrayList(rel, buffer);
        }
        public ArrayList Conver2ArrayList(int rel, byte[] buffer)
        {
            ArrayList arrayList = new ArrayList();
            if (rel > 0)
            {
                int iCnt, iPos;
                string tmp;
                iCnt = 0; iPos = 0;
                for (iCnt = 0; iCnt < rel; iCnt++)
                {
                    if (buffer[iCnt] == 0x00)
                    {
                        tmp = System.Text.ASCIIEncoding.Default.GetString(buffer, iPos, iCnt - iPos).Trim();
                        iPos = iCnt + 1;
                        if (tmp != "")
                            arrayList.Add(tmp);
                    }
                }
            }
            return arrayList;
        }
       
    }
}
