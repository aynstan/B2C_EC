<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" ViewStateMode="Enabled" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="B2C_EC.Website.Admincp.EditUser" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript">
        var $j = jQuery.noConflict();
        $j(document).ready(function () {
            
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="edituser">
        <h2>Update User Page</h2>
        <div class="clear" style="padding:15px">
            <asp:Label ID="lbMessage" runat="server"></asp:Label>
            <table>
                <tr>
                    <td style="width:150px">
                        <label for="name">
                            First Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtFirstName" ValidationGroup="edituser"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Last Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtLastName" ValidationGroup="edituser"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Username
                        </label>
                    </td>
                    <td>
                        <asp:Label ID="lblUserName" runat="server"></asp:Label>
                        <label id="checkReturn"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Password
                        </label>
                    </td>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" Text="********"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a id="spanChangePassword" runat="server" href="javascript:void(0)">Reset Password</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Phone
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtPhone" ValidationGroup="edituser"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Email
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="(*)" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="edituser"></asp:RegularExpressionValidator>
                        <label id="checkReturnEmail"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Street1:</td>
                    <td><asp:TextBox ID="txtStreet1" runat="server" CssClass="TextBox" MaxLength="50" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStreet1" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="edituser"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                    <tr>
                    <td>
                        Street2:</td>
                    <td><asp:TextBox ID="txtStreet2" runat="server" CssClass="TextBox" MaxLength="50" />
                    </td>
                    </tr>
                    <tr>
                    <td>
                        City:</td>
                    <td><asp:TextBox ID="txtCity" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity" ErrorMessage="(*)" ForeColor="Red" Display="Dynamic" ValidationGroup="edituser"></asp:RequiredFieldValidator>
                    </td>
                    </tr>                        
                    <tr>
                    <td>
                        State:</td>
                    <td><asp:TextBox ID="txtState" runat="server" CssClass="TextBox" MaxLength="20" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtState" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="edituser"></asp:RequiredFieldValidator>
                    </td>
                    </tr>                       
                    <tr>
                    <td>
                        Country:</td>
                    <td><asp:TextBox ID="txtCountry" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCountry" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="edituser"></asp:RequiredFieldValidator>                
                    </td>
                    </tr>
                    <tr>
                    <td>
                        Zip Code:</td>
                    <td>
                        <asp:TextBox ID="txtZipCode" runat="server" CssClass="TextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtZipCode" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="edituser"></asp:RequiredFieldValidator>                
                    </td>
                    </tr>
            </table>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="edituser" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-User.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
