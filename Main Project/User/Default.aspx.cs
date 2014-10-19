using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static int saveData(string name, string email, string roomid)
    {
        DBOperations obj = new DBOperations();
        try
        {
            int status = 1;
            string Query = string.Empty;

            Query = "INSERT INTO chat_tbl (userphn,message,roomId) VALUES ('Admin','" + name + "','"+roomid+"')";
            status = obj.executeQuery(Query);


            return status;
        }
        catch
        {
            return -1;
        }
    }
}