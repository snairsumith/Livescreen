<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reg1.aspx.cs" Inherits="reg1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    <style type="text/css">
        .style1
        {
            width: 52%;
        }
        .style2
        {
            height: 17px;
        }
        .style3
        {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   
    
     <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
              
                <span class="right">
                   
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
                <h1>Livescreenz.Com  <span></span></h1>
				
            </header>
            <section>				
                <div id="container_demo" >
                  
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="Div1" class="animate form">
                          
                                <h1>Register</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Name </label>
                                    <asp:TextBox ID="usernamesignup" runat="server" 
                    name="usernamesignup" required="required" type="text" placeholder="Your Nanme" 
                    CssClass="style3" ></asp:TextBox>
                                   
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p">Email</label>
                                   <asp:TextBox  runat="server" ID="emailsignup" 
                    name="emailsignup" required="required" type="email" 
                    placeholder="mysupermail@mail.com" CssClass="style3" ></asp:TextBox>
                                </p>
                                  <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Phone No</label>
                                     <asp:TextBox ID="passwordsignup" runat="server" 
                    name="passwordsignup" required="required"  
                    placeholder="Your Mob No" CssClass="style3"></asp:TextBox>
                                </p>
                                
                                <p class="login button"> 
                                    <asp:Button ID="Button1" runat="server" CssClass="style3" 
                    onclick="Button1_Click" Text="Register" />
								</p>
                                
                           <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                               
                           
                        </div>

                       
						 <div> </div>
                    </div>
                </div>  
            </section>
        </div>
    </form>
</body>
</html>
