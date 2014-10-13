using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace Livescreen
{
    class Class1
    {
        string connStr = "Data Source=.;Initial Catalog=Livescreen;User Id=sa;Password=$umith;";
        public DataTable connectoToMySql(string phno)
        {
            string pno = " 91" + phno;

            SqlCommand cmd = null;
            DataTable dataTable = new DataTable();

            try
            {
                //string connStr = "SERVER=localhost;" +
                // "DATABASE=ggn;" +
                // "UID=root;" +
                // "PWD=;";
               

                SqlConnection conn = new SqlConnection(connStr);


                string sql = "select * from SMS where Mode='New' and sender='" + pno+ "'";




                SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
                
                sda.Fill(dataTable);
               

               
               
                //dataGridView.DataSource = dataTable;
                //dataGridView.DataMember = dataTable.TableName;
            }
            catch (Exception ex)
            {
                //MessageBox.Show(string.Format("An error occurred {0}", ex.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {

            }
            return dataTable;
        }
        public int UpdateSMS(string pno)
        { 
           // string p= " 91" + pno;
            SqlCommand cmd = null;
            DataTable dataTable = new DataTable();
            int i=0;
            try
            {
              
                
                SqlConnection conn = new SqlConnection(connStr);

                string sql = "update task_tbl set status=1 where phoneNumber='" + pno + "'";

                cmd = new SqlCommand(sql, conn);
                conn.Open();
                i = cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch(Exception ex)
                {
                }
                return i;


        }
        public DataTable Getaction(string pno)
        {
            DataTable dataTable = new DataTable();

            try
            {
          
              
                SqlConnection conn = new SqlConnection(connStr);
                string sql = "select * from task_tbl where status=0 and phoneNumber='" + pno + "'";
                SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
                sda.Fill(dataTable);

            }
            catch (Exception ex)
            {
                //MessageBox.Show(string.Format("An error occurred {0}", ex.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {

            }
            return dataTable;

        }
        public DataTable GetDownloadeFiles(string pno)
        {
            DataTable dataTable = new DataTable();

            try
            {


                SqlConnection conn = new SqlConnection(connStr);
                string sql = "select * from FileShare where seen=0 and userPhone='" + pno + "'";
                SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
                sda.Fill(dataTable);

            }
            catch (Exception ex)
            {
                //MessageBox.Show(string.Format("An error occurred {0}", ex.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {

            }
            return dataTable;
        }
        public int UpdateStatus(string phnop,string status)
        {
              SqlConnection conn = new SqlConnection(connStr);
              SqlCommand cmd = new SqlCommand("update Login_tbl set status='" + status + "' where username='" + phnop + "'", conn);
              conn.Open();
              int i = cmd.ExecuteNonQuery();
              conn.Close();
              return i;
        }
    }
}
