<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-OrderHistory.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/themes_tablesort/green/style.css" rel="stylesheet" />
    <script src="../Scripts/jquery-latest.js"></script>
    <script src="../Scripts/jquery.tablesorter.js"></script>
    <script src="../Scripts/jquery.tablesorter.pager.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#ContentPlaceHolder1_gvOrderHistories").tablesorter({
                headers: {
                    4: {
                        sorter: false
                    }
                }
            })
            .tablesorterPager({ container: $("#pager") });
        });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="manageorderhistory">        
        <h2>Management Order History Page</h2>
        <p>Here, All order history of website will display.</p>
        <div>
            <table align="center" style="margin:15px auto 15px auto">
                <tr>
                    <td>Order ID</td>
                    <td>Order Status</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtOrderID" CssClass="TextBox" runat="server"></asp:TextBox></td>
                    <td><asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="Dropdown" DataTextField="Name" DataValueField="ID"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Button ID="btnFilter" runat="server" CssClass="button" OnClick="btnFilter_Click" Text="Filter" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="padding-bottom:20px">
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
                    <asp:GridView ID="gvOrderHistories" DataKeyNames="ID" CssClass="table tablesorter" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnRowDataBound="gvOrderHistories_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Order ID" DataField="Order_ID" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Order Status">
                                <ItemTemplate>
                                    <asp:Label ID="lbOrderStatus" runat="server"></asp:Label>
                               </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DateCreated" HeaderText="Date Created" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="table-icon delete" ToolTip="Remove" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="lnkRemove_Click" OnClientClick="return confirm('Do you really want to remove this order history?');"></asp:LinkButton>
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
