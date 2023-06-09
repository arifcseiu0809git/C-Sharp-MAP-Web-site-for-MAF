﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!doctype html>
<html>
<head runat="server">
<title>MAF Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Majestic Login Form Widget Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- font files -->
<link href='//fonts.googleapis.com/css?family=Muli:400,300,300italic,400italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Comfortaa:400,300,700' rel='stylesheet' type='text/css'>
<!-- /font files -->
<!-- css files -->
<link href="css/animate-custom.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- /css files -->
</head>
<body>	
<h1 class="w3ls">MAF Sells/Purchase Software</h1>			
<div id="container_demo" >
    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
    <a class="hiddenanchor" id="toregister"></a>
    <a class="hiddenanchor" id="tologin"></a>
    <div id="wrapper">
        <div id="login" class="animate form">
			<form id="form1" runat="server" action="#" method="post" autocomplete="on"> 
                <h2>Log in</h2> 
                <p> 
					<label for="username" class="uname" data-icon="u" ><span>Your email or name</span></label>
                    <input id="username" name="username" runat="server" required="required" type="text" placeholder="EMAIL OR USERNAME"/>
                </p>
                <p> 
                    <label for="password" class="youpasswd" data-icon="p"><span>Your password</span></label>
                    <input id="password" name="password" runat="server" required="required" type="password" placeholder="eg. X8df!90EO" /> 
                </p>
                <p class="keeplogin"> 
					<input type="checkbox" id="brand" value="">
					<label for="brand"><span></span> Remember me?</label>
				</p>
                <p class="login button"> 
                   <%-- <input type="submit" value="Login" /> --%>
                     <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
				</p>
               <%-- <p class="change_link">
					<span>Not a member yet ?</span>
					<a href="#toregister" class="to_register">Register Now</a>
				</p>--%>
                <p>
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </p>
            </form>
        </div>
		<%--<div id="register" class="animate form">
            <form  action="#" method="post" autocomplete="on"> 
                <h2> Sign up </h2> 
                <p> 
					<label for="usernamesignup" class="uname" data-icon="u"><span>Your name</span></label>
                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="USERNAME" />
                </p>
                <p> 
                    <label for="emailsignup" class="youmail" data-icon="e" ><span>Your email</span></label>
                    <input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="EXAMPLE@MAIL.COM"/> 
                </p>
                <p> 
                    <label for="passwordsignup" class="youpasswd" data-icon="p"><span>Your password</span></label>
                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
				</p>
				<p> 
                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p"><span>Please confirm your password</span></label>
                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
                </p>
                <p class="signin button"> 
					<input type="submit" value="Sign up"/> 
				</p>
                <p class="change_link">  
					<span>Already a member ?</span>
					<a href="#tologin" class="to_register">Log In</a>
				</p>
            </form>
        </div>--%>
	</div>
</div>
<%--<p class="agileits">© 2017 POS Login Form. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">w3layouts</a></p>--%>
<p class="agileits">© 2017 MAF Sells/Purchase Software. All Rights Reserved | Designed by ARIF</p>  
</body>
</html>

