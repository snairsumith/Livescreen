using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Chat : System.Web.UI.Page
{
    DBOperations obj = new DBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Request.QueryString["phno"];
        HiddenField2.Value = Request.QueryString["Roomid"];
        Label3.Text = Request.QueryString["phno"];
        Label4.Text = Request.QueryString["Roomid"];
        Timer1.Enabled = true;
    }
 
    public void BindChatData()
    {


       string sql = "SELECT     Livescreenz.name, chat_tbl.message FROM chat_tbl INNER JOIN Livescreenz ON chat_tbl.userphn = Livescreenz.phonenumber WHERE chat_tbl.roomId='" + HiddenField2.Value + "'";
        DataTable dt = obj.GetDatatable(sql);
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        BindChatData();
    }
}