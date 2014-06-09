<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Site.master" AutoEventWireup="true" CodeBehind="Management-Product.aspx.cs" Inherits="HoangQuanMobile.Website.Admincp.Management_Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
        .auto-style1 {
            width: 147px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Trang Quản Lý Sản Phẩm</h1>
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
                            <td valign="top">Mã SP:</td>
                            <td valign="top"><asp:TextBox ID="txtMaSP" Width="150px" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvOriginID" runat="server" ControlToValidate="txtMaSP" Display="Dynamic" ErrorMessage="Mã quốc gia không được rỗng" SetFocusOnError="True" ForeColor="Red" >*</asp:RequiredFieldValidator>
                            </td>
                            <td valign="top">Tên SP:</td>
                            <td valign="top" class="auto-style1"><asp:TextBox ID="txtTenSP" Width="150px" runat="server" />
                                <asp:RequiredFieldValidator ID="rfvCountryName" runat="server" ControlToValidate="txtTenSP" Display="Dynamic" ErrorMessage="Tên quốc gia không được rỗng" SetFocusOnError="True" ForeColor="Red" >*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">Đơn giá cũ:</td>
                            <td valign="top">
                                <asp:TextBox ID="txtGiaCu" runat="server" Width="150px" />
                            </td>
                            <td valign="top">Đơn giá mới:</td>
                            <td valign="top" class="auto-style1">
                                <asp:TextBox ID="txtGiaMoi" runat="server" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">Hình ảnh minh họa:</td>
                            <td valign="top">
                                <asp:FileUpload ID="fulHinhAnh" runat="server" Width="150px" />
                            </td>
                            <td valign="top">Ghi chú:</td>
                            <td valign="top" class="auto-style1">
                                <asp:TextBox ID="txtNote" runat="server" Width="150px" />
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
                                <asp:DropDownList ID="ddlLoaiSanPham" runat="server" Width="200px" OnSelectedIndexChanged="ddlLoaiSanPham_SelectedIndexChanged" AutoPostBack="True" DataTextField="ProductTypeName" DataValueField="ProductTypeId">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Nhà Sản Xuất:</td>
                            <td align="left" colspan="3">
                                <asp:DropDownList ID="ddlNhaSanXuat" runat="server" Width="200px" DataTextField="ManufacturerName" DataValueField="ManufacturerId">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Chi Tiết Sản Phẩm:</td>
                            <td align="left" colspan="3">                                
                                <asp:DataList ID="dtlAttribute" runat="server" Width="100%">
                                    <HeaderTemplate>
                                        <table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:HiddenField ID="hdfAttributeId" Value='<%# Eval("AttributeId") %>' runat="server" />
                                                <asp:Label ID="lblAttributeName" runat="server" Width="100%" Text='<%# Eval("AttributeName")+": " %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtValue" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:DataList>                                
                                <asp:DataList ID="dtlProductAttribute" runat="server" Width="100%">
                                    <HeaderTemplate>
                                        <table>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:HiddenField ID="hdfAttributeId" runat="server" Value='<%# Eval("AttributeId") %>' />
                                                <asp:Label ID="lblAttributeName" runat="server" Text='<%# Eval("ProductAtrributeDetail.AttributeName")+": " %>' Width="100%"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtValue" Text='<%# Eval("Value") %>' runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td>Diễn giải:</td>
                            <td align="left" colspan="3">
                                <asp:TextBox ID="txtDienGiai" runat="server" style="max-width:300px;" Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox>
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
                <asp:GridView ID="gvProducts" runat="server" AllowPaging="True" OnPageIndexChanging="gvProducts_PageIndexChanging" OnRowDeleting="gvProducts_RowDeleting" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="947px" OnSelectedIndexChanging="gvProducts_SelectedIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="Mã SP" DataField="ProductId" />
                        <asp:BoundField HeaderText="Tên SP" DataField="ProductName" />
                        <asp:BoundField DataField="ProductImage" HeaderText="Hình Ảnh" />
                        <asp:BoundField DataField="ProductPriceOld" HeaderText="Giá Cũ" />
                        <asp:BoundField DataField="ProductPriceNew" HeaderText="Giá Mới" />
                        <asp:BoundField DataField="Description" HeaderText="Ghi Chú" />
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
