<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-Order.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_Order" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">

    <link href="../Styles/themes_tablesort/green/style.css" rel="stylesheet" />
    <script src="../Scripts/jquery-latest.js"></script>
    <script src="../Scripts/jquery.tablesorter.js"></script>
    <script src="../Scripts/jquery.tablesorter.pager.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#ContentPlaceHolder1_gvOrders").tablesorter({
                headers: {
                    8: {
                        sorter: false
                    }
                }
            })
            .tablesorterPager({ container: $("#pager") });
        });
	</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="manufacturer">        
        <h2>Management Order Page</h2>
        <p>Here, All orders of website will display.</p>
        <div>
            <table align="center" style="margin:15px auto 15px auto">
                <tr>
                    <td>Order ID</td>
                    <td>From Date</td>
                    <td>To Date</td>
                    <td>Order Status</td>
                    <td>Customer</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtOrderID" runat="server" CssClass="TextBox"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="txtFromDate" runat="server" placeholder="mm/dd/yyyy" CssClass="TextBox"></asp:TextBox>
                        <asp:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" CssClass="orange" Enabled="True" Format="MM/dd/yyyy" TargetControlID="txtFromDate">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="txtToDate" runat="server" placeholder="mm/dd/yyyy" CssClass="TextBox"></asp:TextBox>
                        <asp:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" CssClass="orange" Enabled="True" Format="MM/dd/yyyy" TargetControlID="txtToDate">
                        </asp:CalendarExtender>
                    </td>
                    <td><asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="Dropdown" DataValueField="ID" DataTextField="Name" ></asp:DropDownList></td>
                    <td><asp:DropDownList ID="ddlCustomer" runat="server" CssClass="Dropdown" DataValueField="ID" DataTextField="FirstName" ></asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="6" align="center"><asp:Button ID="btnFilter" runat="server" CssClass="button" Text="Filter" OnClick="btnFilter_Click" /></td>
                </tr>
            </table>
        </div>
        <div>
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
                    <asp:GridView ID="gvOrders" runat="server" CssClass="table tablesorter" AutoGenerateColumns="False" OnRowDataBound="gvOrders_RowDataBound" ShowHeaderWhenEmpty="True">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" >
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Date Created" DataField="DateCreated" />
                            <asp:BoundField HeaderText="Order Status" />
                            <asp:BoundField HeaderText="Customer Name" />
                            <asp:BoundField HeaderText="Payment" />
                            <asp:BoundField HeaderText="Recipient's Name" />
                            <asp:BoundField HeaderText="Recipient's Phone" />
                            <asp:BoundField HeaderText="Recipient's Address" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href='<%# "Management-OrderDetails.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>
                                </ItemTemplate>
                                <ItemStyle />
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
                        &nbsp;
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
                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>            
        </div>        
    </div>
</asp:Content>
