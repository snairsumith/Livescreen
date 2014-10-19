using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class reg1 : System.Web.UI.Page
{
    DBOperations objD = new DBOperations();
  
    int day, year, count = 100;
    String pwd = "";
    String pwd1 = "";
    int no;
    SMSFunction sm = new SMSFunction();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(objD.getConnectionString());

        day = DateTime.Now.Day;
        year = DateTime.Now.Year;

        SqlDataAdapter sda = new SqlDataAdapter("select * from livescreenz", con);
        DataTable dt1 = new DataTable();
        sda.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            no = dt1.Rows.Count;

        }
        count = count + no;
        pwd = day.ToString() + year.ToString() + count.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into livescreenz (name,emailid,phonenumber,password) values('" + usernamesignup.Text + "','" + emailsignup.Text + "','" + passwordsignup.Text + "','" + pwd + "')", con);
        SqlCommand cmd1 = new SqlCommand("insert into Login_tbl (username,password) values('" + passwordsignup.Text + "','" + pwd + "')", con);
        int b = cmd1.ExecuteNonQuery();
        int a = cmd.ExecuteNonQuery();
     
        if (a > 0)
        {

            string ph = passwordsignup.Text;
            string msgContent = "Hi " + usernamesignup.Text + " User registration is complete .Your password is:" + pwd.ToString() + ".";

            sm.Message = msgContent;
            sm.ToMobile = ph;
            sm.SendSMS();
            Label1.Text = "successfully registered & password sent to " + ph;
        }
        else
        {
            Label1.Text = "registration failed";
        }
    }
}