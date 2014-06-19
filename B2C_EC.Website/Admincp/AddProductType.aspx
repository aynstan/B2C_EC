<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="AddProductType.aspx.cs" Inherits="B2C_EC.Website.Admincp.AddProductType" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="addproducttype">
        <h2>Add New Product Type Page</h2>
        <div class="clear" style="padding:15px">
            <asp:Label ID="lbMessage" runat="server"></asp:Label>
            <table>
                <tr>
                    <td style="width:150px">
                        <label for="name">
                            Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" CssClass="TextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="addproducttype"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Description Template
                        </label>
                    </td>
                    <td>
                        <ckeditor:ckeditorcontrol ID="CKEditorControlDescriptionType" runat="server" Height="300px" Width="700px"></ckeditor:ckeditorcontrol>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Note
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNote" CssClass="TextBox" runat="server" Height="100px" TextMode="MultiLine" Width="250px"></asp:TextBox></td>
                </tr>
                <%--<tr>
                    <td>
                        <label for="name">
                            Active
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" runat="server" CssClass="RadioButton" />
                    </td>
                </tr>--%>
            </table>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Save" OnClick="btnSave_Click"  ValidationGroup="addproducttype" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-ProductType.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
