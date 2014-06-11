<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="B2C_EC.Website.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <div id ="viewcart">
        <table align="center" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width:380px">                    
                    <p class="checkoutTitle">RECIPIENT INFORMATION</p>
                    <table style="width:100%">
                        <tr>
                            <td>Full Name</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtFullName" runat="server" CssClass="TextBox" MaxLength="250"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox" MaxLength="50"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" MaxLength="250"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Street</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtStreet" runat="server" CssClass="TextBox" MaxLength="200"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>City</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtCity" runat="server" CssClass="TextBox" MaxLength="100"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>State</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtState" runat="server" CssClass="TextBox" MaxLength="100"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Country</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtCountry" runat="server" CssClass="TextBox" MaxLength="100"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>ZipCode</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtZipCode" runat="server" CssClass="TextBox" MaxLength="50"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Notes</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtNotes" runat="server" CssClass="TextBox" Height="80px" Rows="3" TextMode="MultiLine" MaxLength="350"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
                <td>                    
                    <p class="checkoutTitle">PAYMENT INFORMATION</p>
                </td>
            </tr>
            <tr>
                <td style="height:15px"></td>
            </tr>
            <tr>
                <td align="center" colspan="2" valign="top" style="padding:15px;border:1px dotted">
                    <asp:GridView ID="grvViewCart" runat="server" AutoGenerateColumns="False" CellPadding="5" ShowHeaderWhenEmpty="True"
                        ShowFooter="false" Width="100%" >
                        <Columns>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <a href="#" class="name"><%# Eval("ProductName") %></a>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" >
                            <ItemStyle HorizontalAlign="Center" Width="100px" CssClass="textbox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Price" DataFormatString="${0:#,###.##}" HeaderText="Price"
                                HtmlEncode="False" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Center" Width="150px" ForeColor="#B12704" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="Thanh_tien" DataFormatString="{0:#,##0}" HeaderText=""
                                HtmlEncode="False" ReadOnly="True" />--%>                            
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
                <td style="height:15px"></td>
            </tr>
            <tr>
                <td align="right" colspan="2" style="height: 43px;color:#333;font-weight:bold" valign="top">
                    Subtotal (<asp:Label ID="lbTotalQuantity" runat="server" Text="5"></asp:Label> &nbsp;items): <asp:Label ID="lbTotalPrice" runat="server" Text="$2,162.63" ForeColor="#B12704"></asp:Label>
                </td>
            </tr>
        </table>    
    </div>
</asp:Content>
