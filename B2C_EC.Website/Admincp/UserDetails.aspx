<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="B2C_EC.Website.Admincp.UserDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full_w">
        <div class="h_title">Details User</div>
        <div class="clear">
            <table>
                <tr>
                    <td style="width:20%;">
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
                        <asp:TextBox ID="txtLastName" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            User Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Password
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Confirm Password
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirm" CssClass="text err" runat="server"></asp:TextBox></td>
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
                        <asp:TextBox ID="txtPhone" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Email
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Is Active
                        </label>
                    </td>
                    <td>
                        <asp:RadioButton ID="brtnActive" runat="server" GroupName="Active" Text="Active" Checked="True" />
&nbsp;&nbsp;
                        <asp:RadioButton ID="rbtnNotActive" runat="server" GroupName="Active" Text="Not Active" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Keys
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKeys" CssClass="text err" runat="server"></asp:TextBox></td>
                </tr>
            </table>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Save" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" />
            </div>
        </div>
    </div>
</asp:Content>
