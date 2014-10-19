using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Action : System.Web.UI.Page
{
    DBOperations obj = new DBOperations();
    string sql = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        HiddenField1.Value = Request.QueryString["phno"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        sql = "insert into Task_tbl(action,status,phoneNumber)values(1,0,'" + HiddenField1.Value.ToString() + "') ";
        obj.executeQuery(sql);
    }
    protected void cmdRestrat_Click(object sender, EventArgs e)
    {
        sql = "insert into Task_tbl(action,status,phoneNumber)values(2,0,'" + HiddenField1.Value.ToString() + "') ";
        obj.executeQuery(sql);
    }
    protected void cmdLogoff_Click(object sender, EventArgs e)
    {
        sql = "insert into Task_tbl(action,status,phoneNumber)values(3,0,'" + HiddenField1.Value.ToString() + "') ";
        obj.executeQuery(sql);
    }
    protected void cmdShutdown_Click(object sender, EventArgs e)
    {
        sql = "insert into Task_tbl(action,status,phoneNumber)values(4,0,'" + HiddenField1.Value.ToString() + "') ";
        obj.executeQuery(sql);
    }
}