<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-ProductPriceHistory.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_ProductPriceHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/themes_tablesort/green/style.css" rel="stylesheet" />
    <script src="../Scripts/jquery-latest.js"></script>
    <script src="../Scripts/jquery.tablesorter.js"></script>
    <script src="../Scripts/jquery.tablesorter.pager.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#ContentPlaceHolder1_gvProductPriceHistorys").tablesorter({
                headers: {
                    7: {
                        sorter: false
                    }
                }
            })
            .tablesorterPager({ container: $("#pager") });
        });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="manageproductpricehistory">        
        <h2>Management Product Price History Page</h2>
        <p>Here, All product price history of website will display.</p>
        <div>
            <table align="center" style="margin:15px auto 15px auto">
                <tr>
                    <td>Product ID</td>
                    <td>Product Name</td>
                    <td>Product Type</td>
                    <td>Manufacturer</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtProductID" CssClass="TextBox" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtProductName" CssClass="TextBox" runat="server"></asp:TextBox></td>
                    <td><asp:DropDownList ID="ddlProductType" runat="server" CssClass="Dropdown" DataTextField="Name" DataValueField="ID"></asp:DropDownList></td>
                    <td><asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="Dropdown" DataTextField="Name" DataValueField="ID"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center">
                        <asp:Button ID="btnFilter" runat="server" CssClass="button" OnClick="btnFilter_Click" Text="Filter" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="padding-bottom:20px">
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
                    <asp:GridView ID="gvProductPriceHistorys" DataKeyNames="ID" CssClass="table tablesorter" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvProductPriceHistorys_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Product ID" DataField="Product_ID" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <asp:Label ID="lbProductName" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Price" DataField="Price" DataFormatString="{0:#,###.##}" />
                            <asp:TemplateField HeaderText="Product Type">
                                <ItemTemplate>
                                    <asp:Label ID="lbProductType" runat="server"></asp:Label>
                               </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Manufacturer">
                                <ItemTemplate>
                                    <asp:Label ID="lbManufacturer" runat="server"></asp:Label>
                               </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DateCreated" HeaderText="Date Created" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="table-icon delete" ToolTip="Remove" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="lnkRemove_Click" OnClientClick="return confirm('Do you really want to remove this product price history?');"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <%--<div class="entry">
                        <div class="pagination">
                            <asp:Button ID="btnPre" runat="server" Text="« Prev" CssClass="button" OnClick="btnPre_Click" />
                            <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand" OnItemDataBound="rptPaging_ItemDataBound">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                        CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Button ID="btnNext" runat="server" Text="Next »" CssClass="button" OnClick="btnNext_Click" />
                        </div>
                    </div>--%>
                    <div id="pager" class="pager" style="margin:15px;position:inherit">
	                    <form>
		                    <img src="../Styles/themes_tablesort/first.png" class="first"/>
		                    <img src="../Styles/themes_tablesort/prev.png" class="prev"/>
		                    <input type="text" class="pagedisplay"/>
		                    <img src="../Styles/themes_tablesort/next.png" class="next"/>
		                    <img src="../Styles/themes_tablesort/last.png" class="last"/>
		                    <select class="pagesize">
			                    <option selected="selected"  value="10">10</option>
			                    <option value="20">20</option>
			                    <option value="30">30</option>
			                    <option  value="40">40</option>
		                    </select>
	                    </form>
                    </div>
                <%--</ContentTemplate>l
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnFilter" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </div>        
    </div>

</asp:Content>
