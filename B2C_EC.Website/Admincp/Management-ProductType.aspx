<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-ProductType.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_ProductType" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full_w">        
        <h2>Management Product Type Page</h2>
        <p>Here, All product type of website will display.</p>
        <div>
            <table style="margin:15px">
                <tr>
                    <td><asp:TextBox ID="txtName" CssClass="TextBox" runat="server" placeholder="Enter Name" ></asp:TextBox></td>
                    <td><asp:Button ID="btnFilter" runat="server" CssClass="button" OnClick="btnFilter_Click" Text="Filter" /></td>
                </tr>
            </table>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvProductType" CssClass="table" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField HeaderText="Note" DataField="Note" />
                            <asp:BoundField DataField="DateCreated" HeaderText="Date Created" />
                            <asp:CheckBoxField HeaderText="Active" DataField="IsActive" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField HeaderText="Parent ID" DataField="ParentID" ItemStyle-HorizontalAlign="Center" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkUp" runat="server" CssClass="table-icon up" ToolTip="Up" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="lnkUp_Click"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkDown" runat="server" CssClass="table-icon down" ToolTip="Down" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="lnkDown_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href='<%# "EditProductType.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="table-icon delete" ToolTip="Remove" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="lnkRemove_Click" OnClientClick="return confirm('Do you really want to remove this product type?');"></asp:LinkButton>
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
