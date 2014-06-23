<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Compare.aspx.cs" Inherits="B2C_EC.Website.Compare" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="TableDescription">
        <div class="titleh2">
            Compare products
        </div>
        <div class="Description">
            <asp:DataList ID="dtlCompare" CssClass="datalist-compare" runat="server" RepeatColumns="2" Width="100%" OnItemDataBound="dtlCompare_ItemDataBound" OnItemCommand="dtlCompare_ItemCommand">
                <ItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td class="first"><%# Eval("Name") %></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="imgProduct" Height="150px" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Manufacturer: <strong><%# Eval("Manufacturer.Name") %></strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price: <strong><%# Eval("Price","{0:#,###.##} $") %></strong>
                            </td>
                        </tr>
                        <tr>
                            <td><%# Eval("Description") %></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnRemove" CommandArgument='<%# Eval("ID") %>' CommandName="Remove" CssClass="Button" runat="server" Text="Remove" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
