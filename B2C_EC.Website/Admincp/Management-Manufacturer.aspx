<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Site.master" AutoEventWireup="true" CodeBehind="Management-Manufacturer.aspx.cs" Inherits="HoangQuanMobile.Website.Admincp.Management_Manufacturer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang Quản Lý Nơi Xuất xứ</title>
    <style>
        .layout {
            background:#4c5e51;
        }
        .layout h2 { margin-left: 40px; padding-left: 0.1em; font-size: 2em; line-height: 1em; font-size:40px;
			font-family: Arial, Helvetica, sans-serif;
			color: white;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Trang Quản Lý Nơi Xuất Xứ</h1>
    <div class="manager">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                Đang xử lý dữ liệu...
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnCategory" runat="server" GroupingText="Mục Nhập Thông Tin Nơi Xuất Xứ">
                    <table>
                        <tr>
                            <td valign="top">Mã NSX:</td>
                            <td valign="top"><asp:TextBox ID="txtManuID" Width="130" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvOriginID" runat="server" ControlToValidate="txtManuID" Display="Dynamic" ErrorMessage="Mã quốc gia không được rỗng" SetFocusOnError="True" >*</asp:RequiredFieldValidator>
                            </td>
                            <td valign="top">Tên NSX:</td>
                            <td valign="top"><asp:TextBox ID="txtManuName" Width="130" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvCountryName" runat="server" ControlToValidate="txtManuName" Display="Dynamic" ErrorMessage="Tên quốc gia không được rỗng" SetFocusOnError="True" >*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">Địa chỉ:</td>
                            <td valign="top">
                                <asp:TextBox ID="txtAddress" runat="server" Width="130" />
                            </td>
                            <td valign="top">Điện thoại:</td>
                            <td valign="top">
                                <asp:TextBox ID="txtPhone" runat="server" Width="130" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">Website:</td>
                            <td valign="top">
                                <asp:TextBox ID="txtWebsite" runat="server" Width="130" />
                            </td>
                            <td valign="top">Ghi chú:</td>
                            <td valign="top">
                                <asp:TextBox ID="txtNote" runat="server" Width="130" />
                            </td>
                        </tr>
                        <tr>
                            <td>Trạng thái</td>
                            <td colspan="3" align="left">
                                <asp:RadioButtonList ID="rbtnStatus" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Enabled="true" Selected="True" Text="Hiện" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Ẩn" Value="0" />
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>Loại Sản Phẩm:</td>
                            <td align="left" colspan="3">
                                <asp:CheckBoxList ID="cblProductType" runat="server" DataTextField="ProductTypeName" DataValueField="ProductTypeId" RepeatColumns="2" Width="100%" BorderStyle="Solid">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                            </td>                            
                        </tr>
                    </table>
                </asp:Panel><br />                
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" /><br />
                <span class="button-met dark"><asp:Button ID="btnInsert" Text="Thêm Mới" runat="server" CssClass="button" BorderWidth="0px" OnClick="btnInsert_Click" /></span>&nbsp;
                <span class="button-met dark"><asp:Button ID="btnUpdate" Text="Cập Nhật" runat="server" CssClass="button" BorderWidth="0px" OnClick="btnUpdate_Click" /></span>

                <br />
                <br />
                <asp:GridView ID="gvManufacturer" runat="server" PageSize="4" AllowPaging="True" OnPageIndexChanging="gvManufacturer_PageIndexChanging" OnRowDeleting="gvManufacturer_RowDeleting" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="947px" OnSelectedIndexChanging="gvManufacturer_SelectedIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="Mã NSX" DataField="ManufacturerId" />
                        <asp:BoundField HeaderText="Tên NSX" DataField="ManufacturerName" />
                        <asp:BoundField DataField="Address" HeaderText="Địa Chỉ" />
                        <asp:BoundField DataField="Phone" HeaderText="Điện Thoại" />
                        <asp:BoundField DataField="Website" HeaderText="Website" />
                        <asp:BoundField DataField="Note" HeaderText="Ghi Chú" />
                        <asp:TemplateField HeaderText="Trạng Thái">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IsActive") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# ((Eval("IsActive").ToString()=="True")?"Hiện":"Ẩn") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="true" />
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
