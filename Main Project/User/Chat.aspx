<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="User_Chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <table class="auto-style1" style="width: 350px; height: auto">
            <tr>
                <td colspan="2">
                    <asp:DataList ID="DataList1" runat="server" Height="138px" Width="344px">
                        <ItemTemplate>
                            <table class="auto-style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text='<%# Eval("clientip") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("message") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:TextBox ID="TextBox1" runat="server" Height="29px" TextMode="MultiLine" Width="270px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" BorderStyle="Solid" BorderWidth="1px" Height="35px" OnClick="Button1_Click" Text="Send" Width="57px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
