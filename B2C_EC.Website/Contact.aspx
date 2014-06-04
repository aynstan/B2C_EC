<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="B2C_EC.Website.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #ContactForm h6
        {
            font:20px Keble Condensed, Arial, Helvetica, sans-serif;
	        color:#575757;
	        font-weight:100;
	        padding:0px 0px 5px 0px;
	        margin:0px 0px 10px 0px;
        }
        #ContactForm .body
        {
            font:11px Arial, Helvetica, sans-serif;
	        color:#565656;
	        margin:0px;
	        padding:0px;
            vertical-align:text-top;
        }
        #ContactForm .button 
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
    <div id="ContactForm"><br />
        <h6>Contact Form:</h6>
        <table width="97%">
            <tr>
            <td width="70" align="left" valign="top" class="body"><strong>
                First Name:
                </strong></td>
            <td width="280" align="left" valign="top"><asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox" MaxLength="50" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="contact"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Last Name:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox" MaxLength="50" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="contact"></asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Email:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" MaxLength="100" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="(*)" ForeColor="Red" Display="Dynamic" ValidationGroup="contact"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="contact"></asp:RegularExpressionValidator>
            </td>
            </tr>
            <tr>
            <td align="left" valign="top" class="body"><strong>
                Questions / Comments:
                </strong></td>
            <td align="left" valign="top"><asp:TextBox ID="txtComments" runat="server" CssClass="AreaText" Rows="3" TextMode="MultiLine" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtComments" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="contact"></asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td></td>
            <td><asp:Button ID="btnContact" runat="server" class="button" Text="Send Now" OnClick="btnContact_Click" ValidationGroup="contact" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lbMessage" runat="server" Font-Bold="True" ForeColor="#0000CC"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>
