<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-User.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_User" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full_w">        
        <h2>Management Users Page</h2>
        <p>Here, All users of website will display.</p>
        <div>
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                    <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                    <asp:BoundField HeaderText="Phone" DataField="Phone" />
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                    <asp:CheckBoxField HeaderText="IsActive" DataField="IsActive" />
                    <asp:BoundField HeaderText="Keys" DataField="Keys" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href='<%# "UserDetails.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>
                            <a href="#" class="table-icon archive" title="Archive"></a>
                            <a href="#" class="table-icon delete" title="Delete"></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="entry">
                <div class="pagination">
                    <span>« First</span>
                    <span class="active">1</span>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <span>...</span>
                    <a href="">23</a>
                    <a href="">24</a>
                    <a href="">Last »</a>
                </div>
                &nbsp;
            </div>
        </div>
        
    </div>
</asp:Content>
