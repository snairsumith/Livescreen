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
    }
    [WebMethod]
    public void BindChatData()
    {
        string sql = "select * from chat_tbl where roomId='" + HiddenField2.Value + "'";
        DataTable dt = obj.GetDatatable(sql);
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
   
}