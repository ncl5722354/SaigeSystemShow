﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using System.IO;


namespace FileOperation
{
    public class ExcelOperation
    {
        public static void DataGridViewToExcelFast(DataGridView ViewMaster)
        {
            SaveFileDialog kk = new SaveFileDialog();   
            kk.Title = "保存EXECL文件";   
            kk.Filter = "EXECL文件(*.xls) |*.xls |所有文件(*.*) |*.*";   
            kk.FilterIndex = 1;
            if (kk.ShowDialog() == DialogResult.OK)
            {
                string FileName = kk.FileName + ".xls";
                if (File.Exists(FileName))
                    File.Delete(FileName);
                FileStream objFileStream;
                StreamWriter objStreamWriter;
                string strLine = "";
                objFileStream = new FileStream(FileName, FileMode.OpenOrCreate, FileAccess.Write);
                objStreamWriter = new StreamWriter(objFileStream, System.Text.Encoding.Unicode);
                for (int i = 0; i < ViewMaster.Columns.Count; i++)
                {
                    if (ViewMaster.Columns[i].Visible == true)
                    {
                        strLine = strLine + ViewMaster.Columns[i].HeaderText.ToString() + Convert.ToChar(9);
                    }
                }
                objStreamWriter.WriteLine(strLine);
                strLine = "";

                for (int i = 0; i < ViewMaster.Rows.Count; i++)
                {
                    if (ViewMaster.Columns[0].Visible == true)
                    {
                        if (ViewMaster.Rows[i].Cells[0].Value == null)
                            strLine = strLine + " " + Convert.ToChar(9);
                        else
                            strLine = strLine + ViewMaster.Rows[i].Cells[0].Value.ToString() + Convert.ToChar(9);
                    }
                    for (int j = 1; j < ViewMaster.Columns.Count; j++)
                    {
                        if (ViewMaster.Columns[j].Visible == true)
                        {
                            if (ViewMaster.Rows[i].Cells[j].Value == null)
                                strLine = strLine + " " + Convert.ToChar(9);
                            else
                            {
                                string rowstr = "";
                                rowstr = ViewMaster.Rows[i].Cells[j].Value.ToString();
                                if (rowstr.IndexOf("\r\n") > 0)
                                    rowstr = rowstr.Replace("\r\n", " ");
                                if (rowstr.IndexOf("\t") > 0)
                                    rowstr = rowstr.Replace("\t", " ");
                                strLine = strLine + rowstr + Convert.ToChar(9);
                            }
                        }
                    }
                    objStreamWriter.WriteLine(strLine);
                    strLine = "";
                }
                objStreamWriter.Close();
                objFileStream.Close();
                MessageBox.Show("保存EXCEL成功", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private static string NumToEn(int iColumnAccount)
        {
            throw new NotImplementedException();
        }
    }
}
