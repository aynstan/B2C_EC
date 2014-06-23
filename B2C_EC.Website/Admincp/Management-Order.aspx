<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-Order.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_Order" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvOrders" runat="server" CssClass="table" AutoGenerateColumns="False" OnRowDataBound="gvOrders_RowDataBound">
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
                            <%--<asp:BoundField HeaderText="Note" DataField="Note" />--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a <%--href='<%# "OrderDetails.aspx?ID="+Eval("ID") %>'--%> class="table-icon edit" title="Edit"></a>
                                    <%--<asp:LinkButton ID="lnkRemove" runat="server" CssClass="table-icon delete" ToolTip="Remove" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="btnRemove_Click" OnClientClick="return confirm('Do you really want to remove this order?');"></asp:LinkButton>--%>
                                </ItemTemplate>
                                <ItemStyle />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div class="entry">
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
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>            
        </div>        
    </div>
</asp:Content>
