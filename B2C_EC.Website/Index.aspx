<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="B2C_EC.Website.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Promotion" runat="server">
    <div class="banner">
        <div class="slides">
            <div class="slides_container">
                <div class="imgeslider">
                    <img src="Resources/ImagesDesign/lapy.jpg" alt="lapy" title="product" />
                    <div class="banner-text">
                        <h1>Lorem Ipsum</h1>
                        <span>Lorem Ipsum is simply</span>
                        <p>Lorem Ipsum is simply dummy text of the printing</p>
                        <a href="#">Click Here <span></span></a>
                    </div>
                </div>
                <div class="imgeslider">
                    <img src="Resources/ImagesDesign/lapy.jpg" alt="lapy" title="product" />
                    <div class="banner-text">
                        <h1>Lorem Ipsum</h1>
                        <span>Lorem Ipsum is simply</span>
                        <p>Lorem Ipsum is simply dummy text of the printing</p>
                        <a href="#">Click Here <span></span></a>
                    </div>
                </div>
                <div class="imgeslider">
                    <img src="Resources/ImagesDesign/lapy.jpg" alt="lapy" title="product" />
                    <div class="banner-text">
                        <h1>Lorem Ipsum</h1>
                        <span>Lorem Ipsum is simply</span>
                        <p>Lorem Ipsum is simply dummy text of the printing</p>
                        <a href="#">Click Here <span></span></a>
                    </div>
                </div>
                <div class="imgeslider">
                    <img src="Resources/ImagesDesign/lapy.jpg" alt="lapy" title="product" />
                    <div class="banner-text">
                        <h1>Lorem Ipsum</h1>
                        <span>Lorem Ipsum is simply</span>
                        <p>Lorem Ipsum is simply dummy text of the printing</p>
                        <a href="#">Click Here <span></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
        <asp:Repeater ID="rptProductType" runat="server" OnItemDataBound="rptProductType_ItemDataBound">
            <ItemTemplate>
                <div class="TableTitle">
                    <h2><%# Eval("Name") %></h2>
                    <asp:HiddenField ID="hdfProductTypeID" Value='<%# Eval("ID") %>' runat="server" />
                </div>
                <div class="ListBorder">
                    <div class="product-des">
                        <asp:Repeater ID="rptListProduct" runat="server" OnItemDataBound="rptListProduct_ItemDataBound">
                            <ItemTemplate>
                                <div class="product-info last-p">
                                    <asp:HiddenField ID="hdfProductId" Value='<%# Eval("ID") %>' runat="server" />
                                    <asp:Image ID="imgProduct" runat="server" ImageUrl="~/Resources/ImagesDesign/ipod-tuch.jpg" alt="ipod-tuch" title='<%# Eval("Name") %>' />
                                    <h2><%# Eval("Name") %></h2>
                                    <div class="add"><span><%# Eval("PriceNew","$ {0:#,##0}") %></span><a href="#">Add To Cart</a></div>
                                    <div class="add-to-list">
                                        <ul>
                                            <li><a href="#">Add To Wish List</a></li>
                                            <li><a href="#">+ Add To Compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        
    </div>
    <%--<div class="product-des">
        <div class="product-info">
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
        <div class="product-info last-p">
            <img src="Resources/ImagesDesign/ipod-tuch.jpg" alt="ipod-tuch" title="product" />
            <h2>IPhone 5G</h2>
            <div class="add"><span>$54.123.00</span><a href="#">Add To Cart</a></div>
            <div class="add-to-list ">
                <ul>
                    <li><a href="#">Add To Wish List</a></li>
                    <li><a href="#">+ Add To Compare</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="product-des">
        <div class="product-info">
            <img src="Resources/ImagesDesign/lapy-t.jpg" alt="lapy" title="product" class="lapy" />
            <h2>lAPTOP DV3</h2>
            <div class="add"><span>$2.156.00</span><a href="#">Add To Cart</a></div>
            <div class="add-to-list">
                <ul>
                    <li><a href="#">Add To Wish List</a></li>
                    <li><a href="#">+ Add To Compare</a></li>
                </ul>
            </div>
        </div>
        <div class="product-info">
            <img src="Resources/ImagesDesign/g-camera.jpg" alt="g-camera" title="product" class="lapy" />
            <h2>Galaxy Camera</h2>
            <div class="add"><span>$2.156.00</span><a href="#">Add To Cart</a></div>
            <div class="add-to-list ">
                <ul>
                    <li><a href="#">Add To Wish List</a></li>
                    <li><a href="#">+ Add To Compare</a></li>
                </ul>
            </div>
        </div>
        <div class="product-info last-p">
            <img src="Resources/ImagesDesign/dbl-phone.jpg" alt="dbl-ipad" title="product" class="d-phone" />
            <div class="rotatebg">&nbsp;</div>
            <div class="newrotate">New!</div>
            <h2>Htc Evo 4G</h2>
            <div class="add"><span>$2.156.00</span><a href="#">Add To Cart</a></div>
            <div class="add-to-list ">
                <ul>
                    <li><a href="#">Add To Wish List</a></li>
                    <li><a href="#">+ Add To Compare</a></li>
                </ul>
            </div>
        </div>
    </div>--%>
    </asp:Content>
