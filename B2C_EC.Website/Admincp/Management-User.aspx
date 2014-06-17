<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-User.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_User" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full_w">        
        <h2>Management Users Page</h2>
        <p>Here, All users of website will display.</p>
        <div>
            <fieldset style="width:98%; margin:5px;">
                <legend><h3>Filter user by:</h3></legend>
                <div>
                    <table class="table" style="width:95%;">
                        <tr>
                            <td>First Name:</td>
                            <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
                            <td>Last Name:</td>
                            <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br /></td>
                            <td>Status:</td>
                            <td><asp:DropDownList ID="ddlStatus" runat="server">
                                <asp:ListItem Value="0">Active</asp:ListItem>
                                <asp:ListItem Value="1">Not Active</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>Username:&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
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
            </fieldset>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvUsers" CssClass="table" runat="server" AutoGenerateColumns="False" EmptyDataText="Not found users for filter" OnRowDataBound="gvUsers_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                            <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                            <asp:BoundField DataField="Username" HeaderText="User Name" />
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Phone" DataField="Phone" />
                            <asp:BoundField HeaderText="Email" DataField="Email" />
                            <asp:BoundField DataField="DateCreated" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Date Created" />
                            <asp:CheckBoxField HeaderText="IsActive" DataField="IsActive" ItemStyle-HorizontalAlign="Center" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href='<%# "EditUser.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>
                                    <%--<a href="#" class="table-icon archive" title="Archive"></a>--%>
                                    <%--<a href="#" class="table-icon delete" title="Delete"></a>--%>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="table-icon delete" ToolTip="Remove" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="lnkRemove_Click" OnClientClick="return confirm('Do you really want to remove this user?');"></asp:LinkButton>
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
                    <asp:AsyncPostBackTrigger ControlID="rptPaging" EventName="ItemCommand" />
                    <asp:AsyncPostBackTrigger ControlID="btnFilter" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            
        </div>
        
    </div>
</asp:Content>
