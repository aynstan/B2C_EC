<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="B2C_EC.Website.WishList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
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
</asp:Content>