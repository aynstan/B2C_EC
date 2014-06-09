<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Site.master" AutoEventWireup="true" CodeBehind="Management-Order.aspx.cs" Inherits="HoangQuanMobile.Website.Admincp.Management_Order" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
        .layout a{
            padding-left:20px;color:white;text-decoration:none;
        }
        .layout a:hover{
            padding-left:20px;color:#c2baba;text-decoration:none;filter: alpha(opacity=25);
        }
        .auto-style3 {
            width: 297px;
        }
    </style>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .Grid td
        {
            background-color: #A1DCF2;
            color: black;
            font-size: 10pt;
            line-height:200%
        }
        .Grid th
        {
            background-color: #3AC0F2;
            color: White;
            font-size: 10pt;
            line-height:200%
        }
        .ChildGrid td
        {
            background-color: #eee !important;
            color: black;
            font-size: 10pt;
            line-height:200%
        }
        .ChildGrid th
        {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height:200%
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "../resources/admin/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "../resources/admin/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Trang Quản Lý Hóa Đơn Đặt Hàng</h1>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            Đang xử lý dữ liệu...
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            &nbsp; &nbsp; <br />
            <asp:MultiView ID="MutiView1" ActiveViewIndex="0" runat="server">
                <asp:View ID="View1" runat="server">
                    <div class="manager">
                        <asp:Panel ID="pnOrders" runat="server" GroupingText="Mục Lập Đơn Đặt Hàng" ValidationGroup="Orders" >
                            <table>
                                <tr valign="top">
                                    <td>Mã ĐH:</td>
                                    <td>
                                        <asp:TextBox ID="txtMaDH" runat="server" Width="130" />
                                    </td>
                                    <td>Tên khách hàng:</td>
                                    <td>
                                        <asp:TextBox ID="txtTenKH" runat="server"></asp:TextBox>
                                    </td>
                                    <td>Ngày đặt hàng:</td>
                                    <td class="auto-style3"><asp:TextBox ID="txtOrderDate" Width="130" runat="server" />
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtOrderDate" PopupButtonID="Image1"></asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td>Ngày giao hàng:</td>
                                    <td>
                                        <asp:TextBox ID="txtRequiredDate" Width="130" runat="server" />
                                        <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtRequiredDate" PopupButtonID="Image2"></asp:CalendarExtender>
                                    </td>
                                    <td>Địa chỉ:</td>
                                    <td>
                                        <asp:TextBox ID="txtShipAddress" runat="server" Width="130" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td class="auto-style3">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="3">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Trạng thái</td>
                                    <td colspan="5">
                                        <asp:RadioButtonList ID="rb_Status" runat="server" RepeatDirection="Horizontal" Width="300px">
                                            <asp:ListItem Value="True">Đã giao hàng</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="False">Chưa giao hàng</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel><br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Orders" ForeColor="White" /><br />
                        Chú ý: Phải nhập đầy đủ thông tin khi đăng ký nhân viên<br />
                        <span class="button-met dark"><asp:Button ID="btnInsert" Text="Thêm Mới" runat="server" OnClick="btnInsert_Click" CssClass="button" BorderWidth="0px"  ValidationGroup="Orders" /></span>&nbsp;
                        <span class="button-met dark"><asp:Button ID="btnUpdate" Text="Cập Nhật" runat="server" OnClick="btnUpdate_Click" CssClass="button" BorderWidth="0px" ValidationGroup="Orders" /></span>
                        <br />
                        <br />
                        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="947px" OnSelectedIndexChanging="gvOrders_SelectedIndexChanging" AllowPaging="True" OnPageIndexChanging="gvOrders_PageIndexChanging" DataKeyNames="OrderId" OnRowDataBound="gvOrders_RowDataBound" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <img alt = "" style="cursor: pointer; height:20px;" src="../resources/admin/plus.png" />
                                        <asp:Panel ID="pnlShippingCartDetail" runat="server" Style="text-align:center; display: none">
                                            <asp:GridView ID="gvShippingCartDetail" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid">
                                                <Columns>
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="OrderDetailId" HeaderText="Mã CTHĐ" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="OrderId" HeaderText="Mã HĐ" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="ProductId" HeaderText="Mã SP" />
                                                    <asp:TemplateField HeaderText="Tên SP">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Product.ProductName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField ItemStyle-Width="150px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" DataField="Count" HeaderText="Số lượng" />
                                                    <asp:BoundField ItemStyle-Width="150px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" DataField="TotalMoney" DataFormatString="{0:#,##0} VND" HeaderText="Thành tiền" />
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Mã HĐ" DataField="OrderId" />
                                <asp:BoundField HeaderText="Mã KH" DataField="CustomerId" />
                                <asp:TemplateField HeaderText="Họ Tên KH">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Customer.FirstName")+" "+Eval("Customer.MiddleName")+" "+Eval("Customer.LastName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Ngày lập" DataField="Created" DataFormatString="{0:MM/dd/yyyy}" />
                                <asp:BoundField HeaderText="Ngày giao" DataField="ShipDate" DataFormatString="{0:MM/dd/yyyy}" />
                                <asp:TemplateField HeaderText="Trạng Thái">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IsShipped") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# ((Eval("IsShipped").ToString()=="True")?"Đã giao hàng":"Chưa giao hàng") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField SelectText="Sửa" ShowSelectButton="True" />
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
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
