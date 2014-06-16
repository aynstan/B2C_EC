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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full_w">
        <div class="h_title">Details Product</div>
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
                            Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Price Old
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPriceOld" CssClass="decimal text err" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">Price New
                            </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPriceNew" CssClass="decimal text err" runat="server"></asp:TextBox>
                        <label id="checkReturn"></label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Manufacturer
                        </label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlManufacturer" runat="server" DataTextField="Name" DataValueField="ID">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Product Type
                        </label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProductType" runat="server" DataTextField="Name" DataValueField="ID">
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
                        <CKEditor:CKEditorControl ID="CKEditorControlDescription" runat="server"></CKEditor:CKEditorControl>
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
                                <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="gvImages_RowDeleting">
                                    <Columns>
                                        <asp:ImageField DataImageUrlField="Image" DataImageUrlFormatString="~/Resources/ImagesProduct/{0}" HeaderText="Image">
                                        </asp:ImageField>
                                        <asp:CheckBoxField DataField="IsDefault" HeaderText="Default" />
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
                            Is Active
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkActive" runat="server" Text="Active" Checked="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Is Best Selling
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkBestSelling" runat="server" Text="Best Selling" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Is New
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkNew" runat="server" Checked="True" Text="New" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Is Special
                        </label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkSpecial" runat="server" Text="Special" />
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
