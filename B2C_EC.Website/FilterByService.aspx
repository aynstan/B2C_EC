<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="FilterByService.aspx.cs" Inherits="B2C_EC.Website.FilterByService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            size_li = $("#myList .li").size();
            x = 3;
            $('#myList .li:lt(' + x + ')').show();
            $('#loadMore').click(function () {
                x = (x + 6 <= size_li) ? x + 6 : size_li;
                $('#myList .li:lt(' + x + ')').show();
                $('#showLess').show();
                if (x == size_li) {
                    $('#loadMore').hide();
                }
            });
            $('#showLess').click(function () {
                x = (x - 6 < 0) ? 3 : x - 6;
                $('#myList .li').not(':lt(' + x + ')').hide();
                $('#loadMore').show();
                $('#showLess').show();
                if (x == 3) {
                    $('#showLess').hide();
                }
            });
        });
    </script>
    <style type="text/css">
        #myList .li {
            display:none;
        }
        #loadMore {
            color:#333;
            cursor:pointer;
            clear:both;
        }
        #loadMore:hover {
            color:black;
        }
        #showLess {
            color:red;
            cursor:pointer;
            display:none;
        }
        #showLess:hover {
            color:black;
        }
        .btnmorelist {
        width: 700px;
        border: 1px solid #ddd;
        background: #fafafa;
        padding: 8px;
        margin: 8px 0;
        text-align: center;
        position: relative;
        cursor:pointer;
        }
        .btnmorelist:hover {
        background: #f2f2f2;
        cursor: pointer;
        }
        .btnmorelist:before {
        content: '▼';
        position: absolute;
        right: 43%;
        color: #666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <div id="myList">
        <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound" OnItemCommand="rptProducts_ItemCommand">
            <ItemTemplate>
                <div class="li product-info last-p">
                    <asp:HiddenField ID="hdfProductId" Value='<%# Eval("ID") %>' runat="server" />
                    <a href='<%# "ProductDetails.aspx?ProductId="+Eval("ID") %>'><asp:Image ID="imgProduct" runat="server" Height="182px" ImageUrl="~/Resources/ImagesDesign/ipod-tuch.jpg" alt="ipod-tuch" title='<%# Eval("Name") %>' /></a>
                    <h2><asp:Label ID="lblName" runat="server" Text='<%# ShortString(Eval("Name")) %>' ToolTip='<%# Eval("Name") %>'></asp:Label></h2>
                    <div class="add"><span><%# Eval("Price","$ {0:#,###.##}") %></span><%--<a href="#">Add To Cart</a>--%><asp:LinkButton ID="lnkAddCart" runat="server" CommandName="Add" Text="Add To Cart"></asp:LinkButton></div>
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
    <%--<div id="loadMore">Load more</div>--%>
    <button id="loadMore" class="btnmorelist" type="button">View More</button>
</asp:Content>
