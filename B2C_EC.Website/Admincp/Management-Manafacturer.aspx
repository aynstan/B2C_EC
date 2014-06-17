<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-Manafacturer.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_Manafacturer" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="manufacturer">        
        <h2>Management Manufacturer Page</h2>
        <p>Here, All manufacturers of website will display.</p>
        <div>
            <table align="center" style="margin:15px">
                <tr>
                    <td>Manufacturer ID</td>
                    <td>Name</td>
                    <td>Phone</td>
                    <td>Website(url)</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtManufacturerID" runat="server" CssClass="TextBox"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtName" runat="server" CssClass="TextBox"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtWebsite" runat="server" CssClass="TextBox"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="6" align="center"><asp:Button ID="btnFilter" runat="server" CssClass="button" Text="Filter" OnClick="btnFilter_Click" /></td>
                </tr>
            </table>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvManufacturers" runat="server" CssClass="table" AutoGenerateColumns="False" OnRowDataBound="gvManufacturers_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" >
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField HeaderText="Phone" DataField="Phone" />
                            <asp:BoundField HeaderText="Website" DataField="Website" />
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lbAddress" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CheckBoxField HeaderText="IsActive" DataField="IsActive" >
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:CheckBoxField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href='<%# "EditManufacturer.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>
                                    <%--<a href="#" class="table-icon archive" title="Archive"></a>--%>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="table-icon delete" ToolTip="Remove" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="btnRemove_Click" OnClientClick="return confirm('Do you really want to remove this manufacturer?');"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
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
            </asp:UpdatePanel>
            
        </div>
        
    </div>
</asp:Content>
