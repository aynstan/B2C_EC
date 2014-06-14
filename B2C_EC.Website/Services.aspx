<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="B2C_EC.Website.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <asp:Repeater ID="rptProductType" runat="server" OnItemDataBound="rptProductType_ItemDataBound">
        <ItemTemplate>
            <div class="TableTitle">
                <h2><%# Eval("Name") %></h2>
                <asp:HiddenField ID="hdfProductTypeID" Value='<%# Eval("ID") %>' runat="server" />
            </div>
            <div class="ListBorder">
                <div class="product-des">
                    <asp:Repeater ID="rptListProduct" runat="server" OnItemDataBound="rptListProduct_ItemDataBound" OnItemCommand="rptProducts_ItemCommand">
                        <ItemTemplate>
                            <div class="product-info last-p">
                                <asp:HiddenField ID="hdfProductId" Value='<%# Eval("ID") %>' runat="server" />
                                <asp:Image ID="imgProduct" runat="server" ImageUrl="~/Resources/ImagesDesign/ipod-tuch.jpg" alt="ipod-tuch" title='<%# Eval("Name") %>' />
                                <h2><%# Eval("Name") %></h2>
                                <div class="add">
                                    <span><%# Eval("Price","$ {0:#,##0}") %></span><%--<a href="#">Add To Cart</a>--%><asp:LinkButton ID="lnkAddCart" runat="server" CommandName="Add" Text="Add To Cart"></asp:LinkButton></div>
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
</asp:Content>
