﻿<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="NewProducts.aspx.cs" Inherits="B2C_EC.Website.NewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <div class="product-des">
        <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound" OnItemCommand="rptProducts_ItemCommand">
            <ItemTemplate>
                <div class="product-info last-p">
                    <asp:HiddenField ID="hdfProductId" Value='<%# Eval("ID") %>' runat="server" />
                    <asp:Image ID="imgProduct" runat="server" ImageUrl="~/Resources/ImagesDesign/ipod-tuch.jpg" alt="ipod-tuch" title='<%# Eval("Name") %>' />
                    <h2><%# Eval("Name") %></h2>
                    <div class="add"><span><%# Eval("Price","$ {0:#,##0}") %></span><%--<a href="#">Add To Cart</a>--%><asp:LinkButton ID="lnkAddCart" runat="server" CommandName="Add" Text="Add To Cart"></asp:LinkButton></div>
                    <div class="add-to-list">
                        <ul>
                            <li><a href="#">Add To Wish List</a></li>
                            <li><a href="#">+ Add To Compare</a></li>
                        </ul>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <%--<div class="product-info">
            <img src="Resources/ImagesDesign/ipod-tuch.jpg" alt="ipod-tuch" title="product" />
            <h2>Ipod Touch 3G</h2>
            <div class="add"><span>$2.156.00</span><a href="#">Add To Cart</a></div>
            <div class="add-to-list">
                <ul>
                    <li><a href="#">Add To Wish List</a></li>
                    <li><a href="#">+ Add To Compare</a></li>
                </ul>
            </div>
        </div>
        <div class="product-info">
            <img src="Resources/ImagesDesign/iphone-g.jpg" alt="iphone-g" title="product" />
            <div class="rotatebg">&nbsp;</div>
            <div class="newrotate">New!</div>
            <h2>IPhone 4G</h2>
            <div class="add"><span>$45.166.00</span><a href="#">Add To Cart</a></div>
            <div class="add-to-list ">
                <ul>
                    <li><a href="#">Add To Wish List</a></li>
                    <li><a href="#">+ Add To Compare</a></li>
                </ul>
            </div>
        </div>
        <div class="product-info">
            <img src="Resources/ImagesDesign/ipod-tuch.jpg" alt="ipod-tuch" title="product" />
            <h2>IPhone 5G</h2>
            <div class="add"><span>$54.123.00</span><a href="#">Add To Cart</a></div>
            <div class="add-to-list ">
                <ul>
                    <li><a href="#">Add To Wish List</a></li>
                    <li><a href="#">+ Add To Compare</a></li>
                </ul>
            </div>
        </div>--%>
    </div>
</asp:Content>
