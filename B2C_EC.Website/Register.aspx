<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="B2C_EC.Website.Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #RegisterForm h6
        {
            font:20px Keble Condensed, Arial, Helvetica, sans-serif;
	        color:#575757;
	        font-weight:100;
	        padding:0px 0px 5px 0px;
	        margin:0px 0px 10px 0px;
        }
        #RegisterForm .body
        {
            font:11px Arial, Helvetica, sans-serif;
	        color:#565656;
	        margin:0px;
	        padding:0px;
            vertical-align:text-top;
        }
        #RegisterForm .button 
        {
	        color:#ffffff;
	        background:#414141;
	        font:bold 11px Arial, Helvetica, sans-serif;
	        text-decoration:none;
	        padding:10px 10px;
	        margin:0px 5px 5px 0;
	        border:1px solid #000000;
            cursor:pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <div id="RegisterForm"><br />
        <h6>Register Form:</h6>
        <table width="97%">
            <tr>
            <td width="70" align="left" valign="top" class="body"><strong>
                First Name:
                </strong></td>
            <td width="280" align="left" valign="top"><asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox" MaxLength="50" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="register"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Last Name:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox" MaxLength="50" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="register"></asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Username:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtUsername" runat="server" CssClass="TextBox" MaxLength="50" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUsername" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="register"></asp:RequiredFieldValidator>
            </td>
            </tr>            
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Password:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtPassword" runat="server" CssClass="TextBox" MaxLength="50" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPassword" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="register"></asp:RequiredFieldValidator>
            </td>
            </tr>            
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Confirm Password:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="TextBox" MaxLength="50" TextMode="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="register" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:CompareValidator>
            </td>
            </tr>
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Email:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="(*)" ForeColor="Red" Display="Dynamic" ValidationGroup="register"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="register"></asp:RegularExpressionValidator>
            </td>
            </tr>                        
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Phone:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox" MaxLength="20" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="register"></asp:RequiredFieldValidator>
            </td>
            </tr>                       
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Date Of Birth:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="TextBox" placeholder="mm/dd/yyyy" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="register"></asp:RequiredFieldValidator>
                <asp:CalendarExtender ID="txtDateOfBirth_CalendarExtender" runat="server" CssClass="orange" Enabled="True" Format="MM/dd/yyyy" TargetControlID="txtDateOfBirth">
                </asp:CalendarExtender>                
            </td>
            </tr>
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Gender:
                </strong></td>
            <td align="left" valign="top">
                <asp:RadioButtonList ID="rdbtnGender" runat="server" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="10" CssClass="RadioButton">
                    <asp:ListItem Selected="True" Text="Male" Value="true"></asp:ListItem>
                    <asp:ListItem Text="FeMale" Value="fasle"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            </tr>
            <tr>
            <td></td>
            <td><asp:Button ID="btnRegister" runat="server" class="button" Text="Register Now" ValidationGroup="register" OnClick="btnRegister_Click" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lbMessage" runat="server" Font-Bold="True" ForeColor="#0000CC"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>
