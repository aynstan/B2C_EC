<%@ Page Title="" Language="C#" MasterPageFile="~/Admincp/Admin.Master" AutoEventWireup="true" CodeBehind="Management-OrderDetails.aspx.cs" Inherits="B2C_EC.Website.Admincp.Management_OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #ContentPlaceHolder1_grvOrderProduct {
            margin: 0;
	        padding: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="orderdetail">
        <h2>Order Details Page</h2>
        <div class="clear" style="padding:15px">
            <table>
                <tr>
                    <td style="width:150px">Order ID:</td>
                    <td>
                        <asp:Label ID="lbOrderID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width:150px">Order Status:</td>
                    <td>
                        <asp:Label ID="lbOrderStatus" runat="server"></asp:Label>
                    </td>
                </tr>                
                <tr>
                    <td style="width:150px">Created Date:</td>
                    <td>
                        <asp:Label ID="lbCreatedDate" runat="server"></asp:Label>
                    </td>
                </tr>                
                <tr>
                    <td style="width:150px">Customer:</td>
                    <td>
                        <asp:Label ID="lbCustomer" runat="server"></asp:Label>
                    </td>
                </tr>                
                <tr>
                    <td style="width:150px">Payment Type:</td>
                    <td>
                        <asp:Label ID="lbPaymentType" runat="server"></asp:Label>
                    </td>
                </tr>                
                <tr>
                    <td style="width:150px">Note:</td>
                    <td>
                        <asp:TextBox ID="txtNote" runat="server" CssClass="AreaText" TextMode="MultiLine" Height="60" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="border-top: 1px solid #ccc;height:15px"></td>
                </tr>
                <tr>                    
                    <td colspan="2">
                        <strong>Recipient information</strong>
                    </td>
                </tr>                                
                <tr>
                    <td style="width:150px">Name:</td>
                    <td>
                        <asp:Label ID="lbName" runat="server"></asp:Label>
                    </td>
                </tr>                                
                <tr>
                    <td style="width:150px">Email:</td>
                    <td>
                        <asp:Label ID="lbEmail" runat="server"></asp:Label>
                    </td>
                </tr>                                
                <tr>
                    <td style="width:150px">Phone:</td>
                    <td>
                        <asp:Label ID="lbPhone" runat="server"></asp:Label>
                    </td>
                </tr>                                
                <tr>
                    <td style="width:150px">Address:</td>
                    <td>
                        <asp:Label ID="lbAddress" runat="server"></asp:Label>
                    </td>
                </tr>  
                <tr>
                    <td colspan="2" style="border-top: 1px solid #ccc;height:15px"></td>
                </tr>
                <tr>                    
                    <td colspan="2">
                        <strong>Product details information</strong>
                    </td>
                </tr>   
                <tr>
                    <td colspan="2">                        
                        <asp:GridView ID="grvOrderProduct" CssClass="table marginpaddingzero" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" Width="100%" OnRowDataBound="grvOrderProduct_RowDataBound">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="imgProduct" runat="server" ImageUrl="~/Resources/ImagesProduct/no-image.png" Height="52" />
                                    </ItemTemplate> 
                                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="lbProductName" runat="server" />
                                    </ItemTemplate> 
                                </asp:TemplateField>
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:#,###.##}" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>                         
                <tr>
                    <td colspan="2" style="text-align:right">
                        Subtotal: <asp:Label ID="lbSubtotal" runat="server"></asp:Label>
                    </td>
                </tr>    
                <tr>
                    <td colspan="2" style="height:15px"></td>
                </tr> 
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Button ID="btnSubmit" CssClass="button" runat="server" Text="Submit" Visible="False" OnClick="btnSubmit_Click"/>
                        <asp:Button ID="btnShipping" CssClass="button" runat="server" Text="Shipping" Visible="False" OnClick="btnShipping_Click"/>
                        <asp:Button ID="btnComplete" CssClass="button" runat="server" Text="Complete" Visible="False" OnClick="btnComplete_Click"/>                        
                        <asp:Button ID="btnRemake" CssClass="button" runat="server" Text="Remake" Visible="False" OnClick="btnRemake_Click"/>
                        <asp:Button ID="btnCancel" CssClass="button" runat="server" Text="Cancel" Visible="False" OnClick="btnCancel_Click"/>
                        <asp:Button ID="btnBack" CssClass="button" runat="server" Text="Back" PostBackUrl="~/Admincp/Management-Order.aspx"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
