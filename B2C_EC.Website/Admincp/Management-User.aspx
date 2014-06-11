<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-User.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_User" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full_w">        
        <h2>Management Users Page</h2>
        <p>Here, All users of website will display.</p>
        <div>
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" Width="900px">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                    <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                    <asp:BoundField HeaderText="Address" />
                    <asp:BoundField HeaderText="Phone" DataField="Phone" />
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                    <asp:BoundField HeaderText="IsActive" />
                    <asp:BoundField HeaderText="Keys" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="#" class="table-icon edit" title="Edit"></a>
                            <a href="#" class="table-icon archive" title="Archive"></a>
                            <a href="#" class="table-icon delete" title="Delete"></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
