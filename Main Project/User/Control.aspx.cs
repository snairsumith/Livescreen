using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control : System.Web.UI.Page
{
    DBOperations obj = new DBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        Binddata();
    }
    void Binddata()
    {
        string sql = "select * from Login_tbl where status='Online'";
        DataTable dt = obj.GetDatatable(sql);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}