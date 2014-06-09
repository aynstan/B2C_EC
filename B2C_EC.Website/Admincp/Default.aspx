<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="B2C_EC.Website.Admincp.Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<title>Metro Flexible Navigation</title> 
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" media="all" href="../Styles/metro.css" />
    <script src="../Scripts/MarqueeTitle.js" type="text/javascript"></script>
	<script src="../Scripts/jquery.min.js"></script>
	<script src="../Scripts/jquery.plugins.min.js"></script>
	<script src="../Scripts/metro.js"></script>
	<!--[if lt IE 9]-->
		<script src="../Script/respond.min.js"></script>
	<!--[endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <form id="form1" class="metro-layout horizontal" runat="server">
		<div class="header">
			<h1>TRUNG TÂM ĐIỀU HÀNH WEBSITE <asp:LoginName ID="lnTenDN" runat="server" FormatString="Chào, {0}" />
            <asp:LoginStatus ID="lsDangXuat" CssClass="lsDangXuat" runat="server" LoginText="Đăng Nhập" LogoutText="Đăng Xuất" ForeColor="White" Font-Underline="False" /></h1>
			<div class="controls">
				<span class="down" title="Scroll down"></span>
				<span class="up" title="Scroll up"></span>
				<span class="next" title="Scroll left"></span>
				<span class="prev" title="Scroll right"></span>
				<span class="toggle-view" title="Toggle layout"></span>
			</div>
		</div>
		<div class="content clearfix">
			<div class="items">
                <%--<asp:HyperLink ID="hlQuanLyPNX" runat="server" class="box" href="#">
					<span>Quản lý phiếu nhập - xuất</span>
					<img class="icon" src="../resources/Admin/phieuxuat-nhap.png" alt="" />
				</asp:HyperLink>--%>
				<asp:HyperLink ID="hlQuanLyCL" runat="server" class="box" style="background: #4c5e51;" NavigateUrl="~/Admincp/Manage-ProductType.aspx">
					<span>Quản lý chủng Loại</span>
					<img class="icon big" src="../resources/Admin/chungloai.png" alt="" />
				</asp:HyperLink>
				<asp:HyperLink ID="hlQuanLyNCC" runat="server" NavigateUrl="~/Admincp/Management-Manufacturer.aspx" class="box" style="background: #43b51f;">
					<span>Quản lý nhà sản xuất</span>
					<img class="icon" src="../resources/Admin/nhacungcap.png" alt="" />
				</asp:HyperLink>
				<asp:HyperLink ID="hlHome" runat="server" class="box width2 height2" href="../../Default.aspx">
					<span>Trang Chủ</span>
					<img class="cover" src="../resources/Admin/gallery.jpg" alt="" />
				</asp:HyperLink>
				<asp:HyperLink ID="hlQuanLyDDH" runat="server" NavigateUrl="~/Admincp/Management-ShoppingCart.aspx" class="box" style="background: #00aeef;">
					<span>Quản lý đơn đặt hàng</span>
					<img class="icon" src="../resources/Admin/dondathang-chitiet.png" alt="" />
				</asp:HyperLink>
                <%--<asp:HyperLink ID="hlQuanLyXX" runat="server" class="box" style="background: #f874a4;">
					<span>Quản lý nơi xuất xứ</span>
					<img class="icon" src="../resources/Admin/dribbble.png" alt="" />
				</asp:HyperLink>--%>
				<!--<asp:HyperLink ID="hlFF" runat="server" class="box" href="#" style="background: #f58d00;">
					<span>Firefox</span>
					<img class="icon" src="../Image/Admin/firefox.png" alt="" />
				</asp:HyperLink>-->
                <%--<asp:HyperLink ID="hlTuVan" runat="server" class="box" href="#" style="background: #640f6c;">
					<span>Tư vấn</span>
					<img class="icon" src="../resources/Admin/tuvan.png" alt="" />
				</asp:HyperLink>--%>
				<asp:HyperLink ID="hlQuanLyKH" runat="server" NavigateUrl="~/Admincp/Management-Customer.aspx" class="box height2" style="background: #d32c2c;">
					<span>Quản lý khách hàng</span>
					<img class="icon big" src="../resources/Admin/nhanvien-khachhang.png" alt="" />
				</asp:HyperLink>
				<asp:HyperLink ID="hlQuanLySP" runat="server" NavigateUrl="~/Admincp/Management-Product.aspx" class="box" style="background: #3c5b9b;">
					<span>Quản lý sản phẩm</span>
					<img class="icon" src="../resources/Admin/sanpham.png" alt="" />
				</asp:HyperLink>
				<asp:HyperLink ID="hlQuanLyHD" runat="server" class="box" style="background: #ffc808;" NavigateUrl="~/Admincp/Management-Order.aspx">
					<span>Quản lý hóa đơn</span>
					<img class="icon" src="../resources/Admin/vitri.png" alt="" />
				</asp:HyperLink>
				<asp:HyperLink ID="hlQuanLyUser" runat="server" NavigateUrl="~/Admincp/Management-User.aspx" class="box" href="#" style="background: #6b6b6b;">
					<span>Quản lý quản trị viên</span>
					<img class="icon" src="../resources/Admin/settings.png" alt="" />
				</asp:HyperLink>
				
			</div>
		</div>
    </form>
</body>
</html>

