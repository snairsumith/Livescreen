<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Action.aspx.cs" Inherits="User_Action" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
      <table class="auto-style1">
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" BackColor="#669900" BorderColor="#3399FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Height="100px" Text="SHUTDOWN" Width="250px" OnClick="Button1_Click" />
                </td>
                <td>
                    <asp:Button ID="cmdRestrat" runat="server" BackColor="#660033" BorderColor="#3399FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Height="100px" Text="RESTRAT" Width="250px" OnClick="cmdRestrat_Click" />
                </td>
                <td>
                    <asp:Button ID="cmdLogoff" runat="server" BackColor="#3399FF" BorderColor="#3399FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Height="100px" Text="LOGOFF" Width="250px" OnClick="cmdLogoff_Click" />
                </td>
                <td>
                    <asp:Button ID="cmdShutdown" runat="server" BackColor="#FF9900" BorderColor="#3399FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Height="100px" Text="FORCE SHUTDOWN" Width="250px" OnClick="cmdShutdown_Click" />
                </td>
            </tr>
        </table>
</asp:Content>

