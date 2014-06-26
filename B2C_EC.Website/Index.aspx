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
        <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound" OnItemCommand="rptProducts_ItemCommand">
            <ItemTemplate>
                <div class="product-info last-p">
                    <asp:HiddenField ID="hdfProductId" Value='<%# Eval("ID") %>' runat="server" />
                    <a href='<%# "ProductDetails.aspx?ProductId="+Eval("ID") %>'><asp:Image ID="imgProduct" runat="server" Height="182px" ImageUrl="~/Resources/ImagesDesign/ipod-tuch.jpg" alt="ipod-tuch" title='<%# Eval("Name") %>' /></a>
                    <h2><asp:Label ID="lblName" runat="server" Text='<%# ShortString(Eval("Name")) %>' ToolTip='<%# Eval("Name") %>'></asp:Label></h2>
                    <div class="add"><span><%# Eval("Price","$ {0:#,###.##}") %></span><%--<a href="#">Add To Cart</a>--%><asp:LinkButton ID="lnkAddCart" runat="server" CommandName="Add" Text="Add To Cart"></asp:LinkButton> </div>
                    <div class="add-to-list">
                        <ul>
                            <li><asp:LinkButton ID="lbtnAddWish" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="AddWishList" Text="Add To Wish List"></asp:LinkButton></li>
                            <li><asp:LinkButton ID="lbtnAddCompare" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="AddCompare" Text="+ Add To Compare"></asp:LinkButton></li>
                        </ul>
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
    
    <div id="Reviews" class="TableTitle" style="clear:both;width:702px;">
        <h2>Reviews</h2>
    </div>
    <div style="clear:both;width:700px;border: 1px solid #d5d5d5;">
        <div class="cdInlineAskBoxTitle">
            Customer Questions &amp; Answers
        </div>
        <div class="fb-comments" data-href="https://www.facebook.com/laptrinhvienvietnam2013" data-width="700px" data-numposts="20" data-colorscheme="light"></div>
    </div>
</asp:Content>
