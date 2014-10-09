using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;
using System.Net;


namespace Livescreen
{

    public partial class Form1 : Form
    {
        //SqlConnection con = new SqlConnection("Data Source=184.154.49.162;Initial Catalog=edu_livescreenz;User ID=educkshetra;Password=peaches_louis_1987");
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Livescreen;User Id=sa;Password=$umith;");
        Class1 css = new Class1();
        public Form1()
        {
            InitializeComponent();
        }
       


        void createDirectory()
        {
            string path = @"c:\Myapp\" + txtUsername.Text+"\\"+ GetIP();
            try
            {
                if (!Directory.Exists(path))
                {
                    DirectoryInfo di = Directory.CreateDirectory(path);
                   

                }

            }
            catch (Exception e)
            {
                MessageBox.Show("contact for support ");
            }

        }
        public string GetIP()
{
string strHostName = "";
string ip = "",retIp="";
strHostName = System.Net.Dns.GetHostName();

IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);

IPAddress[] addr = ipEntry.AddressList;
for (int i = 0; i < addr.Length; i++)
{
    ip = addr[i].ToString();
    if (ip.StartsWith("115.241")||ip.StartsWith("172.16")||ip.StartsWith("192.168"))
    {
        retIp = ip;

    }
   
}
return retIp;

}
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter sbi = new SqlDataAdapter("select * from Livescreenz where phonenumber='" + txtUsername.Text + "' and password ='" + txtPassword.Text + "'", con);
                DataTable dt = new DataTable();
                sbi.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                   
                    Home h = new Home(txtUsername.Text, dt.Rows[0]["name"].ToString());
                    UpdateOrInsertIp();
                   createDirectory();
                   // css.UpdateSMS(txtUsername.Text);
                    this.Hide();
                    h.Show();


                }
                else
                {
                    MessageBox.Show("Incorrect username and password");
                    txtPassword.Text = "";
                    txtUsername.Text = "";

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Please check your internet connection "+ex.ToString());
            }
        }

        public void UpdateOrInsertIp()
        {
            string sql = "";
            SqlDataAdapter sbi = new SqlDataAdapter("select * from Ip_tbl where userPhno='" + txtUsername.Text + "'", con);
                DataTable dt = new DataTable();
                sbi.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    sql = "update Ip_tbl set userIp='" + GetIP() + "' where userPhno='" + txtUsername.Text + "'";

                }
                else
                {
                    sql = "insert into ip_tbl (userIp,userPhno)values('" + GetIP() + "','" + txtUsername.Text + "')";

                }
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

      

       
    }
}