<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="426px">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="User Name" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("username") %>' CommandName="chat">Chat Now</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("username") %>'  CommandName="cntrl">Controlling</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("username") %>'  CommandName="screen">Screen Shot</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="userIp" DataValueField="userPhno">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LivescreenConnectionString %>" SelectCommand="SELECT [userIp], [userPhno] FROM [Ip_tbl]"></asp:SqlDataSource>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" BackColor="#669900" BorderColor="#3399FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Height="100px" Text="SHUTDOWN" Width="250px" />
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" BackColor="#660033" BorderColor="#3399FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Height="100px" Text="RESTRAT" Width="250px" />
                </td>
                <td>
                    <asp:Button ID="Button3" runat="server" BackColor="#3399FF" BorderColor="#3399FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Height="100px" Text="LOGOFF" Width="250px" />
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" BackColor="#FF9900" BorderColor="#3399FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Height="100px" Text="FORCE SHUTDOWN" Width="250px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
