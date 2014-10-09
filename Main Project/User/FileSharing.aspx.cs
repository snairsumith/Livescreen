using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FileSharing : System.Web.UI.Page
{
    DBOperations obj = new DBOperations();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string path = "~/UpImages/" + FileUpload1.FileName;
            FileUpload1.PostedFile.SaveAs(Server.MapPath(path));
            string sql = "insert into FileShare(FilePath,userPhone,Date)values('" + path + "','" + DropDownList1.SelectedValue.ToString() + "','"+DateTime.Now.ToString("dd-MM-yyyy")+"')";
            string sql1 = "insert into Task_tbl(action,status,phoneNumber)values(7,0,'" + DropDownList1.SelectedValue.ToString() + "') ";
            obj.Insert(sql);
            obj.Insert(sql1);
            lblMsg.Text = "File send sucessfully";

        }

    }
}