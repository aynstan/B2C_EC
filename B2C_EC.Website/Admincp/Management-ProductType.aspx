<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-ProductType.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_ProductType" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full_w">        
        <h2>Management Product Type Page</h2>
        <p>Here, All product type of website will display.</p>
        <div>
            <table class="table">
                <tr>
                            <td>Name:</td>
                            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                            <td>Status:</td>
                            <td><asp:DropDownList ID="ddlStatus" runat="server">
                                <asp:ListItem Value="0">--All--</asp:ListItem>
                                <asp:ListItem Value="1">Active</asp:ListItem>
                                <asp:ListItem Value="2">Best Selling</asp:ListItem>
                                <asp:ListItem Value="3">Special</asp:ListItem>
                                <asp:ListItem Value="4">New</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnFilter" runat="server" CssClass="button" OnClick="btnFilter_Click" Text="Filter" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
            </table>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvProductType" CssClass="table" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" />
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField HeaderText="Sort ID" DataField="SortId" />
                            <asp:BoundField HeaderText="Note" DataField="Note" />
                            <asp:CheckBoxField HeaderText="IsActive" DataField="IsActive" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href='<%# "EditProductType.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>
                                    <a href="#" class="table-icon archive" title="Archive"></a>
                                    <a href="#" class="table-icon delete" title="Delete"></a>
                                </ItemTemplate>
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
                            <%--<span>« First</span>
                    <span class="active">1</span>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <span>...</span>
                    <a href="">23</a>
                    <a href="">24</a>
                    <a href="">Last »</a>--%>
                        </div>
                        &nbsp;
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnFilter" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            
        </div>
        
    </div>
</asp:Content>
