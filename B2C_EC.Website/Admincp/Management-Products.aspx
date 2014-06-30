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

    <link href="../Styles/themes_tablesort/green/style.css" rel="stylesheet" />
    <script src="../Scripts/jquery-latest.js"></script>
    <script src="../Scripts/jquery.tablesorter.js"></script>
    <script src="../Scripts/jquery.tablesorter.pager.js"></script>

    <script type="text/javascript">
    	$(document).ready(function () {
    	    $("#ContentPlaceHolder1_gvProducts").tablesorter({
    	        headers: {
    	            0: {
    	                sorter: false
    	            },
    	            12: {
    	                sorter: false
    	            }
    	        }
    	    })
            .tablesorterPager({ container: $("#pager") });
    	});
	</script>
    
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="manageproduct">        
        <h2>Management Product Page</h2>
        <p>Here, All product of website will display.</p>
        <div>
            <table align="center" style="margin:15px auto 15px auto">
                <tr>
                    <td>Name</td>
                    <td>Product Type</td>
                    <td>Manufacturer</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtName" CssClass="TextBox" runat="server"></asp:TextBox></td>
                    <td><asp:DropDownList ID="ddlProductType" runat="server" CssClass="Dropdown" DataTextField="Name" DataValueField="ID"></asp:DropDownList></td>
                    <td><asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="Dropdown" DataTextField="Name" DataValueField="ID"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center">
                        <asp:Button ID="btnFilter" runat="server" CssClass="button" OnClick="btnFilter_Click" Text="Filter" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="padding-bottom:20px">
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
                    <asp:GridView ID="gvProducts" DataKeyNames="ID" CssClass="table tablesorter" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvProducts_RowDataBound">
                        <Columns>
                            <asp:TemplateField>
                                    <ItemTemplate>
                                        <img alt = "" style="cursor: pointer; height:20px;" src="../resources/admin/plus.png" />
                                        <asp:Panel ID="pnlShippingCartDetail" runat="server" Style="text-align:center; display: none">
                                            <asp:DataList ID="dtlImagesProduct" runat="server" RepeatColumns="4" OnItemCommand="dtlImagesProduct_ItemCommand">
                                                <ItemTemplate>
                                                    <table class="clear">
                                                        <tr>
                                                            <td>
                                                                <asp:Image ID="imgProduct" runat="server" Height="100px" ImageUrl='<%# "~/Resources/ImagesProduct/"+Eval("Image") %>' />
                                                            </td>                                                            
                                                        </tr
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="btnDeleteImage" CommandName="Delete" CommandArgument='<%# Eval("ID") %>' runat="server" OnClientClick="return confirm('Are you sure delete this image?');" CssClass="button" Text="Delete" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lbName" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Price" DataField="Price" DataFormatString="{0:#,###.##}" />
                            <asp:TemplateField HeaderText="Product Type">
                                <ItemTemplate>
                                    <asp:Label ID="lbProductType" runat="server"></asp:Label>
                               </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Manufacturer">
                                <ItemTemplate>
                                    <asp:Label ID="lbManufacturer" runat="server"></asp:Label>
                               </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="IsBestSelling" HeaderText="BestSelling"  ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="IsNew" HeaderText="New" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="IsSpecial" HeaderText="Special" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="IsPromo" HeaderText="Promo" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="DateCreated" HeaderText="Date Created" />
                            <asp:CheckBoxField DataField="IsActive" HeaderText="Active" ItemStyle-HorizontalAlign="Center" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <a href='<%# "EditProduct.aspx?ID="+Eval("ID") %>' class="table-icon edit" title="Edit"></a>
                                    <%--<a href="#" class="table-icon archive" title="Archive"></a>--%>
                                    <%--<a href="#" class="table-icon delete" title="Delete"></a>--%>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="table-icon delete" ToolTip="Remove" CommandArgument='<%# Eval("ID") %>' CausesValidation="false" OnClick="lnkRemove_Click" OnClientClick="return confirm('Do you really want to remove this product?');"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <%--<div class="entry">
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
                    </div>--%>
                    <div id="pager" class="pager" style="margin:15px;position:inherit">
	                    <form>
		                    <img src="../Styles/themes_tablesort/first.png" class="first"/>
		                    <img src="../Styles/themes_tablesort/prev.png" class="prev"/>
		                    <input type="text" class="pagedisplay"/>
		                    <img src="../Styles/themes_tablesort/next.png" class="next"/>
		                    <img src="../Styles/themes_tablesort/last.png" class="last"/>
		                    <select class="pagesize">
			                    <option selected="selected"  value="10">10</option>
			                    <option value="20">20</option>
			                    <option value="30">30</option>
			                    <option  value="40">40</option>
		                    </select>
	                    </form>
                    </div>
                <%--</ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnFilter" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </div>        
    </div>
</asp:Content>
