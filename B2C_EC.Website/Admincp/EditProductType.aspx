<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="EditProductType.aspx.cs" Inherits="B2C_EC.Website.Admincp.EditProductType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                            Name
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" CssClass="text err" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ForeColor="Red" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Sort ID
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSortID" CssClass="text err" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">
                            Note
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNote" CssClass="text err" runat="server" Height="100px" TextMode="MultiLine" Width="250px"></asp:TextBox></td>
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
                <asp:Button ID="btnCancel" CssClass="button cancel" runat="server" Text="Cancel" CausesValidation="False" PostBackUrl="~/Admincp/Management-ProductType.aspx" />
            </div>
        </div>
    </div>
</asp:Content>
