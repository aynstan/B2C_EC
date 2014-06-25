<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="B2C_EC.Website.ProductDetails" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/style.css" rel="stylesheet" />
    <link href="Styles/component.css" rel="stylesheet" />
    <script src="Scripts/jquery.cbpFWSlider.js"></script>
    <script>
        $(document).ready(function () {
            $('#cbp-fwslider').cbpFWSlider();
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentMain" runat="server">
    <div style="height:400px;">
        <div class="Detail-Left">
            <div id="cbp-fwslider" class="cbp-fwslider">
                <asp:Repeater ID="rptListImages" runat="server">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li><a href="#">
                            <asp:Image ID="Image1" Height="300px" AlternateText='<%# Eval("Image") %>' runat="server" ImageUrl='<%# SetImage(Eval("Image")) %>' />
                        </a></li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
				<%--<ul>	
				    <li><a href="#"><img src="resources/images/1.jpg" alt="img01"/></a></li>

				    <li><a href="#"><img src="resources/images/2.jpg" alt="img02"/></a></li>
	
				    <li><a href="#"><img src="resources/images/3.jpg" alt="img03"/></a></li>
	
				    <li><a href="#"><img src="resources/images/4.jpg" alt="img04"/></a></li>			

				    <li><a href="#"><img src="resources/images/5.jpg" alt="img05"/></a></li>
				</ul>			--%>
            </div>
        </div>
        <div class="Detail-Right">
            <div class="cbp-fwslider2">
                <div class="titleh2">
                    Overview product
                </div>
                <table class="table-detail">
                    <tr>
                        <td style="width: 120px;"><b>Product Name:</b>
                        </td>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Price:</b>
                        </td>
                        <td>
                            <asp:Label ID="lblPrice" runat="server" Text="" ForeColor="#B12704"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 50px;">
                        <td>
                            <b>Quantity:</b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuantity" runat="server" Width="100px"></asp:TextBox>
                            <asp:NumericUpDownExtender ID="txtQuantity_NumericUpDownExtender" runat="server" Enabled="True" Maximum="10" Minimum="1" Step="1" TargetControlID="txtQuantity" Width="100">
                            </asp:NumericUpDownExtender>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btnAddToCart" CssClass="ButtonOrange" runat="server" Text="Add to cart" OnClick="btnAddToCart_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnOrder" CssClass="ButtonOrange" runat="server" Text="Order" OnClick="btnOrder_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="TableDescription">
        <div class="titleh2">
            Product Details
        </div>
        <div class="Description">
            <asp:Literal ID="ltrDetails" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>
