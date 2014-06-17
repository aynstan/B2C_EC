<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="B2C_EC.Website.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/component.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
    <div id="cbp-fwslider" class="cbp-fwslider">
        <asp:Repeater ID="rptListImages" runat="server">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li><a href="#">
                    <img style="height: 300px;" src='<%# "resources/ImagesProduct/"+Eval("Image") %>' alt="" /></a></li>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <div class="TableTitle">
        <h2>Product Details</h2>
    </div>
    <div class="ListBorder">
        <asp:Literal ID="ltrDetails" runat="server"></asp:Literal>
    </div>
</asp:Content>
