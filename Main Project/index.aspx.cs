using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class index : System.Web.UI.Page
{
    DBOperations objD = new DBOperations();
    int day, year, count = 100;
    String pwd = "";
    String pwd1 = "";
    int no;
    //SMSFunction sm = new SMSFunction();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(objD.getConnectionString());
        con.Open();
        SqlDataAdapter sbi = new SqlDataAdapter("select * from Login_tbl where username='" + username.Text + "' and password ='" + password.Text + "'", con);
        DataTable dt = new DataTable();
        sbi.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Session["user"] = username.Text;


            Response.Redirect("~/User/FileSharing.aspx");

        }
        else
        {
            Label1.Text = "INCORRET USERNAME AND PASSWORD";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
       

    }
}