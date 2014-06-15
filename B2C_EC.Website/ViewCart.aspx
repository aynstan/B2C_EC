<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="B2C_EC.Website.ViewCart" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        function selectAll(this_select) {
            e = this_select.form.elements;
            for (i = 0; i < e.length; i++) {
                if (e[i].type == "checkbox" && e[i].id != this_select.id)
                    e[i].checked = this_select.checked;
            }
        }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <div id ="viewcart">
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td colspan="2" valign="middle" style="height: 24px">                    
                    <h2>
                        <asp:Image ID="Image1" runat="server" Height="24px" ImageAlign="AbsMiddle" ImageUrl="~/Resources/ImagesDesign/cart.gif" />
                        Shopping Cart [<asp:Label ID="lbTotalProduct" runat="server" Text="3"></asp:Label>]
                    </h2>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" valign="top">
                    <asp:GridView ID="grvViewCart" runat="server" AutoGenerateColumns="False" CellPadding="5" ShowHeaderWhenEmpty="True"
                        ShowFooter="True" Width="100%" OnRowCancelingEdit="grvViewCart_RowCancelingEdit" OnRowCommand="grvViewCart_RowCommand" OnRowEditing="grvViewCart_RowEditing" OnRowUpdating="grvViewCart_RowUpdating">
                        <FooterStyle BackColor="Silver" Font-Bold="True" HorizontalAlign="Center" />
                        <Columns>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <a href="#" class="name"><%# Eval("ProductName") %></a>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>' MaxLength="2"></asp:TextBox>
                                    <asp:NumericUpDownExtender ID="NumericUpDownExtender2" runat="server"  
                                        TargetControlID="txtQuantity" Width="50" RefValues="" ServiceDownMethod=""  
                                        ServiceUpMethod="" TargetButtonDownID="" TargetButtonUpID="" Minimum = "1"  Maximum = "10" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="textbox" HorizontalAlign="Center" Width="100px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Price" DataFormatString="${0:#,###.##}" HeaderText="Price"
                                HtmlEncode="False" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Center" Width="150px" ForeColor="#B12704" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="Thanh_tien" DataFormatString="{0:#,##0}" HeaderText=""
                                HtmlEncode="False" ReadOnly="True" />--%>
                            <asp:CommandField ShowEditButton="True" >
                            <ItemStyle HorizontalAlign="Center" Width="120px" />
                            </asp:CommandField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkSelectAll" runat="server" OnClick="selectAll(this)" /><br />
                                </HeaderTemplate>
                                <FooterTemplate>
                                    <asp:ImageButton ID="imgbtnRemove" runat="server" CommandName="Remove" ImageUrl="~/Resources/ImagesDesign/delete.gif" />
                                </FooterTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkRemove" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            Your shopping cart is empty
                        </EmptyDataTemplate>
                        <HeaderStyle CssClass="grvHeader" />
                        <AlternatingRowStyle BackColor="WhiteSmoke" />
                        <SelectedRowStyle BackColor="ActiveBorder" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2" style="height: 43px;color:#333;font-weight:bold" valign="top">
                    Subtotal (<asp:Label ID="lbTotalQuantity" runat="server" Text="5"></asp:Label> &nbsp;items): <asp:Label ID="lbTotalPrice" runat="server" Text="$2,162.63" ForeColor="#B12704"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="Button" OnClick="btnBack_Click"/></td>
                <td align="right">
                    <asp:Button ID="btnOrder" runat="server" Text="Order Now" CssClass="Button" PostBackUrl="~/Payment.aspx" />
                </td>
            </tr>
        </table>    
    </div>
</asp:Content>
