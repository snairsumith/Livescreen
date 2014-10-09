<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Login and Registration Form</title>
       
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
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
                <h1>Livescrenzz.Com  <span></span></h1>
				
            </header>
            <section>				
                <div id="container_demo" >
                  
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                          
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Your moblile no or username </label>
                                    <asp:TextBox  ID="username" runat="server" required="required"  placeholder="9611111111"></asp:TextBox>
                                   
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                    <asp:TextBox ID="password" runat="server" required="required" 
                                        placeholder="eg. X8df!90EO" TextMode="Password"></asp:TextBox>
                                    
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                <p class="login button"> 
                                    <asp:Button ID="Button1" runat="server" Text="login" Width="71px" BackColor="#3366FF" 
                    ForeColor="White" onclick="Button1_Click"  />
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="reg1.aspx" class="to_register">Join us</a>
								</p>
                           
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                           
                        </div>

                       
						 <div> <asp:Button ID="Button4" runat="server" Text="Sign Up" onclick="Button4_Click"></asp:Button></div>
                    </div>
                </div>  
            </section>
        </div>
    </form>
</body>
</html>
