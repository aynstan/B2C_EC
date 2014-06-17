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
    <div class="full_w">
        <div class="h_title">Details User</div>
        <div class="clear">
            <asp:Literal ID="ltrError" Visible="false" runat="server"></asp:Literal>
            <table class="table">
                <tr>
                    <td style="width: 20%;">
                        <label for="name">
                            ID
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtID" CssClass="text err" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            First Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Last Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            User Name
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Street 1
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStreet1" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Street 2
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStreet2" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            City
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            State
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtState" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Country
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCountry" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            ZipCode
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtZipCode" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Phone
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Email
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is not correct format!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <label id="checkReturnEmail"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Is Active
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" runat="server" Text="Active" />
                    </td>
                </tr>
            </table>
            <div class="entry">

                <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>

            </div>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Save" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-User.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
