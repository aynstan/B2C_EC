<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-Products.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_Products" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "../resources/admin/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "../resources/admin/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
    <style type="text/css">
        .Grid td
        {
            background-color: #A1DCF2;
            color: black;
            font-size: 10pt;
            line-height:200%
        }
        .Grid th
        {
            background-color: #3AC0F2;
            color: White;
            font-size: 10pt;
            line-height:200%
        }
        .ChildGrid td
        {
            background-color: #eee !important;
            color: black;
            font-size: 10pt;
            line-height:200%
        }
        .ChildGrid th
        {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height:200%
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="full_w">        
        <h2>Management Product Page</h2>
        <p>Here, All product of website will display.</p>
        <div>
            <fieldset style="width:98%; margin:5px;">
                <legend><h3>Filter user by:</h3></legend>
                <div>
                    <table class="table" style="width:95%;">
                        <tr>
                            <td>Name:</td>
                            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                            <td>Price from:</td>
                            <td><asp:TextBox ID="txtPriceFrom" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Price to:</td>
                            <td><asp:TextBox ID="txtPriceTo" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPriceTo" ControlToValidate="txtPriceFrom" ErrorMessage="(*)" ForeColor="Red" Operator="LessThanEqual" Type="Integer"></asp:CompareValidator>
                                <br /></td>
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
            </fieldset>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvProducts" DataKeyNames="ID" CssClass="table" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvProducts_RowDataBound">
                        <Columns>
                            <asp:TemplateField>
                                    <ItemTemplate>
                                        <img alt = "" style="cursor: pointer; height:20px;" src="../resources/admin/plus.png" />
                                        <asp:Panel ID="pnlShippingCartDetail" runat="server" Style="text-align:center; display: none">
                                            <asp:GridView ID="gvImagesProduct" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid">
                                                <Columns>
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="Id" HeaderText="Image ID" />
                                                    <asp:BoundField ItemStyle-Width="150px" DataField="Image" HeaderText="Image" />
                                                    <asp:CheckBoxField ItemStyle-Width="150px" DataField="IsDefault" HeaderText="Default Image" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# "~/resources/ImagesProduct/"+Eval("Image") %>' Height="100px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action">
                                                        <ItemTemplate>
                                                            <%--<a href='<%# "EditProduct.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>--%>
                                                            <%--<a href="#" class="table-icon archive" title="Archive"></a>--%>
                                                            <%--<a href="#" class="table-icon delete" title="Delete"></a>--%>
                                                            <asp:Button ID="btnDeleteImage" CssClass="button table-icon delete" runat="server" ToolTip="Delete" Text="" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:BoundField HeaderText="ID" DataField="ID" />
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <%--<asp:BoundField HeaderText="PriceOld" DataField="PriceOld" DataFormatString="{0:#,##0}" />--%>
                            <asp:BoundField HeaderText="Price" DataField="Price" DataFormatString="{0:#,###.##}" />
                            <asp:BoundField DataField="DateCreated" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Date Created" />
                            <asp:CheckBoxField HeaderText="Best Selling" DataField="IsBestSelling" />
                            <asp:CheckBoxField DataField="IsNew" HeaderText="New" />
                            <asp:CheckBoxField DataField="IsSpecial" HeaderText="Special" />
                            <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href='<%# "EditProduct.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>
                                    <%--<a href="#" class="table-icon archive" title="Archive"></a>--%>
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
