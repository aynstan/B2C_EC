<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-UserLock.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_UserLock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="manageuser">        
        <h2>Management Users Lock Page</h2>
        <p>Here, All users lock of website will display.</p>
        <div>
            <table align="center" style="margin:15px auto 15px auto">
                <tr>
                    <td>First Name:</td>
                    <td>Last Name:</td>
                    <td>Username:</td>
                    <td>Email:</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox"></asp:TextBox></td>                    
                    <td><asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtUserName" runat="server" CssClass="TextBox"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align:center">
                        <asp:Button ID="btnFilter" runat="server" CssClass="button" OnClick="btnFilter_Click" Text="Filter" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvUsers" CssClass="table" runat="server" AutoGenerateColumns="False" EmptyDataText="Not found users lock for filter" OnRowDataBound="gvUsers_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                            <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                            <asp:BoundField DataField="Username" HeaderText="Username" />
                            <asp:BoundField HeaderText="Phone" DataField="Phone" />
                            <asp:BoundField HeaderText="Email" DataField="Email" />
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DateCreated" HeaderText="Date Created" />
                            <asp:CheckBoxField DataField="IsAdmin" HeaderText="Admin">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <%--<a href='<%# "EditUser.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>--%>
                                    <asp:LinkButton ID="lnkUnLock" runat="server" CssClass="table-icon unlock" ToolTip="UnLock" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="lnkUnLock_Click" OnClientClick="return confirm('Do you really want to unlock this user?');"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="table-icon delete" ToolTip="Remove" Visible='<%# !Convert.ToBoolean(Eval("IsAdmin")) %>' CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="lnkRemove_Click" OnClientClick="return confirm('Do you really want to remove this user?');"></asp:LinkButton>
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
                        </div>
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
