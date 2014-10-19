using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Screenshot : System.Web.UI.Page
{
    DBOperations obj = new DBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindChatData();
        }
    }
    public void BindChatData()
    {
        string sql = "select * from screenz";
        DataTable dt = obj.GetDatatable(sql);
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
}