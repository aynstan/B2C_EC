<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Site.master" AutoEventWireup="true" CodeBehind="Manage-ProductType.aspx.cs" Inherits="HoangQuanMobile.Website.Admincp.Manage_ProductType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .layout {
            background:#4c5e51;
        }
        .layout h2 { margin-left: 40px; padding-left: 0.1em; font-size: 2em; line-height: 1em; font-size:40px;
			font-family: Arial, Helvetica, sans-serif;
			color: #504f4f;
			text-shadow: 0px 2px 1px #333;
        }
        .manager {
            clear: both;
            width: 100%;
            margin-left: 20px;
            width:950px;
            padding-bottom:10px;
        }
        footer {
            clear:both;
            text-align:right;
            padding-top:30px;
            padding-bottom:20px;
            background:#0d0d0d;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="padding-left:20px;">Trang quản lý loại sản phẩm</h1>
    <div class="manager">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" >
            <ProgressTemplate>
                Đang xử lý dữ liệu...
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>                
                <asp:Panel ID="pnCategory" runat="server" GroupingText="Mục Nhập Thông Tin Chủng Loại">
                    <table>
                        <tr>
                            <td>Mã Chủng Loại:</td>
                            <td>
                                <asp:TextBox ID="txtCatID" Width="130" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvCateID" runat="server" ControlToValidate="txtCatID" Display="Dynamic" ErrorMessage="Mã chủng loại không được rỗng" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revCatID" runat="server" ControlToValidate="txtCatID" Display="Dynamic" ErrorMessage="Không nhập ký tự đặc biệt" ValidationExpression="[A-Za-z]{0,}" SetFocusOnError="True">*</asp:RegularExpressionValidator>
                            </td>
                            <td>Tên Chủng Loại:</td>
                            <td>
                                <asp:TextBox ID="txtCatName" Width="130" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvCatName" runat="server" ControlToValidate="txtCatName" Display="Dynamic" ErrorMessage="Tên chủng loại không được rỗng" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Mô tả:</td>
                            <td>
                                <asp:TextBox ID="txtDesc" Width="130" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="Mô tả không được rỗng" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Trạng thái:</td>
                            <td colspan="3" align="left">
                                <asp:RadioButtonList ID="rbtnStatus" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Enabled="true" Selected="True" Text="Hiện" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Ẩn" Value="0" />
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>Nhà sản xuất:</td>
                            <td align="left" colspan="3">
                                <asp:CheckBoxList ID="cblManufacturer" runat="server" DataTextField="ManufacturerName" DataValueField="ManufacturerId" RepeatColumns="2" Width="100%">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" /><br />
        <span class="button-met dark"><asp:Button ID="btnInsert" Text="Thêm Mới" runat="server" CssClass="button" BorderWidth="0px" OnClick="btnInsert_Click" /></span>&nbsp;
        <span class="button-met dark"><asp:Button ID="btnUpdate" Text="Cập Nhật" runat="server" CssClass="button" BorderWidth="0px" OnClick="btnUpdate_Click" /></span>
        <br />
        <br />
        <asp:GridView ID="gvCategory" runat="server"  AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="947px" OnSelectedIndexChanging="gvCategory_SelectedIndexChanging" OnRowDeleting="gvCategory_RowDeleting" OnPageIndexChanging="gvCategory_PageIndexChanging" PageSize="4" AllowPaging="True">
            <Columns>
                <asp:BoundField HeaderText="Mã Chủng Loại" DataField="ProductTypeId" />
                <asp:BoundField HeaderText="Tên Chủng Loại" DataField="ProductTypeName" />
                <asp:BoundField HeaderText="Mô Tả" DataField="Note" />
                <%--<asp:BoundField HeaderText="Liên kết" DataField="pagesite" />--%>
                <asp:TemplateField HeaderText="Trạng Thái">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IsActive") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# ((Eval("IsActive").ToString()=="True")?"Hiện":"Ẩn") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="ProductTypeId" DataNavigateUrlFormatString="~/ProductTypeAttribute.aspx?ProductType={0}" Text="Thuộc Tính" />
                <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa loại sản phẩm này');" Text="Xoá"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" VerticalAlign="Top" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            
    </div>
</asp:Content>
