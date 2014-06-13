<%@ Page Title="" Language="C#" MasterPageFile="~/B2C_EC.Master" AutoEventWireup="true" CodeBehind="OrderComplete.aspx.cs" Inherits="B2C_EC.Website.OrderComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Promotion" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Filter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" runat="server">
    <div id ="viewcart">
        <h2>Complete Orders</h2>
        <p>Thank you for purchasing our product ! We will ship your order in as soon as possible !</p>
        <div class="checkoutTitle" style="text-align:center">Ordering Information</div>
        <table style="width:100%" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width:50%">
                    <table style="width:100%" cellpadding="0" cellspacing="0" class="border">
                        <tr>
                            <td colspan="2" class="checkoutTitle" style="padding:10px;text-align:center">Recipient Information</td>
                        </tr>
                        <tr>
                            <td class="border" style="width:130px"><strong>Full Name</strong></td>
                            <td class="border"><asp:Label ID="lbFullName" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="border"><strong>Email</strong></td>
                            <td class="border"><asp:Label ID="lbEmail" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="border"><strong>Phone</strong></td>
                            <td class="border"><asp:Label ID="lbPhone" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="border"><strong>Shipping Address</strong></td>
                            <td class="border"><asp:Label ID="lbShippingAddress" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width:100%;padding-left:3px" cellpadding="0" cellspacing="0" class="border">
                        <tr>
                            <td colspan="2" class="checkoutTitle" style="padding:10px;text-align:center" class="border">Payment Information</td>
                        </tr>
                        <tr>
                            <td class="border" style="width:130px"><strong>Order ID</strong></td>
                            <td class="border"><asp:Label ID="lbOrderID" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="border"><strong>Date Created</strong></td>
                            <td class="border"><asp:Label ID="lbDateCreated" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="border"><strong>Subtotal</strong></td>
                            <td class="border"><asp:Label ID="lbTotalPrice" runat="server" Text="" ForeColor="#B12704"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="border"><strong>Payment Type</strong></td>
                            <td class="border"><asp:Label ID="lbPaymentType" runat="server" ForeColor="#B12704"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
