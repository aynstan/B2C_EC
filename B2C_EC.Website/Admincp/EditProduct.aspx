<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="B2C_EC.Website.Admincp.EditProduct" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
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
    <style type="text/css">
        .auto-style1
        {
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="editproduct">
        <h2>Update Product Page</h2>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="editproduct"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">Price
                            </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrice" CssClass="decimal TextBox" runat="server"></asp:TextBox>
                        <label id="checkReturn"></label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="(*)" ForeColor="Red" ValidationGroup="editproduct"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <label for="name">
                            Product Type
                        </label>
                    </td>
                    <td class="auto-style1">
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
                    <td colspan="2">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvImages" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="gvImages_RowDeleting">
                                    <Columns>
                                        <asp:ImageField DataImageUrlField="Image" DataImageUrlFormatString="~/Resources/ImagesProduct/{0}" HeaderText="Image">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:ImageField>
                                        <asp:CheckBoxField DataField="IsDefault" HeaderText="Default">
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:CheckBoxField>
                                        <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
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
                <tr>
                    <td>
                        <label for="name">
                            Active
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" runat="server" />
                    </td>
                </tr>
            </table>
            <div class="entry">
                <asp:Button ID="btnSave" CssClass="button add" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="editproduct" />
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-Products.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
