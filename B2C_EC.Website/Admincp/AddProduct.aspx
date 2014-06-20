<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="B2C_EC.Website.Admincp.AddProduct" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script src="../Scripts/jquery.MultiFile.js"></script>
    <script src="../Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //CKEDITOR.replace('txtDescription', {});
            $(".decimal").keypress(function (e) {
                if (e.keyCode == 8 || e.keyCode == 46) return true;
                var val = $(this).val();
                var regex = /^(\+|-)?(\d*\.?\d*)$/;
                if (regex.test(val + String.fromCharCode(e.charCode))) {
                    return true;
                }
                return false;
            });
            $(".integer").keypress(function (e) {
                if (e.keyCode == 8 || e.keyCode == 46) return true;
                var val = $(this).val();
                var regex = /^(\+|-)?(\d*)$/;
                if (regex.test(val + String.fromCharCode(e.charCode))) {
                    return true;
                }
                return false;
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="addproduct">
        <h2>Add New Product Page</h2>
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
                        <asp:TextBox ID="txtName" CssClass="TextBox" runat="server" Width="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="addproduct"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">Price
                            </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPriceNew" CssClass="decimal TextBox" runat="server"></asp:TextBox>
                        <label id="checkReturn"></label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="addproduct"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Product Type
                        </label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProductType" runat="server" CssClass="Dropdown" DataTextField="Name" DataValueField="ID">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Manufacturer
                        </label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="Dropdown" DataTextField="Name" DataValueField="ID">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Description
                        </label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <CKEditor:CKEditorControl ID="CKEditorControlDescription" runat="server" Height="250px" Width="700px"></CKEditor:CKEditorControl>
                    </td>
                </tr>
                <tr>
                    <td>
                        Image Default</td>
                    <td>
                        <asp:FileUpload ID="fulImageDefault" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        More Images</td>
                    <td>
                        <asp:FileUpload ID="FileUploadJquery" runat="server"
                            class="multi" accept="jpg|png" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            New
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkNew" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            BestSelling
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkBestSelling" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Special
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkSpecial" runat="server" />
                    </td>
                </tr>
            </table>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="addproduct" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-Products.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
