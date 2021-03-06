﻿using System;
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
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string sql = "",lastInserId="",sql1="",sql3="",phno=e.CommandArgument.ToString();
   
        if (e.CommandName == "chat")
        {
            sql1 = "insert into Chat_RoomTbl(senderId,ReciverId,Status)VALUES('Admin','" + phno + "','Open'); SELECT NewID = SCOPE_IDENTITY();";
           

            lastInserId = obj.GetValue(sql1);

            sql = "insert into Task_tbl(action,status,phoneNumber)values(6,0,'" +phno.ToString() + "') ";
            obj.executeQuery(sql);
            // obj.executeQuery(sql1);
            string url = "Chat.aspx?phno="+phno+"&Roomid="+lastInserId.ToString();
            string s = "window.open('" + url + "', 'popup_window', 'width=350,height=500,left=900,top=500,resizable=no');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }
        else if (e.CommandName == "cntrl")
        {
            Response.Redirect("Action.aspx?phno=" + phno);
        }
        else if (e.CommandName == "screen")
        {
            sql = "insert into Task_tbl(action,status,phoneNumber)values(5,0,'" + phno.ToString() + "') ";
            obj.Insert(sql);
            Response.Redirect("Screenshot.aspx");
        }
       
        Binddata();
    }
}