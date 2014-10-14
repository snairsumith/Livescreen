<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="User_Chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
           .errMsg
        {
            width: 200px;
            text-align: left;
            color: yellow;
            font: 12px arial;
            background: red;
            padding: 5px;
            display: none;
        }
       
        .auto-style2 {}
    </style>
    <script type="text/javascript">
        function saveData() {
            var txtMessage = document.getElementById('TextBox1').value; 
            var txtPhno = document.getElementById('HiddenField1').value;
            var roomId = document.getElementById("HiddenField2").value;
          
         
            $.ajax({
                type: "POST",
                url: "Default.aspx/saveData",
                data: "{name:'" + txtMessage + "',email:'" + txtPhno + "',roomid:'"+roomId+"'}",
                contentType: "application/json; charset=utf-8",
                datatype: "jsondata",
                async: "true",
                success: function (response) {
                    $(".errMsg ul").remove();
                    var myObject = eval('(' + response.d + ')');
                    if (myObject > 0) {
                        PageMethods.BindChatData();
                    }
                    else {
                        $(".errMsg").append("<ul><li>Opppps something went wrong.</li></ul>");
                    }
                    $(".errMsg").show("slow");
                    
                },
                error: function (response) {
                    alert(response.status + ' ' + response.statusText);
                }
            });
        }
        function OnSuccess(response, userContext, methodName) {
            alert(response);
        }
    </script>
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
                <td class="auto-style2" >
                    <asp:TextBox ID="TextBox1" runat="server" Height="29px" TextMode="MultiLine" Width="270px"></asp:TextBox>
                </td>
                <td>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    
                    <input type="button" onclick="saveData();" value="Send" /> 
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2" >
                    <div class="errMsg">
                </div>
                    <asp:HiddenField ID="HiddenField2" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
