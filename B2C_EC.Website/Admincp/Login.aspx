<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HoangQuanMobile.Website.Account.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pl" xml:lang="pl">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Paweł 'kilab' Balicki - kilab.pl" />
<title>SimpleAdmin</title>
    <link href="../Styles/admin_login.css" rel="stylesheet" />
</head>
<body>
<div class="wrap">
	<div id="content">
		<div id="main">
			<div class="full_w">
				<form id="frmLogin" runat="server" method="post">
					<label for="login">Username:</label>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="text"></asp:TextBox>
					<label for="pass">Password:</label>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="text"></asp:TextBox>
                    <div><asp:CheckBox ID="cbRemember" Text="Remember me?" runat="server" /></div>
					<div class="sep"><asp:Label ID="lbErrorUser" Text="" runat="server" /></div>
                    <asp:Button ID="btnLogin" CssClass="button ok" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    <%--<asp:Button ID="btnForgot" CssClass="button " runat="server" Text="Forgotten password?" />--%>
				</form>

			</div>
			<div class="footer"> Administrator | Admin Panel</div>
		</div>
	</div>
</div>

</body>
</html>
