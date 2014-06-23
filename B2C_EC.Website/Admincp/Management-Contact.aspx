<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-Contact.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact">        
        <h2>Management Contact Page</h2>
        <p>Here, All contacts of website will display.</p>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvContacts" runat="server" CssClass="table" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" >
                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                            <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                            <asp:BoundField HeaderText="Email" DataField="Email" />
                            <asp:BoundField HeaderText="Comment" DataField="Comment" />
                            <asp:BoundField HeaderText="DateCreated" DataField="DateCreated" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="table-icon delete" ToolTip="Remove" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="btnRemove_Click" OnClientClick="return confirm('Do you really want to remove this contact?');"></asp:LinkButton>
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
