<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-Customer.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="customer">        
        <h2>Management Customer Page</h2>
        <p>Here, All customer of website will display.</p>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="ID" >
                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="First Name" DataField="FirstName" />                            
                            <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                            <asp:CheckBoxField HeaderText="Gender" DataField="Gender" >
                            <ItemStyle Width="50px" HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="Phone" HeaderText="Phone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="DateOfBirth" HeaderText="Date Of Birth" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href='<%# "EditProduct.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>
                                    <a href="#" class="table-icon archive" title="Archive"></a>
                                    <a href="#" class="table-icon delete" title="Delete"></a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
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
